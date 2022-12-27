import 'package:advicer/application/pages/employee/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../di/injection.dart';
import '../../core/services/theme_service.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => sl<EmployeeBloc>()..add(EmployeeRequestEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Employee Page",
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
        body: Column(
          children: [
            Center(
              child: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  if (state is EmployeeStateLoading) {
                    return Center(child: CircularProgressIndicator(
                      color: themeData.colorScheme.onPrimary,
                    ));
                  } else if (state is EmployeeStateLoaded) {
                    return Text(state.employee.items.first.ename ?? '');
                  } else if (state is EmployeeStateError) {
                    return Text(state.message);
                  }
                  return SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
