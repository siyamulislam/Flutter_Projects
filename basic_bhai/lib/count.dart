import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  final int count;
  final VoidCallback? onCountSelected;
  Count({required this.count, this.onCountSelected});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('$count'),
      onPressed: () => onCountSelected!(),
    );
  }
}
