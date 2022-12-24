import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice/widgets/error_message.dart';
import 'package:advicer/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerBloc>(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({Key? key}) : super(key: key);

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
            children: [
              Expanded(child: Center(
                  child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {

                  if (state is AdvicerInitial) {
                    return Text(
                      "Get your advice here",
                      style: themeData.textTheme.headline1,
                    );
                  }
                  else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.onPrimary,
                    );
                  }
                  else if (state is AdvicerStateError) {
                    return ErrorMessage(
                      message: state.message,
                    );
                  }
                  else if(state is AdvicerStateLoaded){
                    return AdviceField(
                      advice: state.advice,
                    );
                  }
                  return const SizedBox();
                },
              )

                  // CircularProgressIndicator(color: themeData.colorScheme.secondary,)

                  )),
              const CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
