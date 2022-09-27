import 'dart:async';

import 'package:data/theme/repository/persisted_theme_repository.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theming_flutter/app/widget/app.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();
    final themeRepository = PersistedThemeRepository(preferences);

    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ThemeRepository>(
            create: (context) => themeRepository,
          ),
        ],
        child: const App(),
      ),
    );
  });
}
