// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginItem _$LoginItemFromJson(Map<String, dynamic> json) {
  return _LoginItem.fromJson(json);
}

/// @nodoc
mixin _$LoginItem {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginItemCopyWith<LoginItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginItemCopyWith<$Res> {
  factory $LoginItemCopyWith(LoginItem value, $Res Function(LoginItem) then) =
      _$LoginItemCopyWithImpl<$Res, LoginItem>;
  @useResult
  $Res call({String id, String email, String username});
}

/// @nodoc
class _$LoginItemCopyWithImpl<$Res, $Val extends LoginItem>
    implements $LoginItemCopyWith<$Res> {
  _$LoginItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginItemImplCopyWith<$Res>
    implements $LoginItemCopyWith<$Res> {
  factory _$$LoginItemImplCopyWith(
          _$LoginItemImpl value, $Res Function(_$LoginItemImpl) then) =
      __$$LoginItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String username});
}

/// @nodoc
class __$$LoginItemImplCopyWithImpl<$Res>
    extends _$LoginItemCopyWithImpl<$Res, _$LoginItemImpl>
    implements _$$LoginItemImplCopyWith<$Res> {
  __$$LoginItemImplCopyWithImpl(
      _$LoginItemImpl _value, $Res Function(_$LoginItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
  }) {
    return _then(_$LoginItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginItemImpl implements _LoginItem {
  const _$LoginItemImpl(
      {required this.id, required this.email, required this.username});

  factory _$LoginItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginItemImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String username;

  @override
  String toString() {
    return 'LoginItem(id: $id, email: $email, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginItemImplCopyWith<_$LoginItemImpl> get copyWith =>
      __$$LoginItemImplCopyWithImpl<_$LoginItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginItemImplToJson(
      this,
    );
  }
}

abstract class _LoginItem implements LoginItem {
  const factory _LoginItem(
      {required final String id,
      required final String email,
      required final String username}) = _$LoginItemImpl;

  factory _LoginItem.fromJson(Map<String, dynamic> json) =
      _$LoginItemImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$LoginItemImplCopyWith<_$LoginItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
