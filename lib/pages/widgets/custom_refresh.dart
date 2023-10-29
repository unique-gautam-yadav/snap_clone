import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gradient_loader.dart';

class CustomRefreshControl extends StatelessWidget {
  const CustomRefreshControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      refreshIndicatorExtent: 5,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 10));
      },
      builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance,
          refreshIndicatorExtent) {
        double p = pulledExtent / 50 * 100;
        return Container(
          color: Colors.amber,
          child: Center(
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    // "${pulledExtent.toStringAsFixed(2)}    -    $refreshIndicatorExtent        ${p.toStringAsFixed(2)}          ${((p * 40) / 100)}",
                    // "$refreshState",
                    "",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 100),
                    firstChild: const GradientLoader(),
                    secondChild: Container(
                      width: double.infinity,
                      height: 4,
                      decoration: const BoxDecoration(),
                    ),
                    crossFadeState: refreshState == RefreshIndicatorMode.refresh
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
                Positioned(
                  bottom:
                      (((p * 80) / 100) - 90) < 0 ? ((p * 80) / 100) - 90 : 0,
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.arrow_up_square,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
