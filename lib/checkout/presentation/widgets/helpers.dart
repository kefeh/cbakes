import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

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
            color: Theme.of(context).buttonColor,
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
              image: AssetImage("assets/images/card.png"),
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
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.rubik(
        fontSize: 14,
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
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.rubik(
          color: color,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700),
    );
  }
}

class CbIcons extends StatelessWidget {
  const CbIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 30,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
