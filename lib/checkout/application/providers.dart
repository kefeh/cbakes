import 'package:cbakes/checkout/application/notifiers/checkout_state_notifiers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeProvider =
    StateNotifierProvider<PaymentMethodActiveNotifier, GlobalKey?>(
        (ref) => PaymentMethodActiveNotifier(null));

final activeDeliveryBtnProvider =
    StateNotifierProvider<DeliveryMethodActiveNotifier, String?>(
        (ref) => DeliveryMethodActiveNotifier(null));

final sideFoodItemProvider =
    StateNotifierProvider<SideFoodItemsNotifier, SideFoodItems>(
        (ref) => SideFoodItemsNotifier());
