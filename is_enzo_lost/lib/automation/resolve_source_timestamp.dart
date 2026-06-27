import 'dart:convert';
import 'dart:io';

import 'package:is_enzo_lost/source_url.dart';
import 'package:is_enzo_lost/status_entry.dart';

typedef SourceMatcher = bool Function(String source);
typedef SourceResolver = Future<DateTime?> Function(String source);

class TimestampResolution {
  final DateTime timestamp;
  final String origin;

  const TimestampResolution({
    required this.timestamp,
    required this.origin,
  });
}

Future<Map<String, dynamic>?> httpGetJson(String url) async {
  final client = HttpClient();
  client.connectionTimeout = const Duration(seconds: 10);
  try {
    final request = await client.getUrl(Uri.parse(url));
    request.headers.set('User-Agent', 'is-enzo-lost-status-bot/1.0');
    final response = await request
        .close()
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != HttpStatus.ok) {
      return null;
    }

    final body = await response.transform(utf8.decoder).join();
    final decoded = json.decode(body);
    return decoded is Map<String, dynamic> ? decoded : null;
  } on Object {
    return null;
  } finally {
    client.close();
  }
}

Future<DateTime?> fetchXTimestamp(String username, String tweetId) async {
  final fx = await httpGetJson('https://api.fxtwitter.com/$username/status/$tweetId');
  final fxEpoch = fx?['tweet']?['created_timestamp'];
  final fxMillis = fxEpoch == null ? null : int.tryParse('$fxEpoch');
  if (fx?['code'] == 200 && fxMillis != null) {
    return DateTime.fromMillisecondsSinceEpoch(fxMillis * 1000, isUtc: true);
  }

  final vx = await httpGetJson('https://api.vxtwitter.com/$username/status/$tweetId');
  final vxEpoch = vx?['date_epoch'];
  final vxMillis = vxEpoch == null ? null : int.tryParse('$vxEpoch');
  if (vxMillis != null) {
    return DateTime.fromMillisecondsSinceEpoch(vxMillis * 1000, isUtc: true);
  }

  return null;
}

Future<DateTime?> resolveXStatusTimestamp(String url) async {
  final parsed = parseXStatusUrl(url);
  if (parsed == null) {
    return null;
  }

  return fetchXTimestamp(parsed.username, parsed.tweetId);
}

// Add future source matchers/resolvers here, e.g. Mastodon, Bluesky, etc.
final List<(SourceMatcher, SourceResolver, String origin)> sourceResolvers = [
  (isXStatusUrl, resolveXStatusTimestamp, 'tweet'),
];

Future<TimestampResolution> resolveTimestamp(String source) async {
  for (final (matches, resolver, origin) in sourceResolvers) {
    if (!matches(source)) {
      continue;
    }

    final resolved = await resolver(source);
    if (resolved != null) {
      return TimestampResolution(timestamp: resolved, origin: origin);
    }
  }

  return TimestampResolution(
    timestamp: DateTime.now().toUtc(),
    origin: 'submission',
  );
}

String formatResolvedTimestamp(TimestampResolution resolution) {
  return StatusEntry.formatStatusTimestamp(resolution.timestamp);
}
