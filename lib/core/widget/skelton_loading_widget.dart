import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../extensions/widget_extensions.dart';
import 'card_widget.dart';

class SkeltonLoading extends StatelessWidget {
  const SkeltonLoading({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.padding = 0,
    this.margin,
    this.child,
  }) : assert((width != null && height != null) || child != null);

  final double? height;
  final double? width;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffcbcbcb).withOpacity(0.4),
      highlightColor: const Color(0xffcbcbcb).withOpacity(0.6),
      child: child ??
          CardWidget(
            margin: margin,
            width: width,
            height: height,
            color: Colors.white,
            radius: 24,
          ),
    ).paddingVertical(padding);
  }
}
