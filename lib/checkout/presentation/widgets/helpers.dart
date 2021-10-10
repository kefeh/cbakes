import 'package:cbakes/checkout/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromRGBO(254, 236, 236, 1),
          ),
        ),
        Container(
          width: size - size / 10,
          height: size - size / 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}

class Ratings extends StatelessWidget {
  final double size;
  final Color color;

  const Ratings({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: size,
          color: color,
        ),
        Icon(
          Icons.star,
          size: size,
          color: color,
        ),
        Icon(
          Icons.star,
          size: size,
          color: color,
        ),
        Icon(
          Icons.star,
          size: size,
          color: color,
        ),
        Icon(
          Icons.star_half,
          size: size,
          color: color,
        ),
      ],
    );
  }
}

class ItemHeading extends StatelessWidget {
  const ItemHeading({
    Key? key,
    required this.text,
    required this.color,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: GoogleFonts.rubik(
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}

class ItemPriceText extends StatelessWidget {
  const ItemPriceText({
    Key? key,
    required this.text,
    required this.color,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.rubik(
          color: color,
          fontSize: fontSize ?? 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700),
    );
  }
}

class CbIcons extends StatelessWidget {
  const CbIcons({
    Key? key,
    required this.icon,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Icon(
            icon,
            size: size - 5,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class PayMethodCard extends HookConsumerWidget {
  const PayMethodCard({
    Key? key,
    required this.widthPropotions,
    required this.imageUrl,
    required this.caption,
  }) : super(key: key);

  final double widthPropotions;
  final String imageUrl;
  final String caption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeProvider);
    final double scaleStart = active == caption ? 1.0 : 0.8;
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: scaleStart,
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    scaleStart == 1.0 ? _controller.forward() : _controller.reverse();
    return GestureDetector(
      onTap: () {
        final anotherNotifier = ref.read(activeProvider.notifier);
        anotherNotifier.setActive(caption);
      },
      child: ScaleTransition(
        scale: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widthPropotions,
              height: widthPropotions * 0.7,
              constraints: const BoxConstraints(
                minHeight: 100,
                minWidth: 100,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF75555),
                border: Border.all(color: Colors.white30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Colors.black38,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(widthPropotions / 10),
                child: Image(
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            CheckoutCaptionText(caption: caption)
          ],
        ),
      ),
    );
  }
}

class CheckoutCaptionText extends StatelessWidget {
  const CheckoutCaptionText({
    Key? key,
    required this.caption,
    this.color = Colors.white,
    this.fontSize = 14,
  }) : super(key: key);

  final String caption;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        caption,
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
