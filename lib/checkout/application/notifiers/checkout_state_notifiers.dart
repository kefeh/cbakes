import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodActiveNotifier extends StateNotifier<GlobalKey?> {
  PaymentMethodActiveNotifier(GlobalKey<State<StatefulWidget>>? state)
      : super(state);

  void setActive(GlobalKey key) {
    state = key;
  }
}

class DeliveryMethodActiveNotifier extends StateNotifier<String?> {
  DeliveryMethodActiveNotifier(String? state) : super(state);

  void setActive(String key) {
    state = key;
  }
}
