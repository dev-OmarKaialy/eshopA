import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/extensions/widget_extensions.dart';
import 'package:eshop_a/core/helper/src/locale_keys.dart';
import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'text_widget.dart';

class ErrorButtonWidget extends StatelessWidget {
  const ErrorButtonWidget({
    super.key,
    required this.onTap,
    this.color,
    this.textColor,
    this.errorMessage,
    this.buttonWidth,
  });

  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final String? errorMessage;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   SvgPath.networkError,
          //   width: size.width * .25,
          // ),
          SizedBox(height: context.width * .02),
          TextWidget(
            LocaleKeys.error,
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(height: context.width * .02),
          if (errorMessage != null)
            TextWidget(
              errorMessage,
              maxLines: 6,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
          SizedBox(height: context.width * .02),
          SizedBox(
            height: context.width * .12,
            child: FittedBox(
              child: ButtonWidget(
                onPressed: onTap ?? () {},
                width: buttonWidth ?? context.width * .3,
                height: 40,
                text: 'tryAgain',
                backgroundColor: context.colorScheme.error,
                foregroundColor: context.colorScheme.onError,
              ),
            ),
          ),
        ],
      ),
    ).center();
  }
}
