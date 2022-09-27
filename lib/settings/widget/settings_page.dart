import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:theming_flutter/design_elements/th_app_bar.dart';
import 'package:theming_flutter/design_elements/th_primary_button.dart';
import 'package:theming_flutter/design_elements/th_icon_button.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';
import 'package:theming_flutter/theme/widget/app_theme_switcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    final typography = appTheme.typography;

    return Scaffold(
      backgroundColor: color.background.background,
      appBar: THAppBar.build(
        context,
        title: 'Change theme',
        enableBackButton: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color.background.surface,
                boxShadow: [
                  BoxShadow(
                    color: color.background.surface.withOpacity(0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: typography.subtitle.copyWith(
                        color: color.text.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        THIconButton(
                          onTap: () => AppThemeSwitcher.setColorMode(
                            context,
                            AppColorThemeMode.system,
                          ),
                          icon: Icons.settings,
                        ),
                        const SizedBox(width: 12),
                        THIconButton(
                          onTap: () => AppThemeSwitcher.setColorMode(
                            context,
                            AppColorThemeMode.light,
                          ),
                          icon: Icons.light_mode,
                        ),
                        const SizedBox(width: 12),
                        THIconButton(
                          onTap: () => AppThemeSwitcher.setColorMode(
                            context,
                            AppColorThemeMode.dark,
                          ),
                          icon: Icons.dark_mode,
                        ),
                        const SizedBox(width: 12),
                        THIconButton(
                          onTap: () => AppThemeSwitcher.setColorMode(
                            context,
                            AppColorThemeMode.ocean,
                          ),
                          icon: Icons.water_drop_outlined,
                        ),
                        const SizedBox(width: 12),
                        THIconButton(
                          onTap: () => AppThemeSwitcher.setColorMode(
                            context,
                            AppColorThemeMode.dracula,
                          ),
                          icon: Icons.whatshot_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color.background.surface,
                boxShadow: [
                  BoxShadow(
                    color: color.background.surface.withOpacity(0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text style',
                      style: typography.subtitle.copyWith(
                        color: color.text.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    THPrimaryButton(
                      onTap: () => AppThemeSwitcher.setTypographyMode(
                        context,
                        AppTypographyThemeMode.poppins,
                      ),
                      text: 'Poppins',
                    ),
                    const SizedBox(height: 16),
                    THPrimaryButton(
                      onTap: () => AppThemeSwitcher.setTypographyMode(
                        context,
                        AppTypographyThemeMode.roboto,
                      ),
                      text: 'Roboto',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
