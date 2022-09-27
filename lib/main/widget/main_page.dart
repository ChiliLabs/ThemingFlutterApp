import 'package:flutter/material.dart';
import 'package:theming_flutter/design_elements/th_app_bar.dart';
import 'package:theming_flutter/settings/widget/settings_page.dart';
import 'package:theming_flutter/theme/app_images.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;

    return Scaffold(
      backgroundColor: color.background.background,
      appBar: THAppBar.build(
        context,
        title: 'Discover',
        trailing: const _SettingsIcon(),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: _MainListItem(
              title: 'Lake Tahoe',
              details:
                  'is a large freshwater lake in the Sierra Nevada of the United States. Lying at 6,225 ft (1,897 m), it straddles the state line between California ...',
              image: AppImages.LAKE_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: _MainListItem(
              title: 'Lake Superior',
              details:
                  'is the largest of the Great Lakes of North America, and among freshwater lakes, it is the world\'s largest by surface area and the third-largest by ...',
              image: AppImages.LAKE_2,
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _MainListItem extends StatelessWidget {
  final String title;
  final String details;
  final String image;

  const _MainListItem({
    Key? key,
    required this.title,
    required this.details,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    final typography = appTheme.typography;

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              title,
              style: typography.subtitle.copyWith(
                color: color.text.textPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              details,
              style: typography.paragraphRegular.copyWith(
                color: color.text.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).color;

    return SizedBox(
      height: 40,
      width: 60,
      child: ButtonTheme(
        minWidth: 0,
        height: 40,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          child: Icon(
            Icons.settings,
            color: color.text.textPrimary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
