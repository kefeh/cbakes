import 'package:cbakes/checkout/application/notifiers/checkoutStateNotifiers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeProvider =
    StateNotifierProvider<PaymentMethodActiveNotifier, GlobalKey?>(
        (ref) => PaymentMethodActiveNotifier(null));
