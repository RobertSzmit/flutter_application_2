// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableItem _$TableItemFromJson(Map<String, dynamic> json) {
  return _TableItem.fromJson(json);
}

/// @nodoc
mixin _$TableItem {
  String get id => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  String get matches => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get goals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableItemCopyWith<TableItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableItemCopyWith<$Res> {
  factory $TableItemCopyWith(TableItem value, $Res Function(TableItem) then) =
      _$TableItemCopyWithImpl<$Res, TableItem>;
  @useResult
  $Res call(
      {String id, String teamName, String matches, int points, String goals});
}

/// @nodoc
class _$TableItemCopyWithImpl<$Res, $Val extends TableItem>
    implements $TableItemCopyWith<$Res> {
  _$TableItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamName = null,
    Object? matches = null,
    Object? points = null,
    Object? goals = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableItemImplCopyWith<$Res>
    implements $TableItemCopyWith<$Res> {
  factory _$$TableItemImplCopyWith(
          _$TableItemImpl value, $Res Function(_$TableItemImpl) then) =
      __$$TableItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String teamName, String matches, int points, String goals});
}

/// @nodoc
class __$$TableItemImplCopyWithImpl<$Res>
    extends _$TableItemCopyWithImpl<$Res, _$TableItemImpl>
    implements _$$TableItemImplCopyWith<$Res> {
  __$$TableItemImplCopyWithImpl(
      _$TableItemImpl _value, $Res Function(_$TableItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamName = null,
    Object? matches = null,
    Object? points = null,
    Object? goals = null,
  }) {
    return _then(_$TableItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableItemImpl implements _TableItem {
  const _$TableItemImpl(
      {required this.id,
      required this.teamName,
      required this.matches,
      required this.points,
      required this.goals});

  factory _$TableItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableItemImplFromJson(json);

  @override
  final String id;
  @override
  final String teamName;
  @override
  final String matches;
  @override
  final int points;
  @override
  final String goals;

  @override
  String toString() {
    return 'TableItem(id: $id, teamName: $teamName, matches: $matches, points: $points, goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.goals, goals) || other.goals == goals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, teamName, matches, points, goals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableItemImplCopyWith<_$TableItemImpl> get copyWith =>
      __$$TableItemImplCopyWithImpl<_$TableItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableItemImplToJson(
      this,
    );
  }
}

abstract class _TableItem implements TableItem {
  const factory _TableItem(
      {required final String id,
      required final String teamName,
      required final String matches,
      required final int points,
      required final String goals}) = _$TableItemImpl;

  factory _TableItem.fromJson(Map<String, dynamic> json) =
      _$TableItemImpl.fromJson;

  @override
  String get id;
  @override
  String get teamName;
  @override
  String get matches;
  @override
  int get points;
  @override
  String get goals;
  @override
  @JsonKey(ignore: true)
  _$$TableItemImplCopyWith<_$TableItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
