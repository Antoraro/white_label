import 'package:flavor/use_case/flavor_count.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final int counter;
  final void Function(int) onCounterUpdated;
  const ActionButton({
    super.key,
    required this.counter,
    required this.onCounterUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final value = FlavorCount().call(counter);
        onCounterUpdated(value);
      },
      child: const Icon(Icons.add),
    );
  }
}
