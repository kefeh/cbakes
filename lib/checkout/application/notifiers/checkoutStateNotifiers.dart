import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodActiveNotifier extends StateNotifier<GlobalKey?> {
  PaymentMethodActiveNotifier(GlobalKey<State<StatefulWidget>>? state)
      : super(state);

  void setActive(GlobalKey key) {
    this.state = key;
  }

  bool isActive(GlobalKey key) => this.state == key;
}
