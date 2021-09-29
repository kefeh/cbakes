import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SmallItem extends StatelessWidget {
  const SmallItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/card.png",
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 140,
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: ButtonMain(
                        text: "fufu and eru",
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SmallItemSmall extends StatelessWidget {
  const SmallItemSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/card.png",
                    width: width / 5,
                    height: width / 5,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: width / 5,
                  child: Align(
                    alignment: Alignment(0, 1.2),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: ButtonMainSmall(
                        text: "fufu and eru",
                        backgroundColor: Theme.of(context).accentColor,
                        textSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
