import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:is_enzo_lost/status_entry.dart';

part 'status_preview.mapper.dart';

@MappableClass()
class StatusPreviewEntry with StatusPreviewEntryMappable {
  final StatusEntry entry;
  final String timestampOrigin;

  const StatusPreviewEntry({
    required this.entry,
    required this.timestampOrigin,
  });
}

String escapeMarkdownTableCell(String value) {
  return value.replaceAll('|', r'\|').replaceAll('\n', ' ');
}

String formatPreviewComment(StatusPreviewEntry preview, {String? prUrl}) {
  final entry = preview.entry;
  final display = statusDisplay(entry.isLost);
  final formattedTime = StatusEntry.formatStatusTimestamp(entry.timestamp)
      .substring(0, 16)
      .replaceFirst('T', ' ');
  final timestampLabel = switch (preview.timestampOrigin) {
    'tweet' => 'from tweet',
    'source' => 'from source',
    'submission' => 'submission time',
    _ => preview.timestampOrigin,
  };

  final lines = <String>[
    '## Status preview',
    '',
    '# $display',
    '',
    '> Is [Enzo](https://x.com/enzoconty) lost?',
    '',
    '| Field | Value |',
    '| --- | --- |',
    '| **ID** | `${entry.id}` |',
    '| **Status** | $display |',
    '| **Source** | [${escapeMarkdownTableCell(entry.source)}](${entry.source}) |',
    '| **Timestamp** | $formattedTime UTC _($timestampLabel)_ |',
  ];

  if (entry.description != null) {
    lines.add(
      '| **Description** | ${escapeMarkdownTableCell(entry.description!)} |',
    );
  }

  lines.addAll([
    '',
    '### JSON entry',
    '',
    '```json',
    const JsonEncoder.withIndent('  ').convert(entry.toMap()),
    '```',
  ]);

  if (prUrl != null) {
    lines.addAll([
      '',
      'Pull request opened for review: $prUrl',
      '',
      'Once a code owner approves, this will auto-merge and close this issue.',
    ]);
  } else {
    lines.addAll([
      '',
      'A pull request will be opened automatically for review.',
    ]);
  }

  return lines.join('\n');
}
