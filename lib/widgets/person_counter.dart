import 'package:flutter/material.dart';

class PersonCount extends StatelessWidget {
  const PersonCount({
    super.key,
    required this.theme,
    required int personCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("split", style: theme.textTheme.titleMedium),
        Row(
          children: [
            IconButton(onPressed: onDecrement, icon: Icon(Icons.remove)),
            Text("$_personCount", style: theme.textTheme.titleMedium),
            IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
