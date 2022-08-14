import 'package:flutter/material.dart';
import 'package:watch_store/app/models/watch.dart';

class ColorsListWidget extends StatelessWidget {
  const ColorsListWidget({
    Key? key,
    required this.animationController,
    required this.watch,
  }) : super(key: key);
  final Watch watch;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.elasticOut,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: watch.colors.map(
          (watchColor) {
            final index = watch.colors.indexOf(watchColor);
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                margin: EdgeInsets.only(
                  right: index == watch.colors.length - 1 ? 0 : 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF9095A6).withOpacity(0.1),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: watchColor.color,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Align(
                        child: Text(
                          watchColor.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF9095A6).withOpacity(0.65),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
