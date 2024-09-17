import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';
import '../utils/app_padding.dart';
import '../extensions/context_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/widget_extensions.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.child,
    this.height,
    this.padding = AppPadding.bottomSheetPadding,
    this.hasPadding = true,
    this.hasCloseIcon = true,
  });

  final Widget child;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool hasPadding;
  final bool hasCloseIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: context.width,
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (hasCloseIcon) ...[
              AppDimensions.smallSizedBox.hs,
              Container(
                      width: 50,
                      height: 2,
                      color: context.colorScheme.onSurfaceVariant)
                  .center(),
              IconButton(
                onPressed: context.popDialog,
                icon: Icon(
                  Icons.close_rounded,
                  color: context.colorScheme.onSurface,
                ),
              ).wrapPadding(
                  EdgeInsets.symmetric(horizontal: padding.horizontal / 2)),
            ],
            child.wrapPadding(hasPadding ? padding : AppPadding.zero),
          ],
        ),
      ),
    );
  }
}
