import 'package:bot_toast/bot_toast.dart';
import 'package:eshop_a/core/api/error/failure.dart';
import 'package:eshop_a/core/config/app_padding.dart';
import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/helper/helper.dart';
import 'package:eshop_a/core/utilities/vibrator.dart';
import 'package:eshop_a/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Toaster {
  const Toaster._();

  static void showToast(String text) {
    BotToast.showText(
      text: text.tr(),
      duration: const Duration(seconds: 6),
    );
  }

  static void showLoading() {
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.ignore);
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showFailure({
    required BuildContext context,
    required Failure failure,
    bool vibrate = true,
  }) async {
    _showNotification(
      title: TextWidget(LocaleKeys.error, children: [TextWidget(' ${failure.statusCode ?? ''}')]),
      subtitle: TextWidget(
        failure.message,
        maxLines: 10,
      ),
      leading: Icon(Icons.error_outline_rounded, color: context.colorScheme.error, size: 35),
      backgroundColor: context.colorScheme.errorContainer,
    );

    if (vibrate) Vibrator.errorVibrate();
  }

  static void showError({
    required BuildContext context,
    required String message,
    bool vibrate = true,
  }) async {
    _showNotification(
      title: const TextWidget(LocaleKeys.error),
      subtitle: TextWidget(message, maxLines: 3),
      leading: Icon(Icons.error_outline_rounded, color: context.colorScheme.error, size: 35),
      backgroundColor: context.colorScheme.errorContainer,
    );

    if (vibrate) Vibrator.errorVibrate();
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    bool vibrate = true,
  }) async {
    _showNotification(
      title: const TextWidget(LocaleKeys.alert),
      subtitle: TextWidget(message, maxLines: 3),
      leading: Icon(Icons.warning_amber_rounded, color: Colors.amber[800], size: 35),
      backgroundColor: Colors.amber[200],
    );

    if (vibrate) Vibrator.warningVibrate();
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) async {
    _showNotification(
      title: TextWidget(
        message,
        maxLines: 3,
        style: TextStyle(color: context.colorScheme.onPrimaryContainer),
      ),
      leading: Icon(Icons.check_circle_outline_rounded, color: context.colorScheme.onPrimary, size: 35),
      backgroundColor: context.colorScheme.primaryContainer,
    );
  }

  static void _showNotification({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Color? backgroundColor,
  }) {
    BotToast.showNotification(
      title: (_) => title,
      subtitle: (subtitle != null) ? (_) => subtitle : null,
      leading: (leading != null) ? (_) => leading : null,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 4),
      margin: AppPadding.notificationPadding,
    );
  }
}
