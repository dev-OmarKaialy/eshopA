import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => SpinKitWave(color: context.colorScheme.primary).center();
}
