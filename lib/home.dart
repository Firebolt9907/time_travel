import 'dart:async';

import 'package:cringe_miner/components/item.dart';
import 'package:cringe_miner/constants.dart';
import 'package:cringe_miner/main.dart';
import 'package:cringe_miner/setup.dart';
import 'package:cringe_miner/upgrade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() { 
    super.initState();
    
  }

  add

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor:
          context.isDarkMode ? CupertinoColors.black : CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
          middle: ValueListenableBuilder<int>(
              valueListenable: time,
              builder: (BuildContext context, int value, Widget? child) {
                return Text('\$${money.value.toStringAsFixed(2)}');
              })),
      child: ListView.builder(
        itemCount: items['ancientEgypt']!.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: CupertinoButton(
                  disabledColor: CupertinoColors.activeBlue,
                  color: CupertinoColors.activeBlue,
                  child: Text('Click Me'),
                  onPressed: () {
                    CupertinoScaffold.showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => SetupPage(),
                    );
                  }),
            );
          } else {
            return Bounceable(
              onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => UpgradePage(
                  totalTime: items['ancientEgypt']![index]
                          ['initialTimeInSeconds'] *
                      120,
                  item: index,
                  timePeriod: 'ancientEgypt',
                ),
              ),
              child: ItemWidget(
                totalTime:
                    items['ancientEgypt']![index]['initialTimeInSeconds'] * 120,
                item: index,
                timePeriod: 'ancientEgypt',
              ),
            );
          }
        },
      ),
    );
  }
}
