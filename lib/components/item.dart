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
                  child: RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 11,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: items[widget.timePeriod]![widget.item]['name'],
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'] != 0 ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: time,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return RichText(
                            text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 11,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$' +
                                  (items[widget.timePeriod]![widget.item]
                                              ['initialRevenue'] *
                                          items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'])
                                      .toString(),
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: ' - ' +
                                  (((widget.totalTime -
                                                      (time.value %
                                                          widget.totalTime)) /
                                                  12)
                                              .round() /
                                          10)
                                      .toString() +
                                  's left',
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ));
                      }),
                ),
              ) : Container(),
              items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'] != 0 ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: time,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return RichText(
                            text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            fontSize: 11,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: items[widget.timePeriod]![widget.item]
                                          ['upgradeLevel']
                                      .toString() +
                                  ' Upgrades',
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ));
                      }),
                ),
              ) : Container(),
              items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'] != 0 ? SizedBox(
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
                                  //adding money
                                  if ((time.value +
                                              items[widget.timePeriod]![
                                                  widget.item]['offset']) %
                                          widget.totalTime ==
                                      0) {
                                    money.value += (items[widget.timePeriod]![
                                            widget.item]['initialRevenue'] *
                                        items[widget.timePeriod]![widget.item]
                                            ['upgradeLevel']);
                                  }

                                  return Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            color: CupertinoColors.activeBlue,
                                            height: 40,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    60) *
                                                (time.value %
                                                    widget.totalTime) /
                                                widget.totalTime,
                                            alignment: Alignment.centerRight,
                                          )),
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ) : Container(),
              ValueListenableBuilder<int>(
                  valueListenable: time,
                  builder: (BuildContext context, int value, Widget? child) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: screenSize.width - 40,
                        child: CupertinoButton(
                            child: Text(
                                '${items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'] != 0 ? 'Upgrade x1: ' : 'Buy: '} ' + '\$${(items[widget.timePeriod]![widget.item]['initialPrice'] * (pow(items[widget.timePeriod]![widget.item]['coefficient'], items[widget.timePeriod]![widget.item]['upgradeLevel']))).toStringAsFixed(2)}'),
                            color: items[widget.timePeriod]![widget.item]
                                            ['initialPrice'] *
                                        (pow(
                                            items[widget.timePeriod]![
                                                widget.item]['coefficient'],
                                            items[widget.timePeriod]![widget
                                                .item]['upgradeLevel'])) <=
                                    money.value
                                ? CupertinoColors.activeOrange
                                : CupertinoColors.inactiveGray,
                            onPressed: () {
                              if (items[widget.timePeriod]![widget.item]
                                          ['initialPrice'] *
                                      (pow(
                                          items[widget.timePeriod]![widget.item]
                                              ['coefficient'],
                                          items[widget.timePeriod]![widget.item]
                                              ['upgradeLevel'])) <
                                  money.value) {
                                money.value = money.value -
                                    items[widget.timePeriod]![widget.item]
                                            ['initialPrice'] *
                                        (pow(
                                            items[widget.timePeriod]![
                                                widget.item]['coefficient'],
                                            items[widget.timePeriod]![
                                                widget.item]['upgradeLevel']));
                                items[widget.timePeriod]![widget.item]
                                    ['upgradeLevel'] += 1;
                              }
                            }),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
