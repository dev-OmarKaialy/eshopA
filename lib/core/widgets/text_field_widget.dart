import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.hideText = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.maxLines,
    this.focusNode,
    this.width,
    this.height,
    this.label,
    this.hint,
    this.onSubmitted,
    this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.inputFormatters,
    this.initialValue,
    this.canRequestFocus = true,
  });

  final TextInputAction textInputAction;
  final String? initialValue;
  final FocusNode? focusNode;
  final double? height;
  final double? width;
  final Function(String)? onSubmitted;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool hideText;
  final bool enabled;
  final bool autoFocus;
  final bool smallSuffixIcon;
  final bool error;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? inputFormatters;
  final bool canRequestFocus;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> with WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addObserver(this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        canRequestFocus: widget.canRequestFocus,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onSaved: widget.onSubmitted?.call(widget.controller!.text),
        controller: widget.controller,
        validator: widget.validator,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        cursorColor: context.colorScheme.primary,
        enabled: widget.enabled,
        inputFormatters: (widget.inputFormatters != null)
            ? widget.inputFormatters
            : widget.keyboardType == TextInputType.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        autofocus: widget.autoFocus,
        obscureText: widget.hideText,
        enableSuggestions: !widget.hideText,
        autocorrect: !widget.hideText,
        autovalidateMode: widget.autovalidateMode,
        onTap: () {
          if (widget.controller == null) return;
          final lastSelectionPosition = TextSelection.fromPosition(
            TextPosition(offset: widget.controller!.text.length - 1),
          );

          final afterLastSelectionPosition = TextSelection.fromPosition(
            TextPosition(offset: widget.controller!.text.length),
          );

          if (widget.controller!.selection == lastSelectionPosition) {
            widget.controller!.selection = afterLastSelectionPosition;
          }
        },
        decoration: InputDecoration(
          label: widget.label == null ? null : TextWidget(widget.label!),
          hintText: widget.hint?.tr(),
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: context.width * .15) : null,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: context.width * .15) : null,
        ),
      ),
    );
  }
}
