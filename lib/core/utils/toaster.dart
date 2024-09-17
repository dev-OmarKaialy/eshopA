import 'package:bot_toast/bot_toast.dart';
import 'package:core/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:zoko/core/components/text_widget.dart';
import 'package:zoko/core/config/app_padding.dart';
import 'package:zoko/core/extensions/context_extension.dart';

class Toaster {
  const Toaster._();

  static void showToast(String text) {
    BotToast.showText(text: text);
  }

  static void showLoading() {
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.close);
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showError({
    required BuildContext context,
    required String errorMessage,
  }) async {
    _showNotification(
      title: const TextWidget('خطأ!', textColor: Colors.white),
      subtitle: TextWidget(errorMessage, maxLines: 3, textColor: Colors.white),
      leading: Icon(Icons.error_outline_rounded,
          color: context.colorScheme.error, size: 35),
      backgroundColor: context.colorScheme.errorContainer,
    );

    if (await Vibration.hasVibrator() ?? false)
      Vibration.vibrate(duration: 150);
  }

  static void showWarning({
    required BuildContext context,
    required String warningMessage,
  }) async {
    _showNotification(
      title: const TextWidget('تنبيه!'),
      subtitle: TextWidget(warningMessage, maxLines: 3),
      leading:
          Icon(Icons.warning_amber_rounded, color: Colors.amber[800], size: 35),
      backgroundColor: Colors.amber[200],
    );

    if (await Vibration.hasVibrator() ?? false)
      Vibration.vibrate(duration: 100);
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
      leading: Icon(Icons.check_circle_outline_rounded,
          color: context.colorScheme.onPrimary, size: 35),
      backgroundColor: context.colorScheme.primaryContainer,
    );
  }

  static void showSheet({
    required BuildContext context,
    required Widget sheet,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      useSafeArea: true,
      backgroundColor: context.colorScheme.background,
      builder: (context) => sheet,
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

    void showSuccessSnackBar(
        {required String message, required BuildContext context}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.green,
        ),
      );
    }

    void showErrorSnackBar(
        {required String message, required BuildContext context}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              message,
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: AppColors.red),
      );
    }
  }
}
