import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../widgets/custom_refresh.dart';
import '../widgets/sliver_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: AppHeaderDelegate(),
            pinned: true,
          ),
          const CustomRefreshControl(),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ...List.generate(
                  80,
                  (index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey6),
                    ),
                    child: CupertinoListTile(
                      leadingSize: 40,
                      leading: Container(
                        decoration: const BoxDecoration(
                          color: CupertinoColors.systemPurple,
                          shape: BoxShape.circle,
                        ),
                        child: RandomAvatar('person $index'),
                      ),
                      title: const Text("John Doe"),
                      subtitle: const Row(
                        children: [
                          Text(
                            "▀▀ New snaps",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " · 1mo",
                            style: TextStyle(color: CupertinoColors.systemGrey),
                          )
                        ],
                      ),
                      additionalInfo: Container(
                        height: 30,
                        width: 1,
                        color: CupertinoColors.systemGrey5,
                      ),
                      trailing: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          CupertinoIcons.chat_bubble_2,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
