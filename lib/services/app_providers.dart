import 'package:flutter/material.dart';
import 'package:piwigo_ng/services/theme_provider.dart';
import 'package:piwigo_ng/utils/LocaleProvider.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key, required this.builder}) : super(key: key);

  final Widget Function(LocaleNotifier, ThemeNotifier) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleNotifier(),
      child: ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<LocaleNotifier>(builder: (context, localNotifier, child) {
          return Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, child) {
              return builder(localNotifier, themeNotifier);
            },
          );
        }),
      ),
    );
  }
}
