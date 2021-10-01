import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
  }) : super(key: key);

  final double height;
  final String text;
  final double? textSize;

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
              backgroundColor: Theme.of(context).accentColor,
              textSize: textSize,
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
              backgroundColor: Theme.of(context).accentColor,
              textSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
