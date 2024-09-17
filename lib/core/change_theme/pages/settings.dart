// import 'package:bloc1/change_theme/bloc/theme_bloc.dart';
// import 'package:bloc1/change_theme/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: AppTheme.values.length,
//         itemBuilder: (context, index) {
//           final itemAppTheme = AppTheme.values[index];
//           return Card(
//               color: appThemeData[itemAppTheme]!.primaryColor,
//               child: ListTile(
//                 title: Text(
//                   itemAppTheme.name,
//                   style: appThemeData[itemAppTheme]!.textTheme.titleMedium,
//                 ),
//                 onTap: () {
//                   context
//                       .read<ThemeBloc>()
//                       .add(ThemeChangedEvent(theme: itemAppTheme));
//                 },
//               ));
//         },
//       ),
//     );
//   }
// }
