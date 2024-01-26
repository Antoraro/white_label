import 'package:flavor/use_case/flavor_count.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final int counter;
  final void Function(int) onCounterUpdated;
  const ActionButton({
    super.key,
    required this.counter,
    required this.onCounterUpdated,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  int _previousCounter = 1;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final value = FlavorCount(_previousCounter).call(widget.counter);
        setState(() => _previousCounter = widget.counter);
        widget.onCounterUpdated(value);
      },
      child: const Icon(Icons.add),
    );
  }
}
