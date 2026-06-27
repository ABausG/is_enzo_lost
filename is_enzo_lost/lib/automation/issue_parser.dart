class IssueFields {
  final String? isLost;
  final String? source;
  final String? description;

  const IssueFields({
    this.isLost,
    this.source,
    this.description,
  });
}

final _fieldPatterns = <String, RegExp>{
  'isLost': RegExp(
    r'###\s*Is Enzo lost\*?\s*\n+\s*(.+?)(?=\n###|$)',
    caseSensitive: false,
    dotAll: true,
  ),
  'source': RegExp(
    r'###\s*Source\s*\n+\s*(.+?)(?=\n###|$)',
    caseSensitive: false,
    dotAll: true,
  ),
  'description': RegExp(
    r'###\s*Description\s*\n+\s*(.+?)(?=\n###|$)',
    caseSensitive: false,
    dotAll: true,
  ),
};

IssueFields parseIssueBody(String body) {
  String? readField(String key) {
    final match = _fieldPatterns[key]!.firstMatch(body);
    if (match == null) {
      return null;
    }

    final value = match.group(1)?.trim();
    if (value == null || value.isEmpty || value == '_No response_') {
      return null;
    }
    return value;
  }

  return IssueFields(
    isLost: readField('isLost'),
    source: readField('source'),
    description: readField('description'),
  );
}

bool? mapIsLost(String? value) => switch (value?.trim().toLowerCase()) {
  null => throw const FormatException('Missing required field: Is Enzo lost'),
  'yes' => true,
  'no' => false,
  'maybe' => null,
  final other => throw FormatException('Invalid Is Enzo lost value: $other'),
};
