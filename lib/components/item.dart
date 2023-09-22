import 'dart:math';

import 'package:cringe_miner/constants.dart';
import 'package:cringe_miner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    required this.totalTime,
    required this.item,
    required this.timePeriod,
  }) : super(key: key);

  final totalTime;
  final item;
  final timePeriod;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: context.isDarkMode
              ? CupertinoColors.darkBackgroundGray
              : CupertinoColors.lightBackgroundGray,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    items[widget.timePeriod]![widget.item]['name'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: screenSize.width - 20,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          color: context.isDarkMode
                              ? CupertinoColors.darkBackgroundGray
                              : CupertinoColors.lightBackgroundGray,
                          height: 40,
                          width: MediaQuery.of(context).size.width - 60,
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 100),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ValueListenableBuilder<int>(
                                valueListenable: time,
                                builder: (BuildContext context, int value,
                                    Widget? child) {
                                  // print(time.value % widget.totalTime);
                                  return Container(
                                    color: CupertinoColors.activeBlue,
                                    height: 40,
                                    width: (MediaQuery.of(context).size.width -
                                            60) *
                                        (time.value % widget.totalTime) /
                                        widget.totalTime,
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Text(
                                        (((widget.totalTime -
                                                                (time.value %
                                                                    widget
                                                                        .totalTime)) /
                                                            12)
                                                        .round() /
                                                    10)
                                                .toString() +
                                            's left',
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
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
                  child: Text('Upgrade x1' +
                      items[widget.timePeriod]![widget.item]['initialPrice'] *
                          (pow(
                                  items[widget.timePeriod]![widget.item]
                                      ['coefficient'],
                                  items[widget.timePeriod]![widget.item]
                                      ['upgradeLevel']))
                              .toStringAsFixed(2)),
                  onPressed: () {
                    if (items[widget.timePeriod]![widget.item]['initialPrice'] *
                          (pow(
                                  items[widget.timePeriod]![widget.item]
                                      ['coefficient'],
                                  items[widget.timePeriod]![widget.item]
                                      ['upgradeLevel'])) > )
                  })
            ],
          ),
        ),
      ),
    );
  }
}
