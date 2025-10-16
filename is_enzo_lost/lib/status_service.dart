import 'dart:convert';
import 'dart:io';

class StatusEntry {
  final bool? isLost;
  final String source;
  final DateTime timestamp;

  const StatusEntry({
    required this.isLost,
    required this.source,
    required this.timestamp,
  });

  factory StatusEntry.fromJson(Map<String, dynamic> json) {
    return StatusEntry(
      isLost: json['isLost'] as bool,
      source: json['source'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

class StatusService {
  static StatusEntry getLatestStatus() {
    try {
      final file = File('../status.json');
      final content = file.readAsStringSync();
      final List<dynamic> data = json.decode(content);

      final List<StatusEntry> entries = data.map((item) => StatusEntry.fromJson(item as Map<String, dynamic>)).toList();

      entries.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      if (entries.isNotEmpty) {
        return entries.first;
      }

      throw Exception('No entries found in status.json');
    } catch (e) {
      return StatusEntry(
        isLost: null,
        source: 'https://x.com/enzoconty',
        timestamp: DateTime.now(),
      );
    }
  }
}
