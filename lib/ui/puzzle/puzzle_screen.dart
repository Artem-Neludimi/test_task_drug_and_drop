import 'dart:math';

import 'package:flutter/material.dart';

import './draggable_item.dart';
import '../../constants.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  var items = <String, bool>{
    '1': false,
    '2': false,
  };
  var worldItems = <String, String>{
    '1': 'One',
    '2': 'Two',
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(puzzle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                draggableElement(items.keys.last, theme),
                draggableElement(items.keys.first, theme),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dragTargetElement(items.keys.first, context),
                dragTargetElement(items.keys.last, context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget draggableElement(String data, ThemeData theme) {
    return AbsorbPointer(
      absorbing: items[data]!,
      child: Draggable<String>(
        data: data,
        feedback: DraggableItem(
          data: data,
          color: theme.primaryColorLight,
        ),
        childWhenDragging: DraggableItem(
          data: '',
          color: theme.focusColor,
        ),
        child: DraggableItem(
          data: items[data]! ? '' : data,
          color: items[data]! ? theme.focusColor : theme.primaryColorLight,
        ),
      ),
    );
  }

  Widget dragTargetElement(String data, BuildContext context) {
    var theme = Theme.of(context);
    return DragTarget<String>(
      onAccept: (incomingData) {
        if (incomingData == data) {
          setState(() {
            items[data] = true;
          });
          if (items.values.every((element) => element)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(puzzleIsSolved),
              ),
            );
          }
        }
      },
      builder: (context, _, __) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubicEmphasized,
          height: 80,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: items[data]! ? theme.primaryColor : theme.focusColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(worldItems[data]!, style: theme.textTheme.headlineLarge),
        );
      },
    );
  }
}
