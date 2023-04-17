import 'package:flutter/material.dart';

class DraggableItem extends StatelessWidget {
  final String data;
  final Color color;

  const DraggableItem({
    super.key,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(data, style: theme.textTheme.headlineLarge),
    );
  }
}
