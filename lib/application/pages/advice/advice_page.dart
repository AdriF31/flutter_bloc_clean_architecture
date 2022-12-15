import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advice Page",
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Expanded(
                  child: Center(
                child: ErrorMessage(message: "something went wrong",)
                // AdviceField(
                //   advice: "something",
                // )
                // CircularProgressIndicator(color: themeData.colorScheme.secondary,)
                // Text(
                //   "Get your advice here",
                //   style: themeData.textTheme.headline1,
                // ),
              )),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
