// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'status_entry.dart';

class StatusEntryMapper extends ClassMapperBase<StatusEntry> {
  StatusEntryMapper._();

  static StatusEntryMapper? _instance;
  static StatusEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StatusEntryMapper._());
      MapperContainer.globals.useAll([StatusTimestampMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'StatusEntry';

  static String? _$id(StatusEntry v) => v.id;
  static const Field<StatusEntry, String> _f$id = Field('id', _$id, opt: true);
  static bool? _$isLost(StatusEntry v) => v.isLost;
  static const Field<StatusEntry, bool> _f$isLost = Field(
    'isLost',
    _$isLost,
    opt: true,
  );
  static String _$source(StatusEntry v) => v.source;
  static const Field<StatusEntry, String> _f$source = Field('source', _$source);
  static String? _$description(StatusEntry v) => v.description;
  static const Field<StatusEntry, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static DateTime _$timestamp(StatusEntry v) => v.timestamp;
  static const Field<StatusEntry, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );

  @override
  final MappableFields<StatusEntry> fields = const {
    #id: _f$id,
    #isLost: _f$isLost,
    #source: _f$source,
    #description: _f$description,
    #timestamp: _f$timestamp,
  };
  @override
  final bool ignoreNull = true;

  static StatusEntry _instantiate(DecodingData data) {
    return StatusEntry(
      id: data.dec(_f$id),
      isLost: data.dec(_f$isLost),
      source: data.dec(_f$source),
      description: data.dec(_f$description),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StatusEntry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StatusEntry>(map);
  }

  static StatusEntry fromJson(String json) {
    return ensureInitialized().decodeJson<StatusEntry>(json);
  }
}

mixin StatusEntryMappable {
  String toJson() {
    return StatusEntryMapper.ensureInitialized().encodeJson<StatusEntry>(
      this as StatusEntry,
    );
  }

  Map<String, dynamic> toMap() {
    return StatusEntryMapper.ensureInitialized().encodeMap<StatusEntry>(
      this as StatusEntry,
    );
  }

  StatusEntryCopyWith<StatusEntry, StatusEntry, StatusEntry> get copyWith =>
      _StatusEntryCopyWithImpl<StatusEntry, StatusEntry>(
        this as StatusEntry,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StatusEntryMapper.ensureInitialized().stringifyValue(
      this as StatusEntry,
    );
  }

  @override
  bool operator ==(Object other) {
    return StatusEntryMapper.ensureInitialized().equalsValue(
      this as StatusEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return StatusEntryMapper.ensureInitialized().hashValue(this as StatusEntry);
  }
}

extension StatusEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StatusEntry, $Out> {
  StatusEntryCopyWith<$R, StatusEntry, $Out> get $asStatusEntry =>
      $base.as((v, t, t2) => _StatusEntryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StatusEntryCopyWith<$R, $In extends StatusEntry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    bool? isLost,
    String? source,
    String? description,
    DateTime? timestamp,
  });
  StatusEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StatusEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StatusEntry, $Out>
    implements StatusEntryCopyWith<$R, StatusEntry, $Out> {
  _StatusEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StatusEntry> $mapper =
      StatusEntryMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? isLost = $none,
    String? source,
    Object? description = $none,
    DateTime? timestamp,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (isLost != $none) #isLost: isLost,
      if (source != null) #source: source,
      if (description != $none) #description: description,
      if (timestamp != null) #timestamp: timestamp,
    }),
  );
  @override
  StatusEntry $make(CopyWithData data) => StatusEntry(
    id: data.get(#id, or: $value.id),
    isLost: data.get(#isLost, or: $value.isLost),
    source: data.get(#source, or: $value.source),
    description: data.get(#description, or: $value.description),
    timestamp: data.get(#timestamp, or: $value.timestamp),
  );

  @override
  StatusEntryCopyWith<$R2, StatusEntry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StatusEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

