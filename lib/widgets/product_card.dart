import 'package:flutter/material.dart';
import 'package:shoes_app/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final EdgeInsets margin;
  final Function onTap;
  ProductCard(
      {required this.product,
      required this.onTap,
      super.key,
      this.margin = const EdgeInsets.only()});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5),
          ],
          image: DecorationImage(
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              image: NetworkImage(product.image)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _productPricing(context),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productPricing(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price.toString()}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        Icon(Icons.favorite_outline)
      ],
    );
  }
}
