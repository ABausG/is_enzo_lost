import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

part 'status_entry.mapper.dart';

class StatusTimestampMapper extends SimpleMapper<DateTime> {
  const StatusTimestampMapper();

  @override
  DateTime decode(dynamic value) {
    return DateTime.parse(value as String);
  }

  @override
  String encode(DateTime self) {
    return StatusEntry.formatStatusTimestamp(self);
  }
}

@MappableClass(
  ignoreNull: true,
  includeCustomMappers: [StatusTimestampMapper()],
)
class StatusEntry with StatusEntryMappable {
  final String? id;
  final bool? isLost;
  final String source;
  final String? description;
  final DateTime timestamp;

  const StatusEntry({
    this.id,
    this.isLost,
    required this.source,
    this.description,
    required this.timestamp,
  });

  static String formatStatusTimestamp(DateTime value) {
    return value.toUtc().toIso8601String();
  }
}

String statusDisplay(bool? isLost) => switch (isLost) {
  null => 'MAYBE 🤔',
  true => 'YES 😱',
  false => 'NO 🎉',
};

List<StatusEntry> decodeStatusEntries(String source) {
  StatusEntryMapper.ensureInitialized();
  return MapperContainer.globals.fromJson<List<StatusEntry>>(source);
}

String encodeStatusEntries(List<StatusEntry> entries) {
  final encoded = StatusEntryMapper.ensureInitialized().encodeJson<List<StatusEntry>>(
    entries,
  );
  return '${const JsonEncoder.withIndent('  ').convert(jsonDecode(encoded))}\n';
}
