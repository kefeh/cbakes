import 'package:cbakes/checkout/dormain/delivery_options.dart';
import 'package:cbakes/checkout/dormain/pay_method_card.dart';
import 'package:cbakes/core/dormain/food_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state_notifiers.freezed.dart';

class PaymentMethodActiveNotifier extends StateNotifier<String?> {
  PaymentMethodActiveNotifier() : super(PayMethodCardItem.payCardItems[0].name);

  void setActive(String key) {
    state = key;
  }
}

class DeliveryMethodActiveNotifier extends StateNotifier<String?> {
  DeliveryMethodActiveNotifier() : super(DeliveryOption.options[0].name);

  void setActive(String key) {
    state = key;
  }
}

class SideFoodItem extends FoodItem {
  SideFoodItem({
    required this.item,
    required this.quantity,
  }) : super(
          name: item.name,
          price: item.price,
          imageUrl: item.imageUrl,
          decription: item.decription,
        );

  final FoodItem item;
  final int quantity;

  @override
  bool operator ==(other) {
    return (other is SideFoodItem) &&
        other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.decription == decription;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

@freezed
class SideFoodItems with _$SideFoodItems {
  const SideFoodItems._();
  const factory SideFoodItems(
      {required List<SideFoodItem> items, double? totalPrice}) = _SideFoodItems;

  factory SideFoodItems.fromFoodItems(List<FoodItem> items) {
    double price = 0;
    for (FoodItem item in items) {
      price = price + item.price;
    }
    final sideItems =
        items.map((e) => SideFoodItem(item: e, quantity: 0)).toList();
    return SideFoodItems(
      items: sideItems,
      totalPrice: price,
    );
  }
}

class SideFoodItemsNotifier extends StateNotifier<SideFoodItems> {
  SideFoodItemsNotifier()
      : super(const SideFoodItems(
          items: [],
          totalPrice: 0,
        ));

  void setSideItems(List<SideFoodItem> items) {
    double price = 0;
    for (SideFoodItem item in items) {
      price = price + item.price;
    }
    state = SideFoodItems(
      items: items,
      totalPrice: price,
    );
  }

  void addSideItem(FoodItem item, [int? index]) {
    try {
      double price = (state.totalPrice ?? 0) + item.price;
      final items = state.items.toList();
      if (index != null) {
        final anItem = state.items[index];
        final sideFoodItem =
            SideFoodItem(item: item, quantity: anItem.quantity + 1);
        items[index] = sideFoodItem;
      } else {
        final sideFoodItem = SideFoodItem(item: item, quantity: 1);
        if (items.contains(sideFoodItem)) {
          final someItemIndex = items.indexOf(sideFoodItem);
          items[someItemIndex] = SideFoodItem(
              item: sideFoodItem.item,
              quantity: items[someItemIndex].quantity + 1);
        } else {
          items.add(sideFoodItem);
        }
      }
      state = SideFoodItems(items: items, totalPrice: price);
    } catch (e) {
      print(e);
      // will handle later
    }
  }

  void removeSideItem(int index) {
    try {
      final items = state.items.toList();

      final removedItem = items[index];

      if (removedItem.quantity == 1) {
        items.removeAt(index);
      } else {
        final quantity = removedItem.quantity - 1;
        items[index] = SideFoodItem(item: removedItem.item, quantity: quantity);
      }
      final price = state.totalPrice! - removedItem.price;

      state = SideFoodItems(items: items, totalPrice: price);
    } catch (e) {
      // will handle later
    }
  }
}
