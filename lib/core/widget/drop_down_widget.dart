import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';
import '../utils/app_padding.dart';
import '../extensions/context_extension.dart';
import '../extensions/num_extension.dart';
import '../theme/text_theme.dart';
import 'text_widget.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.listenableValue,
    // required this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hint,
  });

  // final T? value;
  final ValueNotifier<T?> listenableValue;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          TextWidget(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppDimensions.verySmallSizedBox.hs,
        ],
        Container(
          height: AppDimensions.buttonHeight,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
              color: context.colorScheme.outline,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: listenableValue,
            builder: (context, value, _) {
              return DropdownButton<T?>(
                value: value,
                hint: TextWidget(
                  hint ?? 'اختر',
                  style: textTheme.bodyMedium?.copyWith(fontFamily: 'Cairo'),
                ),
                style: textTheme.titleSmall
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
                borderRadius: BorderRadius.circular(8),
                // focusColor: AppColors.surfaceContainerLow(context),
                underline: const SizedBox.shrink(),
                items: items,
                onChanged: (value) {
                  listenableValue.value = value;
                  onChanged?.call(value);
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                padding: AppPadding.buttonPadding,
                isDense: true,
                // dropdownColor: AppColors.surfaceContainerLow(context),
              );
            },
          ),
        ),
      ],
    );
  }
}
