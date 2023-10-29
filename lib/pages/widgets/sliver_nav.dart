import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import 'grey_background_button.dart';
import 'icon_chip.dart';

class AppHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GreyBackgroundWidget(
                          child: RandomAvatar('handsome_male'),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chat",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const GreyBackgroundWidget(
                          child: Icon(
                            CupertinoIcons.person_add_solid,
                            color: CupertinoColors.darkBackgroundGray,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GreyBackgroundWidget(
                          child: const Icon(
                            Icons.more_horiz,
                            color: CupertinoColors.darkBackgroundGray,
                          ),
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) => CupertinoActionSheet(
                                actions: const [
                                  SheetAction(title: "New Chat"),
                                  SheetAction(title: "New Shortcut"),
                                  SheetAction(title: "Manage Chats"),
                                  SheetAction(title: "Manage Friendships"),
                                  SheetAction(
                                      title: "Customize Best Friend Emojis"),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 30,
              child: Row(
                children: [
                  IconChip(iconData: Icons.chat),
                  IconChip(iconData: Icons.people),
                  IconChip(iconData: Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 155;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class SheetAction extends StatelessWidget {
  const SheetAction({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CupertinoActionSheetAction(
        onPressed: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: FractionallySizedBox(
          widthFactor: .9,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
