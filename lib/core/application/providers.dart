import 'package:cbakes/core/application/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final servedPageProvider =
    StateNotifierProvider<ServedPageNotifier, ServedPage>(
        (ref) => ServedPageNotifier());
