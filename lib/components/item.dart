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
                    duration: Duration(milliseconds: 1000 ~/ 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: CupertinoColors.activeBlue,
                        height: 40,
                        width: (MediaQuery.of(context).size.width - 40) *
                            (widget.timeElapsed / widget.totalTime),
                      ),
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
