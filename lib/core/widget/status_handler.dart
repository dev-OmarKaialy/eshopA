import 'package:flutter/material.dart';

import '../utils/cubit_status.dart';
import '../extensions/widget_extensions.dart';
import 'empty_widget.dart';
import 'error_widget.dart';
import 'loading_widget.dart';

class StatusHandler extends StatelessWidget {
  const StatusHandler({
    super.key,
    required this.status,
    required this.successWidget,
    this.loadingWidget,
    this.isEmpty = false,
    this.onErrorTapped,
  });

  final CubitStatus status;
  final Widget successWidget;
  final Widget? loadingWidget;
  final bool isEmpty;
  final VoidCallback? onErrorTapped;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      CubitStatus.initial => const SizedBox.shrink(),
      CubitStatus.failure => ErrorButtonWidget(onTap: onErrorTapped),
      CubitStatus.loading =>
        loadingWidget ?? const LoadingWidget().center().expand(),
      CubitStatus.success =>
        (isEmpty) ? const EmptyWidget().center() : successWidget,
    };
  }
}
