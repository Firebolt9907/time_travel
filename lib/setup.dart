import 'package:cringe_miner/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // extendBodyBehindAppBar: true,
      child: Stack(
        children: [
          Center(
            child: CupertinoButton(
                disabledColor: CupertinoColors.activeBlue,
                color: CupertinoColors.activeBlue,
                child: Text('Click Me'),
                onPressed: () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => HomePage(),
                  );
                }),
          )
        ],
      ),
    );
  }
}