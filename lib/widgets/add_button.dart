import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final double height, width;
  const AddButton(this.height, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            Text(
              'Add to Bag',
              style: TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
