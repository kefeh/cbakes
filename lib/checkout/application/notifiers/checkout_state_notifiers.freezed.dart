// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkout_state_notifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SideFoodItemsTearOff {
  const _$SideFoodItemsTearOff();

  _SideFoodItems call({required List<SideFoodItem> items, double? totalPrice}) {
    return _SideFoodItems(
      items: items,
      totalPrice: totalPrice,
    );
  }
}

/// @nodoc
const $SideFoodItems = _$SideFoodItemsTearOff();

/// @nodoc
mixin _$SideFoodItems {
  List<SideFoodItem> get items => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SideFoodItemsCopyWith<SideFoodItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideFoodItemsCopyWith<$Res> {
  factory $SideFoodItemsCopyWith(
          SideFoodItems value, $Res Function(SideFoodItems) then) =
      _$SideFoodItemsCopyWithImpl<$Res>;
  $Res call({List<SideFoodItem> items, double? totalPrice});
}

/// @nodoc
class _$SideFoodItemsCopyWithImpl<$Res>
    implements $SideFoodItemsCopyWith<$Res> {
  _$SideFoodItemsCopyWithImpl(this._value, this._then);

  final SideFoodItems _value;
  // ignore: unused_field
  final $Res Function(SideFoodItems) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SideFoodItem>,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$SideFoodItemsCopyWith<$Res>
    implements $SideFoodItemsCopyWith<$Res> {
  factory _$SideFoodItemsCopyWith(
          _SideFoodItems value, $Res Function(_SideFoodItems) then) =
      __$SideFoodItemsCopyWithImpl<$Res>;
  @override
  $Res call({List<SideFoodItem> items, double? totalPrice});
}

/// @nodoc
class __$SideFoodItemsCopyWithImpl<$Res>
    extends _$SideFoodItemsCopyWithImpl<$Res>
    implements _$SideFoodItemsCopyWith<$Res> {
  __$SideFoodItemsCopyWithImpl(
      _SideFoodItems _value, $Res Function(_SideFoodItems) _then)
      : super(_value, (v) => _then(v as _SideFoodItems));

  @override
  _SideFoodItems get _value => super._value as _SideFoodItems;

  @override
  $Res call({
    Object? items = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_SideFoodItems(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SideFoodItem>,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_SideFoodItems extends _SideFoodItems {
  const _$_SideFoodItems({required this.items, this.totalPrice}) : super._();

  @override
  final List<SideFoodItem> items;
  @override
  final double? totalPrice;

  @override
  String toString() {
    return 'SideFoodItems(items: $items, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SideFoodItems &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(totalPrice);

  @JsonKey(ignore: true)
  @override
  _$SideFoodItemsCopyWith<_SideFoodItems> get copyWith =>
      __$SideFoodItemsCopyWithImpl<_SideFoodItems>(this, _$identity);
}

abstract class _SideFoodItems extends SideFoodItems {
  const factory _SideFoodItems(
      {required List<SideFoodItem> items,
      double? totalPrice}) = _$_SideFoodItems;
  const _SideFoodItems._() : super._();

  @override
  List<SideFoodItem> get items => throw _privateConstructorUsedError;
  @override
  double? get totalPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SideFoodItemsCopyWith<_SideFoodItems> get copyWith =>
      throw _privateConstructorUsedError;
}
