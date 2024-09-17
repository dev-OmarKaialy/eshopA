import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';
import '../utils/app_padding.dart';
import '../extensions/context_extension.dart';
import '../extensions/num_extension.dart';
import '../extensions/widget_extensions.dart';
import '../theme/text_theme.dart';
import 'text_widget.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.title,
    this.hasRemoveIcon = false,
    this.onRemove,
  });

  final String title;
  final VoidCallback? onRemove;
  final bool hasRemoveIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: AppPadding.choiceChipPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            title,
            style: textTheme.bodyMedium
                ?.copyWith(color: context.colorScheme.onTertiaryContainer),
          ),
          if (hasRemoveIcon) ...[
            AppDimensions.smallSizedBox.ws,
            Icon(Icons.close_rounded,
                    size: 20, color: context.colorScheme.onSurface)
                .onTap(onRemove),
          ],
        ],
      ),
    );
  }
}
