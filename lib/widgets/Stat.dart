import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {
  final String number;
  final String label;

  const StatWidget({
    Key key,
    @required this.number,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline4.fontSize,
            fontWeight: Theme.of(context).textTheme.headline4.fontWeight,
            color: Colors.white,
          ),
        ),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline6.fontSize,
            fontWeight: Theme.of(context).textTheme.headline4.fontWeight,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
