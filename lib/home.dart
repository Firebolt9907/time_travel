import 'dart:async';

import 'package:cringe_miner/components/item.dart';
import 'package:cringe_miner/setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    timer =
        Timer.periodic(Duration(microseconds: 16666), (Timer t) => );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // extendBodyBehindAppBar: true,
      child: ListView(
        children: [
          Center(
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
          ),
          ItemWidget(
            totalTime: 2000,
            timeElapsed: 100,
          ),
        ],
      ),
    );
  }
}
