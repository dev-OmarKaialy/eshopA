// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:go_router/go_router.dart';

// import '../../router/app_routes.dart';
// import '../config/app_assets.dart';
// import '../config/app_dimensions.dart';
// import '../config/app_padding.dart';
// import '../config/app_strings.dart';
// import '../extensions/context_extension.dart';
// import '../extensions/num_extension.dart';
// import '../extensions/widget_extensions.dart';
// import '../theme/text_theme.dart';
// import 'bottom_sheet_widget.dart';
// import 'button_widget.dart';
// import 'card_widget.dart';
// import 'image_widget.dart';
// import 'text_widget.dart';

// class SearchAndFilterBar<T> extends StatelessWidget {
//   const SearchAndFilterBar({
//     super.key,
//     required this.suggestionItemBuilder,
//     required this.suggestionsCallback,
//     required this.onSuggestionSelected,
//     required this.hint,
//     required this.entityType,
//     this.hasQrScannerOption = false,
//     this.textEditingController,
//     this.onSubmitted,
//     this.onCancel,
//   });

//   final Widget Function(BuildContext, T) suggestionItemBuilder;
//   final FutureOr<Iterable<T>> Function(String) suggestionsCallback;
//   final void Function(T) onSuggestionSelected;
//   final String hint;
//   final String entityType;
//   final bool hasQrScannerOption;
//   final TextEditingController? textEditingController;
//   final Function(String)? onSubmitted;
//   final VoidCallback? onCancel;

//   @override
//   Widget build(BuildContext context) {
//     final outlineInputBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(width: 1.5, color: context.colorScheme.outline),
//     );
//     return Row(
//       children: [
//         StatefulBuilder(
//           builder: (context, setState) {
//             return TypeAheadField<T>(
//               itemBuilder: suggestionItemBuilder,
//               suggestionsCallback: suggestionsCallback,
//               onSuggestionSelected: onSuggestionSelected,
//               noItemsFoundBuilder: (context) => SizedBox(
//                 height: AppDimensions.buttonHeight,
//                 child: const TextWidget(AppStrings.noData).center(),
//               ),
//               minCharsForSuggestions: 1,
//               getImmediateSuggestions: false,
//               intercepting: true,
//               textFieldConfiguration: TextFieldConfiguration(
//                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
//                 controller: textEditingController,
//                 cursorColor: Theme.of(context).primaryColor,
//                 textInputAction: TextInputAction.search,
//                 onSubmitted: onSubmitted,
//                 onChanged: (value) => setState(() {}),
//                 decoration: InputDecoration(
//                   contentPadding: AppPadding.def,
//                   filled: true,
//                   fillColor: context.colorScheme.surface,
//                   prefixIcon: Icon(Icons.search_rounded, color: context.colorScheme.primary),
//                   hintText: hint,
//                   hintStyle: textTheme.labelLarge,
//                   suffixIcon: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       if (textEditingController?.text.isNotEmpty ?? false)
//                         IconButton(
//                           onPressed: () {
//                             textEditingController?.clear();
//                             onCancel?.call();
//                           },
//                           icon: const Icon(Icons.close_rounded),
//                         ),
//                       if (hasQrScannerOption)
//                         IconButton(
//                           onPressed: () async {
//                             final result = await context.pushNamed<String>(AppRoutes.barcodeScanner);
//                             if (result != null) textEditingController?.text = result;
//                           },
//                           icon: const Icon(Icons.qr_code_scanner_rounded),
//                         ),
//                     ],
//                   ),
//                   enabledBorder: outlineInputBorder,
//                   disabledBorder: outlineInputBorder,
//                   focusedBorder: outlineInputBorder,
//                   border: outlineInputBorder,
//                 ),
//               ),
//             ).expand();
//           },
//         ),
//         AppDimensions.verySmallSizedBox.ws,
//         ButtonWidget(
//           onPressed: () => showModalBottomSheet(
//             context: context,
//             isScrollControlled: true,
//             builder: (context) => BottomSheetWidget(child: _FilterBottomSheet(entityType: entityType)),
//           ),
//           height: 45,
//           width: 45,
//           backgroundColor: context.colorScheme.surface,
//           isOutlined: true,
//           prefixIcon: const ImageWidget(path: AppAssets.filterIcon),
//         ),
//       ],
//     );
//   }
// }

// class _FilterBottomSheet extends StatelessWidget {
//   const _FilterBottomSheet({required this.entityType});

//   final String entityType;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextWidget(
//           'تصفية $entityType حسب : ',
//           style: textTheme.titleLarge?.copyWith(color: context.colorScheme.onSurface),
//         ),
//         AppDimensions.mediumSizedBox.hs,
//         CardWidget(
//           isOutlined: true,
//           onTap: () => log('message'),
//           child: ListTile(
//             leading: Icon(Icons.location_on_rounded, color: context.colorScheme.primary),
//             title: const TextWidget('تصفية حسب المنطقة'),
//             trailing: const Icon(Icons.arrow_back_ios_new_rounded),
//           ),
//         ),
//         AppDimensions.mediumSizedBox.hs,
//         Row(
//           children: [
//             ButtonWidget(
//               onPressed: () {},
//               backgroundColor: context.colorScheme.primary,
//               foregroundColor: context.colorScheme.onPrimary,
//               height: 50,
//               text: 'حفظ التصفية',
//             ).expand(),
//             AppDimensions.smallSizedBox.ws,
//             ButtonWidget(
//               onPressed: context.popDialog,
//               isOutlined: true,
//               borderColor: context.colorScheme.error,
//               backgroundColor: context.colorScheme.surface,
//               foregroundColor: context.colorScheme.error,
//               height: 50,
//               text: 'إلغاء التصفية',
//             ).expand(),
//           ],
//         ).wrapPadding(AppPadding.small),
//         AppDimensions.mediumSizedBox.hs,
//       ],
//     );
//   }
// }
