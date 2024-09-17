import 'package:flutter/material.dart';

import '../extensions/widget_extensions.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator.adaptive()).center();
}
