import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifiers.freezed.dart';

@freezed
class ServedPage with _$ServedPage {
  const ServedPage._();
  const factory ServedPage.home() = _Home;
  const factory ServedPage.checkoutBread() = _CheckoutBread;
  const factory ServedPage.checkoutRestaurant() = _CheckoutRestaurant;
}

class ServedPageNotifier extends StateNotifier<ServedPage> {
  ServedPageNotifier() : super(const ServedPage.home());

  void setCheckoutBread() {
    state = const ServedPage.checkoutBread();
  }

  void setCheckoutRestaurant() {
    state = const ServedPage.checkoutRestaurant();
  }

  void setHome() {
    state = const ServedPage.home();
  }
}
