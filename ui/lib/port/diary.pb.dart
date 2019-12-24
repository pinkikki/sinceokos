///
//  Generated code. Do not modify.
//  source: app/diary/diary.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import './google/protobuf/timestamp.pb.dart' as $2;

class DiaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryRequest', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'title')
    ..aOS(3, 'text')
    ..hasRequiredFields = false
  ;

  DiaryRequest._() : super();
  factory DiaryRequest() => create();
  factory DiaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryRequest clone() => DiaryRequest()..mergeFromMessage(this);
  DiaryRequest copyWith(void Function(DiaryRequest) updates) => super.copyWith((message) => updates(message as DiaryRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryRequest create() => DiaryRequest._();
  DiaryRequest createEmptyInstance() => create();
  static $pb.PbList<DiaryRequest> createRepeated() => $pb.PbList<DiaryRequest>();
  static DiaryRequest getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryRequest _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get title => $_getS(1, '');
  set title($core.String v) { $_setString(1, v); }
  $core.bool hasTitle() => $_has(1);
  void clearTitle() => clearField(2);

  $core.String get text => $_getS(2, '');
  set text($core.String v) { $_setString(2, v); }
  $core.bool hasText() => $_has(2);
  void clearText() => clearField(3);
}

class DiaryResource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryResource', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'title')
    ..aOS(3, 'text')
    ..a<$2.Timestamp>(4, 'createdAt', $pb.PbFieldType.OM, protoName: 'createdAt', defaultOrMaker: $2.Timestamp.getDefault, subBuilder: $2.Timestamp.create)
    ..a<$2.Timestamp>(5, 'updatedAt', $pb.PbFieldType.OM, protoName: 'updatedAt', defaultOrMaker: $2.Timestamp.getDefault, subBuilder: $2.Timestamp.create)
    ..aOS(6, 'previous')
    ..aOS(7, 'next')
    ..hasRequiredFields = false
  ;

  DiaryResource._() : super();
  factory DiaryResource() => create();
  factory DiaryResource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryResource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryResource clone() => DiaryResource()..mergeFromMessage(this);
  DiaryResource copyWith(void Function(DiaryResource) updates) => super.copyWith((message) => updates(message as DiaryResource));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryResource create() => DiaryResource._();
  DiaryResource createEmptyInstance() => create();
  static $pb.PbList<DiaryResource> createRepeated() => $pb.PbList<DiaryResource>();
  static DiaryResource getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryResource _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get title => $_getS(1, '');
  set title($core.String v) { $_setString(1, v); }
  $core.bool hasTitle() => $_has(1);
  void clearTitle() => clearField(2);

  $core.String get text => $_getS(2, '');
  set text($core.String v) { $_setString(2, v); }
  $core.bool hasText() => $_has(2);
  void clearText() => clearField(3);

  $2.Timestamp get createdAt => $_getN(3);
  set createdAt($2.Timestamp v) { setField(4, v); }
  $core.bool hasCreatedAt() => $_has(3);
  void clearCreatedAt() => clearField(4);

  $2.Timestamp get updatedAt => $_getN(4);
  set updatedAt($2.Timestamp v) { setField(5, v); }
  $core.bool hasUpdatedAt() => $_has(4);
  void clearUpdatedAt() => clearField(5);

  $core.String get previous => $_getS(5, '');
  set previous($core.String v) { $_setString(5, v); }
  $core.bool hasPrevious() => $_has(5);
  void clearPrevious() => clearField(6);

  $core.String get next => $_getS(6, '');
  set next($core.String v) { $_setString(6, v); }
  $core.bool hasNext() => $_has(6);
  void clearNext() => clearField(7);
}

class DiaryResources extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryResources', createEmptyInstance: create)
    ..pc<DiaryResource>(1, 'diaries', $pb.PbFieldType.PM, subBuilder: DiaryResource.create)
    ..hasRequiredFields = false
  ;

  DiaryResources._() : super();
  factory DiaryResources() => create();
  factory DiaryResources.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryResources.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryResources clone() => DiaryResources()..mergeFromMessage(this);
  DiaryResources copyWith(void Function(DiaryResources) updates) => super.copyWith((message) => updates(message as DiaryResources));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryResources create() => DiaryResources._();
  DiaryResources createEmptyInstance() => create();
  static $pb.PbList<DiaryResources> createRepeated() => $pb.PbList<DiaryResources>();
  static DiaryResources getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryResources _defaultInstance;

  $core.List<DiaryResource> get diaries => $_getList(0);
}

class DiaryId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryId', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  DiaryId._() : super();
  factory DiaryId() => create();
  factory DiaryId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryId clone() => DiaryId()..mergeFromMessage(this);
  DiaryId copyWith(void Function(DiaryId) updates) => super.copyWith((message) => updates(message as DiaryId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryId create() => DiaryId._();
  DiaryId createEmptyInstance() => create();
  static $pb.PbList<DiaryId> createRepeated() => $pb.PbList<DiaryId>();
  static DiaryId getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryId _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

class DiarySnapshot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiarySnapshot', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'snapshot', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DiarySnapshot._() : super();
  factory DiarySnapshot() => create();
  factory DiarySnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiarySnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiarySnapshot clone() => DiarySnapshot()..mergeFromMessage(this);
  DiarySnapshot copyWith(void Function(DiarySnapshot) updates) => super.copyWith((message) => updates(message as DiarySnapshot));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiarySnapshot create() => DiarySnapshot._();
  DiarySnapshot createEmptyInstance() => create();
  static $pb.PbList<DiarySnapshot> createRepeated() => $pb.PbList<DiarySnapshot>();
  static DiarySnapshot getDefault() => _defaultInstance ??= create()..freeze();
  static DiarySnapshot _defaultInstance;

  $core.List<$core.int> get snapshot => $_getN(0);
  set snapshot($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasSnapshot() => $_has(0);
  void clearSnapshot() => clearField(1);
}

class DiarySnapshotId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiarySnapshotId', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  DiarySnapshotId._() : super();
  factory DiarySnapshotId() => create();
  factory DiarySnapshotId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiarySnapshotId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiarySnapshotId clone() => DiarySnapshotId()..mergeFromMessage(this);
  DiarySnapshotId copyWith(void Function(DiarySnapshotId) updates) => super.copyWith((message) => updates(message as DiarySnapshotId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiarySnapshotId create() => DiarySnapshotId._();
  DiarySnapshotId createEmptyInstance() => create();
  static $pb.PbList<DiarySnapshotId> createRepeated() => $pb.PbList<DiarySnapshotId>();
  static DiarySnapshotId getDefault() => _defaultInstance ??= create()..freeze();
  static DiarySnapshotId _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

