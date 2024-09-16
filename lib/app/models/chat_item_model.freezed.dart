// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) {
  return _ChatItem.fromJson(json);
}

/// @nodoc
mixin _$ChatItem {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatItemCopyWith<ChatItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatItemCopyWith<$Res> {
  factory $ChatItemCopyWith(ChatItem value, $Res Function(ChatItem) then) =
      _$ChatItemCopyWithImpl<$Res, ChatItem>;
  @useResult
  $Res call(
      {String id,
      String message,
      String userId,
      String username,
      @TimestampConverter() Timestamp timestamp});
}

/// @nodoc
class _$ChatItemCopyWithImpl<$Res, $Val extends ChatItem>
    implements $ChatItemCopyWith<$Res> {
  _$ChatItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? userId = null,
    Object? username = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatItemImplCopyWith<$Res>
    implements $ChatItemCopyWith<$Res> {
  factory _$$ChatItemImplCopyWith(
          _$ChatItemImpl value, $Res Function(_$ChatItemImpl) then) =
      __$$ChatItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String message,
      String userId,
      String username,
      @TimestampConverter() Timestamp timestamp});
}

/// @nodoc
class __$$ChatItemImplCopyWithImpl<$Res>
    extends _$ChatItemCopyWithImpl<$Res, _$ChatItemImpl>
    implements _$$ChatItemImplCopyWith<$Res> {
  __$$ChatItemImplCopyWithImpl(
      _$ChatItemImpl _value, $Res Function(_$ChatItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? userId = null,
    Object? username = null,
    Object? timestamp = null,
  }) {
    return _then(_$ChatItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatItemImpl implements _ChatItem {
  const _$ChatItemImpl(
      {required this.id,
      required this.message,
      required this.userId,
      required this.username,
      @TimestampConverter() required this.timestamp});

  factory _$ChatItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatItemImplFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final String userId;
  @override
  final String username;
  @override
  @TimestampConverter()
  final Timestamp timestamp;

  @override
  String toString() {
    return 'ChatItem(id: $id, message: $message, userId: $userId, username: $username, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, message, userId, username, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatItemImplCopyWith<_$ChatItemImpl> get copyWith =>
      __$$ChatItemImplCopyWithImpl<_$ChatItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatItemImplToJson(
      this,
    );
  }
}

abstract class _ChatItem implements ChatItem {
  const factory _ChatItem(
          {required final String id,
          required final String message,
          required final String userId,
          required final String username,
          @TimestampConverter() required final Timestamp timestamp}) =
      _$ChatItemImpl;

  factory _ChatItem.fromJson(Map<String, dynamic> json) =
      _$ChatItemImpl.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  String get userId;
  @override
  String get username;
  @override
  @TimestampConverter()
  Timestamp get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ChatItemImplCopyWith<_$ChatItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
