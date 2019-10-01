///
//  Generated code. Do not modify.
//  source: diary/diary.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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

class DiaryResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiaryResponse', createEmptyInstance: create)
    ..aOS(1, 'no')
    ..aOS(2, 'text')
    ..hasRequiredFields = false
  ;

  DiaryResponse._() : super();
  factory DiaryResponse() => create();
  factory DiaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiaryResponse clone() => DiaryResponse()..mergeFromMessage(this);
  DiaryResponse copyWith(void Function(DiaryResponse) updates) => super.copyWith((message) => updates(message as DiaryResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryResponse create() => DiaryResponse._();
  DiaryResponse createEmptyInstance() => create();
  static $pb.PbList<DiaryResponse> createRepeated() => $pb.PbList<DiaryResponse>();
  static DiaryResponse getDefault() => _defaultInstance ??= create()..freeze();
  static DiaryResponse _defaultInstance;

  $core.String get no => $_getS(0, '');
  set no($core.String v) { $_setString(0, v); }
  $core.bool hasNo() => $_has(0);
  void clearNo() => clearField(1);

  $core.String get text => $_getS(1, '');
  set text($core.String v) { $_setString(1, v); }
  $core.bool hasText() => $_has(1);
  void clearText() => clearField(2);
}

