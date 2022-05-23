// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkout_state_notifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_SideFoodItemsCopyWith<$Res>
    implements $SideFoodItemsCopyWith<$Res> {
  factory _$$_SideFoodItemsCopyWith(
          _$_SideFoodItems value, $Res Function(_$_SideFoodItems) then) =
      __$$_SideFoodItemsCopyWithImpl<$Res>;
  @override
  $Res call({List<SideFoodItem> items, double? totalPrice});
}

/// @nodoc
class __$$_SideFoodItemsCopyWithImpl<$Res>
    extends _$SideFoodItemsCopyWithImpl<$Res>
    implements _$$_SideFoodItemsCopyWith<$Res> {
  __$$_SideFoodItemsCopyWithImpl(
      _$_SideFoodItems _value, $Res Function(_$_SideFoodItems) _then)
      : super(_value, (v) => _then(v as _$_SideFoodItems));

  @override
  _$_SideFoodItems get _value => super._value as _$_SideFoodItems;

  @override
  $Res call({
    Object? items = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$_SideFoodItems(
      items: items == freezed
          ? _value._items
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
  const _$_SideFoodItems(
      {required final List<SideFoodItem> items, this.totalPrice})
      : _items = items,
        super._();

  final List<SideFoodItem> _items;
  @override
  List<SideFoodItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double? totalPrice;

  @override
  String toString() {
    return 'SideFoodItems(items: $items, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SideFoodItems &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(totalPrice));

  @JsonKey(ignore: true)
  @override
  _$$_SideFoodItemsCopyWith<_$_SideFoodItems> get copyWith =>
      __$$_SideFoodItemsCopyWithImpl<_$_SideFoodItems>(this, _$identity);
}

abstract class _SideFoodItems extends SideFoodItems {
  const factory _SideFoodItems(
      {required final List<SideFoodItem> items,
      final double? totalPrice}) = _$_SideFoodItems;
  const _SideFoodItems._() : super._();

  @override
  List<SideFoodItem> get items => throw _privateConstructorUsedError;
  @override
  double? get totalPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SideFoodItemsCopyWith<_$_SideFoodItems> get copyWith =>
      throw _privateConstructorUsedError;
}
