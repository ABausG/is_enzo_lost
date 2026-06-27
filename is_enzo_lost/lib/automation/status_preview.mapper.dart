// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'status_preview.dart';

class StatusPreviewEntryMapper extends ClassMapperBase<StatusPreviewEntry> {
  StatusPreviewEntryMapper._();

  static StatusPreviewEntryMapper? _instance;
  static StatusPreviewEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StatusPreviewEntryMapper._());
      StatusEntryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StatusPreviewEntry';

  static StatusEntry _$entry(StatusPreviewEntry v) => v.entry;
  static const Field<StatusPreviewEntry, StatusEntry> _f$entry = Field(
    'entry',
    _$entry,
  );
  static String _$timestampOrigin(StatusPreviewEntry v) => v.timestampOrigin;
  static const Field<StatusPreviewEntry, String> _f$timestampOrigin = Field(
    'timestampOrigin',
    _$timestampOrigin,
  );

  @override
  final MappableFields<StatusPreviewEntry> fields = const {
    #entry: _f$entry,
    #timestampOrigin: _f$timestampOrigin,
  };

  static StatusPreviewEntry _instantiate(DecodingData data) {
    return StatusPreviewEntry(
      entry: data.dec(_f$entry),
      timestampOrigin: data.dec(_f$timestampOrigin),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StatusPreviewEntry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StatusPreviewEntry>(map);
  }

  static StatusPreviewEntry fromJson(String json) {
    return ensureInitialized().decodeJson<StatusPreviewEntry>(json);
  }
}

mixin StatusPreviewEntryMappable {
  String toJson() {
    return StatusPreviewEntryMapper.ensureInitialized()
        .encodeJson<StatusPreviewEntry>(this as StatusPreviewEntry);
  }

  Map<String, dynamic> toMap() {
    return StatusPreviewEntryMapper.ensureInitialized()
        .encodeMap<StatusPreviewEntry>(this as StatusPreviewEntry);
  }

  StatusPreviewEntryCopyWith<
    StatusPreviewEntry,
    StatusPreviewEntry,
    StatusPreviewEntry
  >
  get copyWith =>
      _StatusPreviewEntryCopyWithImpl<StatusPreviewEntry, StatusPreviewEntry>(
        this as StatusPreviewEntry,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StatusPreviewEntryMapper.ensureInitialized().stringifyValue(
      this as StatusPreviewEntry,
    );
  }

  @override
  bool operator ==(Object other) {
    return StatusPreviewEntryMapper.ensureInitialized().equalsValue(
      this as StatusPreviewEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return StatusPreviewEntryMapper.ensureInitialized().hashValue(
      this as StatusPreviewEntry,
    );
  }
}

extension StatusPreviewEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StatusPreviewEntry, $Out> {
  StatusPreviewEntryCopyWith<$R, StatusPreviewEntry, $Out>
  get $asStatusPreviewEntry => $base.as(
    (v, t, t2) => _StatusPreviewEntryCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StatusPreviewEntryCopyWith<
  $R,
  $In extends StatusPreviewEntry,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  StatusEntryCopyWith<$R, StatusEntry, StatusEntry> get entry;
  $R call({StatusEntry? entry, String? timestampOrigin});
  StatusPreviewEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StatusPreviewEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StatusPreviewEntry, $Out>
    implements StatusPreviewEntryCopyWith<$R, StatusPreviewEntry, $Out> {
  _StatusPreviewEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StatusPreviewEntry> $mapper =
      StatusPreviewEntryMapper.ensureInitialized();
  @override
  StatusEntryCopyWith<$R, StatusEntry, StatusEntry> get entry =>
      $value.entry.copyWith.$chain((v) => call(entry: v));
  @override
  $R call({StatusEntry? entry, String? timestampOrigin}) => $apply(
    FieldCopyWithData({
      if (entry != null) #entry: entry,
      if (timestampOrigin != null) #timestampOrigin: timestampOrigin,
    }),
  );
  @override
  StatusPreviewEntry $make(CopyWithData data) => StatusPreviewEntry(
    entry: data.get(#entry, or: $value.entry),
    timestampOrigin: data.get(#timestampOrigin, or: $value.timestampOrigin),
  );

  @override
  StatusPreviewEntryCopyWith<$R2, StatusPreviewEntry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StatusPreviewEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

