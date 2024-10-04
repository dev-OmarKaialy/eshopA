import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../extensions/widget_extensions.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.radius,
    this.isOutlined = false,
    this.isExpandedText = false,
    this.isElevated = false,
    this.borderColor,
    this.width,
    this.height,
    this.padding,
    this.spaceBetween,
    this.textDirection,
    this.textStyle,
    this.disabled = false,
  }) : assert(prefixIcon != null || text != null);

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final double? spaceBetween;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;
  final bool isExpandedText;
  final bool isElevated;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium1,
      padding: padding ?? EdgeInsets.zero,
      height: 48.0,
      width: getFixedSize?.width,
      decoration: disabled
          ? ShapeDecoration(
              color: (isOutlined ? (backgroundColor ?? Colors.transparent) : (backgroundColor ?? context.colorScheme.surfaceContainer))
                  .withOpacity(0.4),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: (isOutlined ? (borderColor ?? Theme.of(context).colorScheme.outline) : Colors.transparent).withOpacity(0.4),
                  width: 1,
                ),
              ),
            )
          : ShapeDecoration(
              color: isOutlined ? (backgroundColor ?? Colors.transparent) : (backgroundColor ?? context.colorScheme.surfaceContainer),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: isOutlined ? (borderColor ?? Theme.of(context).colorScheme.outline) : Colors.transparent,
                  width: 1,
                ),
              ),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          if (spaceBetween != null && text != null && prefixIcon != null) SizedBox(width: spaceBetween),
          if (text != null)
            TextWidget(
              text,
              textDirection: textDirection,
              style: (textStyle ?? context.textTheme.bodyMedium)
                  ?.copyWith(color: disabled ? foregroundColor?.withOpacity(0.4) : foregroundColor),
            ).expand(flex: isExpandedText ? 1 : 0),
          if (spaceBetween != null && text != null && suffixIcon != null) SizedBox(width: spaceBetween),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    ).onTap(disabled ? null : onPressed);
  }

  Size? get getFixedSize {
    if (width == null && height == null) {
      return null;
    } else if (width != null && height == null) {
      return Size.fromWidth(width!);
    } else if (width == null && height != null) {
      return Size.fromHeight(height!);
    } else {
      return Size(width!, height!);
    }
  }
}
