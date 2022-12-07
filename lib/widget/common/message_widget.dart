import 'dart:ui';

import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final Widget appIcon;
  final String appName;
  const MessageWidget({
    super.key,
    required this.message,
    required this.appIcon,
    required this.appName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: appIcon,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(appName),
                    ],
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
