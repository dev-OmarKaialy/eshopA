import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/extensions/widget_extensions.dart';
import 'package:eshop_a/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(SvgPath.noData),
        const SizedBox(height: 16),
        TextWidget(
          'noData',
          style: context.textTheme.bodyLarge,
        ),
        const Gap(5),
        if (onTap != null) const Icon(Icons.refresh_rounded)
      ],
    ).onTap(onTap);
  }
}
