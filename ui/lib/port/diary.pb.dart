///
//  Generated code. Do not modify.
//  source: app/diary/diary.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DiaryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryRequest', createEmptyInstance: create)
    ..aOS(1, 'no')
    ..aOS(2, 'text')
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

  $core.String get no => $_getS(0, '');
  set no($core.String v) { $_setString(0, v); }
  $core.bool hasNo() => $_has(0);
  void clearNo() => clearField(1);

  $core.String get text => $_getS(1, '');
  set text($core.String v) { $_setString(1, v); }
  $core.bool hasText() => $_has(1);
  void clearText() => clearField(2);
}

class DiaryResource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryResource', createEmptyInstance: create)
    ..aOS(1, 'no')
    ..aOS(2, 'text')
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

  $core.String get no => $_getS(0, '');
  set no($core.String v) { $_setString(0, v); }
  $core.bool hasNo() => $_has(0);
  void clearNo() => clearField(1);

  $core.String get text => $_getS(1, '');
  set text($core.String v) { $_setString(1, v); }
  $core.bool hasText() => $_has(1);
  void clearText() => clearField(2);
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

class DiaryCriteria extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryCriteria', createEmptyInstance: create)
    ..aOS(1, 'no')
    ..hasRequiredFields = false
  ;

  DiaryCriteria._() : super();
  factory DiaryCriteria() => create();
  factory DiaryCriteria.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryCriteria.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryCriteria clone() => DiaryCriteria()..mergeFromMessage(this);
  DiaryCriteria copyWith(void Function(DiaryCriteria) updates) => super.copyWith((message) => updates(message as DiaryCriteria));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryCriteria create() => DiaryCriteria._();
  DiaryCriteria createEmptyInstance() => create();
  static $pb.PbList<DiaryCriteria> createRepeated() => $pb.PbList<DiaryCriteria>();
  static DiaryCriteria getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryCriteria _defaultInstance;

  $core.String get no => $_getS(0, '');
  set no($core.String v) { $_setString(0, v); }
  $core.bool hasNo() => $_has(0);
  void clearNo() => clearField(1);
}

