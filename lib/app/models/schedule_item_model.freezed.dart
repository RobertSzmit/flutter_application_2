// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleItem _$ScheduleItemFromJson(Map<String, dynamic> json) {
  return _ScheduleItem.fromJson(json);
}

/// @nodoc
mixin _$ScheduleItem {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get homeTeam => throw _privateConstructorUsedError;
  String get awayTeam => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleItemCopyWith<ScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleItemCopyWith<$Res> {
  factory $ScheduleItemCopyWith(
          ScheduleItem value, $Res Function(ScheduleItem) then) =
      _$ScheduleItemCopyWithImpl<$Res, ScheduleItem>;
  @useResult
  $Res call(
      {String id,
      String date,
      String homeTeam,
      String awayTeam,
      String? score});
}

/// @nodoc
class _$ScheduleItemCopyWithImpl<$Res, $Val extends ScheduleItem>
    implements $ScheduleItemCopyWith<$Res> {
  _$ScheduleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleItemImplCopyWith<$Res>
    implements $ScheduleItemCopyWith<$Res> {
  factory _$$ScheduleItemImplCopyWith(
          _$ScheduleItemImpl value, $Res Function(_$ScheduleItemImpl) then) =
      __$$ScheduleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String date,
      String homeTeam,
      String awayTeam,
      String? score});
}

/// @nodoc
class __$$ScheduleItemImplCopyWithImpl<$Res>
    extends _$ScheduleItemCopyWithImpl<$Res, _$ScheduleItemImpl>
    implements _$$ScheduleItemImplCopyWith<$Res> {
  __$$ScheduleItemImplCopyWithImpl(
      _$ScheduleItemImpl _value, $Res Function(_$ScheduleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? score = freezed,
  }) {
    return _then(_$ScheduleItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleItemImpl implements _ScheduleItem {
  const _$ScheduleItemImpl(
      {required this.id,
      required this.date,
      required this.homeTeam,
      required this.awayTeam,
      this.score});

  factory _$ScheduleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleItemImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final String homeTeam;
  @override
  final String awayTeam;
  @override
  final String? score;

  @override
  String toString() {
    return 'ScheduleItem(id: $id, date: $date, homeTeam: $homeTeam, awayTeam: $awayTeam, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, homeTeam, awayTeam, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleItemImplCopyWith<_$ScheduleItemImpl> get copyWith =>
      __$$ScheduleItemImplCopyWithImpl<_$ScheduleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleItemImplToJson(
      this,
    );
  }
}

abstract class _ScheduleItem implements ScheduleItem {
  const factory _ScheduleItem(
      {required final String id,
      required final String date,
      required final String homeTeam,
      required final String awayTeam,
      final String? score}) = _$ScheduleItemImpl;

  factory _ScheduleItem.fromJson(Map<String, dynamic> json) =
      _$ScheduleItemImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  String get homeTeam;
  @override
  String get awayTeam;
  @override
  String? get score;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleItemImplCopyWith<_$ScheduleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
