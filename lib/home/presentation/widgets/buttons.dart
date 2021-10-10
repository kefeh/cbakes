import 'package:cbakes/checkout/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonMain extends ConsumerWidget {
  const ButtonMain({
    Key? key,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    this.textSize,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final double? textSize;
  final void Function()? onPressed;

  static const accentColorLight = Color.fromRGBO(254, 236, 236, 1);
  static const accentColor = Color.fromRGBO(246, 67, 67, 1);

  factory ButtonMain.active({
    required String text,
    double? textSize,
    void Function()? onPressed,
  }) {
    return ButtonMain(
      text: text,
      backgroundColor: accentColor,
      textColor: Colors.white,
      textSize: textSize,
      onPressed: onPressed,
    );
  }

  factory ButtonMain.activeLight({
    required String text,
    double? textSize,
    void Function()? onPressed,
  }) {
    return ButtonMain(
      text: text,
      backgroundColor: accentColorLight,
      textColor: accentColor,
      textSize: textSize,
      onPressed: onPressed,
    );
  }

  factory ButtonMain.inActive({
    required String text,
    double? textSize,
    void Function()? onPressed,
  }) {
    return ButtonMain(
      text: text,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      textSize: textSize,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(1, 1),
            blurRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: ElevatedButton(
        onPressed: (onPressed != null)
            ? () {
                ref.read(activeDeliveryBtnProvider.notifier).setActive(text);
                onPressed!();
              }
            : null,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.button!.copyWith(
                color: textColor ?? Colors.white,
                fontSize: textSize ?? 16,
              ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: textSize ?? 20.0,
              horizontal: 2 * (textSize ?? 20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonMainSmall extends StatelessWidget {
  const ButtonMainSmall({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textSize,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: textColor ?? Colors.white,
              fontSize: textSize,
            ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              vertical: textSize * 0.7, horizontal: (textSize)),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class DroppingButton extends StatelessWidget {
  const DroppingButton({
    Key? key,
    required this.height,
    required this.text,
    this.textSize,
    this.onPressed,
  }) : super(key: key);

  final double height;
  final String text;
  final double? textSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(246, 67, 67, 0.2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
            ),
            ButtonMain(
              text: text,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textSize: textSize,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class DroppingButtonSmall extends StatelessWidget {
  const DroppingButtonSmall({
    Key? key,
    required this.height,
    required this.text,
    required this.textSize,
  }) : super(key: key);

  final double height;
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 67, 67, 0.2),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(17),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: ButtonMainSmall(
              text: text,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}

class CartButton extends ConsumerWidget {
  const CartButton(
      {Key? key, this.onPressed, this.color = Colors.white, this.closeIcon})
      : super(key: key);

  final void Function()? onPressed;
  final Color color;
  final IconData? closeIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(sideFoodItemProvider);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              closeIcon ?? MdiIcons.cart,
              color: color,
            ),
            if (closeIcon == null)
              if (value.items.isNotEmpty)
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    value.items.length.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
