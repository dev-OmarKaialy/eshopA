import 'package:flutter/material.dart';

import '../utils/app_strings.dart';
import '../theme/text_theme.dart';
import 'text_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(SvgPath.noData),
        const SizedBox(height: 16),
        TextWidget(
          AppStrings.noData,
          style: textTheme.bodyLarge,
        )
      ],
    );
  }
}
