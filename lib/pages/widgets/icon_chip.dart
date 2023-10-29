import 'package:flutter/cupertino.dart';

class IconChip extends StatelessWidget {
  const IconChip({
    super.key,
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 10),
      height: 45,
      width: 50,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(200),
      ),
      child: FittedBox(
        child: Icon(
          iconData,
          color: CupertinoColors.darkBackgroundGray,
        ),
      ),
    );
  }
}
