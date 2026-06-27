import 'dart:io';

import 'package:is_enzo_lost/automation/process_status_issue.dart';
import 'package:is_enzo_lost/automation/resolve_source_timestamp.dart';
import 'package:is_enzo_lost/automation/status_preview.dart';

Future<void> main(List<String> args) async {
  try {
    if (args.isEmpty) {
      _printUsage();
      exit(1);
    }

    switch (args.first) {
      case 'format-preview':
        await _formatPreview(args);
      case 'resolve-timestamp':
        await _resolveTimestamp(args);
      default:
        await _processIssue(args);
    }
  } on Object catch (error) {
    stderr.writeln('Error: $error');
    exit(1);
  }
}

Future<void> _processIssue(List<String> args) async {
  if (args.length < 3 || args.length > 4) {
    _printUsage();
    exit(1);
  }

  final bodyPath = args[0];
  final issueNumber = args[1];
  final statusJsonPath = args[2];
  final previewOutputPath = args.length == 4 ? args[3] : null;

  final processor = ProcessStatusIssue();
  final preview = await processor.buildPreviewEntry(
    issueBody: await File(bodyPath).readAsString(),
    issueNumber: issueNumber,
  );

  if (previewOutputPath != null) {
    await processor.writePreviewArtifacts(
      preview: preview,
      previewOutputPath: previewOutputPath,
    );
  }

  final added = await processor.addEntryToStatusFile(
    preview: preview,
    statusJsonPath: statusJsonPath,
  );

  if (!added) {
    exit(0);
  }
}

Future<void> _formatPreview(List<String> args) async {
  if (args.length < 2 || args.length > 3) {
    stderr.writeln(
      'Usage: dart run bin/process_status_issue.dart format-preview <entry_json_file> [pr_url]',
    );
    exit(1);
  }

  final preview = StatusPreviewEntryMapper.fromJson(
    await File(args[1]).readAsString(),
  );
  stdout.writeln(formatPreviewComment(preview, prUrl: args.length == 3 ? args[2] : null));
}

Future<void> _resolveTimestamp(List<String> args) async {
  if (args.length != 2) {
    stderr.writeln(
      'Usage: dart run bin/process_status_issue.dart resolve-timestamp <source_url>',
    );
    exit(1);
  }

  final resolution = await resolveTimestamp(args[1]);
  stdout.writeln(
    '${formatResolvedTimestamp(resolution)} (${resolution.origin})',
  );
}

void _printUsage() {
  stderr.writeln(
    'Usage: dart run bin/process_status_issue.dart <issue_body_file> <issue_number> <status_json_path> [preview_output_file]',
  );
  stderr.writeln(
    '       dart run bin/process_status_issue.dart format-preview <entry_json_file> [pr_url]',
  );
  stderr.writeln(
    '       dart run bin/process_status_issue.dart resolve-timestamp <source_url>',
  );
}
