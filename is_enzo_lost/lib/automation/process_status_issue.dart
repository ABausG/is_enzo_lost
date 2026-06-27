import 'dart:io';

import 'package:is_enzo_lost/automation/issue_parser.dart';
import 'package:is_enzo_lost/automation/resolve_source_timestamp.dart';
import 'package:is_enzo_lost/automation/status_preview.dart';
import 'package:is_enzo_lost/status_entry.dart';
import 'package:is_enzo_lost/status_log.dart';

class ProcessStatusIssue {
  Future<StatusPreviewEntry> buildPreviewEntry({
    required String issueBody,
    required String issueNumber,
  }) async {
    final fields = parseIssueBody(issueBody);
    final isLost = mapIsLost(fields.isLost);
    final source = fields.source?.trim();
    if (source == null || source.isEmpty) {
      throw const FormatException('Missing required field: Source');
    }

    final description = fields.description?.trim();
    final timestamp = await resolveTimestamp(source);

    return StatusPreviewEntry(
      entry: StatusEntry(
        id: issueNumber,
        isLost: isLost,
        source: source,
        description: description == null || description.isEmpty ? null : description,
        timestamp: timestamp.timestamp,
      ),
      timestampOrigin: timestamp.origin,
    );
  }

  Future<bool> addEntryToStatusFile({
    required StatusPreviewEntry preview,
    required String statusJsonPath,
  }) async {
    final log = await StatusLog.readFile(statusJsonPath);

    if (log.containsId(preview.entry.id)) {
      stdout.writeln('Entry with id ${preview.entry.id} already exists, skipping.');
      return false;
    }

    await log.withPrepended(preview.entry).writeFile(statusJsonPath);
    stdout.writeln('Added status entry ${preview.entry.id}');
    return true;
  }

  Future<void> writePreviewArtifacts({
    required StatusPreviewEntry preview,
    required String previewOutputPath,
  }) async {
    final previewFile = File(previewOutputPath);
    await previewFile.parent.create(recursive: true);

    final entryPath = previewOutputPath.endsWith('.md')
        ? previewOutputPath.replaceAll(RegExp(r'\.md$'), '.entry.json')
        : '$previewOutputPath.entry.json';
    await File(entryPath).writeAsString('${preview.toJson()}\n');
    await previewFile.writeAsString('${formatPreviewComment(preview)}\n');
  }
}
