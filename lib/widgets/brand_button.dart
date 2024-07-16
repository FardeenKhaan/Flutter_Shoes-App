import 'package:flutter/material.dart';
import 'package:shoes_app/models/brand.dart';

class BrandButton extends StatelessWidget {
  final Brand brand;
  final bool isSelected;
  const BrandButton(this.brand, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    double iconsize = MediaQuery.of(context).size.width * 0.05;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      // margin: EdgeInsets.all(0.8),
      decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white : Colors.black38),
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: iconsize,
            width: iconsize,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: Image.network(
              brand.iconURL,
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
          Text(
            brand.name,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
