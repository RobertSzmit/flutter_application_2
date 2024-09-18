// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyAccountState {
  UserItem? get userItem => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAccountStateCopyWith<MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountStateCopyWith<$Res> {
  factory $MyAccountStateCopyWith(
          MyAccountState value, $Res Function(MyAccountState) then) =
      _$MyAccountStateCopyWithImpl<$Res, MyAccountState>;
  @useResult
  $Res call({UserItem? userItem, bool isLoading, String errorMessage});

  $UserItemCopyWith<$Res>? get userItem;
}

/// @nodoc
class _$MyAccountStateCopyWithImpl<$Res, $Val extends MyAccountState>
    implements $MyAccountStateCopyWith<$Res> {
  _$MyAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userItem = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      userItem: freezed == userItem
          ? _value.userItem
          : userItem // ignore: cast_nullable_to_non_nullable
              as UserItem?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserItemCopyWith<$Res>? get userItem {
    if (_value.userItem == null) {
      return null;
    }

    return $UserItemCopyWith<$Res>(_value.userItem!, (value) {
      return _then(_value.copyWith(userItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyAccountStateImplCopyWith<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  factory _$$MyAccountStateImplCopyWith(_$MyAccountStateImpl value,
          $Res Function(_$MyAccountStateImpl) then) =
      __$$MyAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserItem? userItem, bool isLoading, String errorMessage});

  @override
  $UserItemCopyWith<$Res>? get userItem;
}

/// @nodoc
class __$$MyAccountStateImplCopyWithImpl<$Res>
    extends _$MyAccountStateCopyWithImpl<$Res, _$MyAccountStateImpl>
    implements _$$MyAccountStateImplCopyWith<$Res> {
  __$$MyAccountStateImplCopyWithImpl(
      _$MyAccountStateImpl _value, $Res Function(_$MyAccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userItem = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MyAccountStateImpl(
      userItem: freezed == userItem
          ? _value.userItem
          : userItem // ignore: cast_nullable_to_non_nullable
              as UserItem?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyAccountStateImpl implements _MyAccountState {
  const _$MyAccountStateImpl(
      {this.userItem, this.isLoading = false, this.errorMessage = ''});

  @override
  final UserItem? userItem;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'MyAccountState(userItem: $userItem, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAccountStateImpl &&
            (identical(other.userItem, userItem) ||
                other.userItem == userItem) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userItem, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAccountStateImplCopyWith<_$MyAccountStateImpl> get copyWith =>
      __$$MyAccountStateImplCopyWithImpl<_$MyAccountStateImpl>(
          this, _$identity);
}

abstract class _MyAccountState implements MyAccountState {
  const factory _MyAccountState(
      {final UserItem? userItem,
      final bool isLoading,
      final String errorMessage}) = _$MyAccountStateImpl;

  @override
  UserItem? get userItem;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MyAccountStateImplCopyWith<_$MyAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
