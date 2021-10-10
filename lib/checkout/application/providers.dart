import 'package:cbakes/checkout/application/notifiers/checkout_state_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeProvider =
    StateNotifierProvider<PaymentMethodActiveNotifier, String?>(
        (ref) => PaymentMethodActiveNotifier());

final activeDeliveryBtnProvider =
    StateNotifierProvider<DeliveryMethodActiveNotifier, String?>(
        (ref) => DeliveryMethodActiveNotifier());

final sideFoodItemProvider =
    StateNotifierProvider<SideFoodItemsNotifier, SideFoodItems>(
        (ref) => SideFoodItemsNotifier());
