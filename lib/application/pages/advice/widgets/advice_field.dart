import 'package:flutter/material.dart';
class AdviceField extends StatelessWidget {
  final String advice;
  const AdviceField({Key? key,required this.advice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child:  Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Text(advice,style: themeData.textTheme.bodyText1,textAlign: TextAlign.justify,),
        ),
      ),
    );
  }
}
