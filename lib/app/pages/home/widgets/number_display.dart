import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  final int currentValue;

  NumberDisplay({
    @required this.currentValue
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          this.currentValue.toString(),
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    ),
  );
}