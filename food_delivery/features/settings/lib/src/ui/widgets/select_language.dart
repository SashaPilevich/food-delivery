import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.all(
        AppPadding.padding30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'settingsScreen.selectLanguage'.tr(),
                style: themeData.textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      if (context.locale == const Locale('pl', 'PL')) {
                        context.setLocale(
                          const Locale('en', 'US'),
                        );
                      }
                    },
                    child: Image.asset(
                      ImagePath.flagOfUSA,
                      width: AppSize.size30,
                      height: AppSize.size30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (context.locale == const Locale('en', 'US')) {
                        context.setLocale(
                          const Locale('pl', 'PL'),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        ImagePath.flagOfPoland,
                        width: AppSize.size30,
                        height: AppSize.size30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.size60,
          ),
          SizedBox(
            width: mediaQuery.size.width,
            child: Link(
              uri: Uri.parse('https://innowise-group.com/'),
              builder: (BuildContext context, followLink) {
                return ElevatedButton(
                  onPressed: followLink,
                  child: Text(
                    'settingsScreen.contactUs'.tr(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
