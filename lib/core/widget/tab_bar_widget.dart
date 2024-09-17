import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../utils/app_padding.dart';
import '../extensions/context_extension.dart';
import '../extensions/tab_controller_extension.dart';
import '../extensions/widget_extensions.dart';
import 'button_widget.dart';
import 'card_widget.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({
    super.key,
    ValueNotifier<int>? currentPageIndex,
    required this.tabController,
    required this.tabsTitles,
    this.activeTabColor,
    this.inactiveTabColor,
    this.activeTabTextColor,
    this.inactiveTabTextColor,
    this.tabBarColor,
  }) : currentPageIndex = currentPageIndex ?? ValueNotifier(0);

  final TabController tabController;
  final ValueNotifier<int> currentPageIndex;
  final List<String> tabsTitles;
  final Color? activeTabColor;
  final Color? inactiveTabColor;
  final Color? activeTabTextColor;
  final Color? inactiveTabTextColor;
  final Color? tabBarColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageIndex,
      builder: (context, pageIndex, _) {
        return CardWidget(
          color: tabBarColor ?? context.colorScheme.surface,
          height: AppConstants.tapBarHeight,
          padding: AppPadding.tapBarPadding,
          isOutlined: true,
          child: Row(
            children: List.generate(
              tabsTitles.length,
              (index) => ButtonWidget(
                onPressed: () => _goToPage(index),
                text: tabsTitles[index],
                backgroundColor: pageIndex == index
                    ? (activeTabColor ?? context.colorScheme.primary)
                    : (inactiveTabColor ?? context.colorScheme.surface),
                foregroundColor: (pageIndex == index
                    ? (activeTabTextColor ?? context.colorScheme.onPrimary)
                    : (inactiveTabTextColor ??
                        context.colorScheme.onSurfaceVariant)),
              )
                  .wrapPadding((index != tabsTitles.length - 1)
                      ? const EdgeInsetsDirectional.only(end: 5)
                      : AppPadding.zero)
                  .expand(),
            ),
          ),
        );
      },
    );
  }

  _goToPage(int index) {
    currentPageIndex.value = index;
    tabController.goTo(index);
  }
}
