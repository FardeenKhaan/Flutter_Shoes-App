import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final int size;
  final bool isSelected;
  const SizeButton(
    this.size, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white : Colors.black),
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        size.toString(),
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black38,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
