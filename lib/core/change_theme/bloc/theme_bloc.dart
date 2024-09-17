// import 'package:bloc/bloc.dart';
// import 'package:bloc1/change_theme/theme/app_theme.dart';
// import 'package:bloc1/change_theme/theme/theme_cache_helper.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// part 'theme_event.dart';
// part 'theme_state.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeInitial()) {
//     on<ThemeEvent>((event, emit) async {
//       if (event is GetCurrentThemeEvent) {
//         final themIndex = await ThemeCacheHelper().getCachedThemeIndex();
//         final theme = AppTheme.values
//             .firstWhere((appTheme) => appTheme.index == themIndex);
//         emit(LoadedThemeState(themeData: appThemeData[theme]!));
//       } else if (event is ThemeChangedEvent) {
//         final themeIndex = event.theme.index;
//         await ThemeCacheHelper().cacheThemeIndex(themeIndex);
//         emit(LoadedThemeState(themeData: appThemeData[event.theme]!));
//       }
//     });
//   }
// }
