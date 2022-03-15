import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:theming_flutter/design_elements/th_app_bar.dart';
import 'package:theming_flutter/design_elements/th_primary_button.dart';
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
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color.background.background,
      appBar: THAppBar.build(
        context,
        title: 'Change theme',
      ),
      body: Center(
        child: Container(
          height: deviceSize.height * 0.5,
          width: deviceSize.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.background.surface,
              boxShadow: [
                BoxShadow(
                  color: color.background.surface.withOpacity(0.4),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                THPrimaryButton(
                  onTap: () =>
                      AppThemeSwitcher.setMode(context, AppThemeMode.system),
                  icon: Icons.settings,
                  text: 'System',
                ),
                const SizedBox(height: 20),
                THPrimaryButton(
                  onTap: () =>
                      AppThemeSwitcher.setMode(context, AppThemeMode.light),
                  icon: Icons.light_mode,
                  text: 'Light',
                ),
                const SizedBox(height: 20),
                THPrimaryButton(
                  onTap: () =>
                      AppThemeSwitcher.setMode(context, AppThemeMode.dark),
                  icon: Icons.dark_mode,
                  text: 'Dark',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
