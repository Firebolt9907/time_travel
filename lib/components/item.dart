import 'package:cringe_miner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    this.timeElapsed,
    this.totalTime,
    this.upgradePrice,
    this.moneyPerCycle,
  }) : super(key: key);

  final timeElapsed;
  final totalTime;
  final upgradePrice;
  final moneyPerCycle;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: 60,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    color: context.isDarkMode
                        ? CupertinoColors.darkBackgroundGray
                        : CupertinoColors.lightBackgroundGray,
                    height: 40,
                    width: MediaQuery.of(context).size.width - 40,
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 2000),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ValueListenableBuilder<int>(
                          valueListenable: time,
                          builder:
                              (BuildContext context, int value, Widget? child) {
                            print(time.value % widget.totalTime);
                            return Container(
                              color: CupertinoColors.activeBlue,
                              height: 40,
                              width: (MediaQuery.of(context).size.width - 40) *
                                  (time.value % widget.totalTime) /
                                  widget.totalTime,
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        CupertinoButton(
          child: Text('Upgrade'),
          onPressed: () {},
          disabledColor: CupertinoColors.activeBlue,
          color: CupertinoColors.activeBlue,
        ),
      ],
    );
  }
}
