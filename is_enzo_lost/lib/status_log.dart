import 'dart:io';

import 'package:is_enzo_lost/status_entry.dart';

/// On disk, [status.json] is a JSON array of [StatusEntry] objects.
class StatusLog {
  final List<StatusEntry> entries;

  const StatusLog(this.entries);

  factory StatusLog.decode(String contents) {
    return StatusLog(decodeStatusEntries(contents));
  }

  String encode() => encodeStatusEntries(entries);

  static Future<StatusLog> readFile(String path) async {
    return StatusLog.decode(await File(path).readAsString());
  }

  static StatusLog readFileSync(String path) {
    return StatusLog.decode(File(path).readAsStringSync());
  }

  Future<void> writeFile(String path) async {
    await File(path).writeAsString(encode());
  }

  bool containsId(String? id) {
    if (id == null) {
      return false;
    }

    return entries.any((entry) => entry.id == id);
  }

  StatusLog withPrepended(StatusEntry entry) {
    return StatusLog([entry, ...entries]);
  }

  StatusEntry latest() {
    if (entries.isEmpty) {
      throw StateError('No status entries available.');
    }

    return entries.reduce(
      (current, next) =>
          next.timestamp.isAfter(current.timestamp) ? next : current,
    );
  }
}
