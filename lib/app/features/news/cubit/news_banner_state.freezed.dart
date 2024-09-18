// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsBannerState {
  List<BannerItem> get bannerItems => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsBannerStateCopyWith<NewsBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsBannerStateCopyWith<$Res> {
  factory $NewsBannerStateCopyWith(
          NewsBannerState value, $Res Function(NewsBannerState) then) =
      _$NewsBannerStateCopyWithImpl<$Res, NewsBannerState>;
  @useResult
  $Res call(
      {List<BannerItem> bannerItems, bool isLoading, String errorMessage});
}

/// @nodoc
class _$NewsBannerStateCopyWithImpl<$Res, $Val extends NewsBannerState>
    implements $NewsBannerStateCopyWith<$Res> {
  _$NewsBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerItems = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      bannerItems: null == bannerItems
          ? _value.bannerItems
          : bannerItems // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
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
}

/// @nodoc
abstract class _$$NewsBannerStateImplCopyWith<$Res>
    implements $NewsBannerStateCopyWith<$Res> {
  factory _$$NewsBannerStateImplCopyWith(_$NewsBannerStateImpl value,
          $Res Function(_$NewsBannerStateImpl) then) =
      __$$NewsBannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BannerItem> bannerItems, bool isLoading, String errorMessage});
}

/// @nodoc
class __$$NewsBannerStateImplCopyWithImpl<$Res>
    extends _$NewsBannerStateCopyWithImpl<$Res, _$NewsBannerStateImpl>
    implements _$$NewsBannerStateImplCopyWith<$Res> {
  __$$NewsBannerStateImplCopyWithImpl(
      _$NewsBannerStateImpl _value, $Res Function(_$NewsBannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerItems = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$NewsBannerStateImpl(
      bannerItems: null == bannerItems
          ? _value._bannerItems
          : bannerItems // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
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

class _$NewsBannerStateImpl implements _NewsBannerState {
  const _$NewsBannerStateImpl(
      {final List<BannerItem> bannerItems = const [],
      this.isLoading = false,
      this.errorMessage = ''})
      : _bannerItems = bannerItems;

  final List<BannerItem> _bannerItems;
  @override
  @JsonKey()
  List<BannerItem> get bannerItems {
    if (_bannerItems is EqualUnmodifiableListView) return _bannerItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerItems);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'NewsBannerState(bannerItems: $bannerItems, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsBannerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bannerItems, _bannerItems) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bannerItems),
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsBannerStateImplCopyWith<_$NewsBannerStateImpl> get copyWith =>
      __$$NewsBannerStateImplCopyWithImpl<_$NewsBannerStateImpl>(
          this, _$identity);
}

abstract class _NewsBannerState implements NewsBannerState {
  const factory _NewsBannerState(
      {final List<BannerItem> bannerItems,
      final bool isLoading,
      final String errorMessage}) = _$NewsBannerStateImpl;

  @override
  List<BannerItem> get bannerItems;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$NewsBannerStateImplCopyWith<_$NewsBannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
