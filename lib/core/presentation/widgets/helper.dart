import 'dart:async';

import 'package:cbakes/core/application/providers.dart';
import 'package:cbakes/core/dormain/sponsors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HamBurger extends StatelessWidget {
  final double padding;
  final double height;
  final double lWidth;
  final double sWidth;

  const HamBurger({
    Key? key,
    required this.padding,
    required this.height,
    required this.lWidth,
    required this.sWidth,
  }) : super(key: key);

  factory HamBurger.large(double padding) {
    return HamBurger(
      padding: padding,
      height: 4,
      lWidth: 30,
      sWidth: 20,
    );
  }

  factory HamBurger.small(double padding) {
    return HamBurger(
      padding: padding + 40,
      height: 3,
      lWidth: 20,
      sWidth: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.only(top: padding - 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: height,
              width: lWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: sWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: lWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: sWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorCatalogue extends StatefulWidget {
  final double width;

  const SponsorCatalogue({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<SponsorCatalogue> createState() => _SponsorCatalogueState();
}

class _SponsorCatalogueState extends State<SponsorCatalogue> {
  final _controller = InfiniteScrollController();
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(const Duration(seconds: 4), (_) {
        _controller.nextItem(
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("PARTNERS",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 20,
                  )),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: 200,
            maxWidth: widget.width > 100 ? widget.width : 100,
            minWidth: 100,
          ),
          child: Consumer(builder: (context, ref, _) {
            final sponsors = Sponsors.sponsorList;
            return InfiniteCarousel.builder(
                itemCount: sponsors.length,
                itemExtent: 150,
                center: true,
                anchor: 0.0,
                velocityFactor: 0.9,
                onIndexChanged: (index) {},
                axisDirection: Axis.vertical,
                loop: true,
                controller: _controller,
                itemBuilder: (context, itemIndex, realIndex) {
                  return SponsorCard(
                      key: Key(sponsors[itemIndex].name),
                      name: sponsors[itemIndex].name,
                      imageUrl: sponsors[itemIndex].imageUrl);
                });
          }),
        ),
      ],
    );
  }
}

class SponsorCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const SponsorCard({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 67, 67, 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
              ),
            ),
          ),
        ),
        Text(name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 20,
                )),
      ],
    );
  }
}

class SocialMedia extends StatelessWidget {
  SocialMedia({
    Key? key,
    this.caption,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  String? caption;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (caption != null)
          Align(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 67, 67, 0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 20.0),
                  child: Text(
                    caption!,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
