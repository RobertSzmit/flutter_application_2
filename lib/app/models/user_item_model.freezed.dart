// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserItem _$UserItemFromJson(Map<String, dynamic> json) {
  return _UserItem.fromJson(json);
}

/// @nodoc
mixin _$UserItem {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserItemCopyWith<UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserItemCopyWith<$Res> {
  factory $UserItemCopyWith(UserItem value, $Res Function(UserItem) then) =
      _$UserItemCopyWithImpl<$Res, UserItem>;
  @useResult
  $Res call({String id, String username, String? email});
}

/// @nodoc
class _$UserItemCopyWithImpl<$Res, $Val extends UserItem>
    implements $UserItemCopyWith<$Res> {
  _$UserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserItemImplCopyWith<$Res>
    implements $UserItemCopyWith<$Res> {
  factory _$$UserItemImplCopyWith(
          _$UserItemImpl value, $Res Function(_$UserItemImpl) then) =
      __$$UserItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String? email});
}

/// @nodoc
class __$$UserItemImplCopyWithImpl<$Res>
    extends _$UserItemCopyWithImpl<$Res, _$UserItemImpl>
    implements _$$UserItemImplCopyWith<$Res> {
  __$$UserItemImplCopyWithImpl(
      _$UserItemImpl _value, $Res Function(_$UserItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
  }) {
    return _then(_$UserItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserItemImpl implements _UserItem {
  const _$UserItemImpl({required this.id, required this.username, this.email});

  factory _$UserItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserItemImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserItem(id: $id, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserItemImplCopyWith<_$UserItemImpl> get copyWith =>
      __$$UserItemImplCopyWithImpl<_$UserItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserItemImplToJson(
      this,
    );
  }
}

abstract class _UserItem implements UserItem {
  const factory _UserItem(
      {required final String id,
      required final String username,
      final String? email}) = _$UserItemImpl;

  factory _UserItem.fromJson(Map<String, dynamic> json) =
      _$UserItemImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UserItemImplCopyWith<_$UserItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
