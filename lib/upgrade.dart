import 'package:cringe_miner/home.dart';
import 'package:cringe_miner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({super.key, required this.item, this.totalTime, this.timePeriod});
  final int item;
  final totalTime;
  final timePeriod;

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      // extendBodyBehindAppBar: true,
      child: Stack(
        children: [
          Center(
            child: CupertinoButton(
                disabledColor: CupertinoColors.activeBlue,
                color: CupertinoColors.activeBlue,
                child: Text('Upgrade'),
                onPressed: () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => HomePage(),
                  );
                }),
          ),
          Column(
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
                                            40) *
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
            ],
          ),
        ],
      ),
    );
  }
}
