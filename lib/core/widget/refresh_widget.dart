import 'package:flutter/material.dart';

import '../../main.dart';

class MyRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const MyRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 20,
        backgroundColor: Colors.grey,
        color: myMainColor,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: onRefresh,
        child: child);
  }
}
