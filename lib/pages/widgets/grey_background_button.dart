import 'package:flutter/cupertino.dart';

class GreyBackgroundWidget extends StatelessWidget {
  const GreyBackgroundWidget({
    super.key,
    this.child,
    this.onTap,
  });

  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGrey6,
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      ),
    );
  }
}
