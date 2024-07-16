import 'package:flutter/material.dart';
import 'package:shoes_app/models/product.dart';
import 'package:shoes_app/widgets/add_button.dart';
import 'package:shoes_app/widgets/size_button.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _buildUI(context),
      appBar: _appbar(),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        _productImage(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _productDetails(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              image: NetworkImage(product.image))),
    );
  }

  Widget _productDetails(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              )),
              _productTitleandeviews(context),
              _productPrice(context),
              _productDescription(context),
              _sizeSelector(),
              _addtocartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productTitleandeviews(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("⭐${product.rating.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
      ],
    );
  }

  Widget _productPrice(BuildContext context) {
    return Text(
      '\$${product.price}',
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: Theme.of(context).colorScheme.primary),
    );
  }

  Widget _productDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05),
        child: Text('${product.description}'));
  }

  Widget _sizeSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text(
            'Select a size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          children: [
            SizeButton(7),
            SizeButton(8),
            SizeButton(
              9,
              isSelected: true,
            ),
            SizeButton(10),
            SizeButton(11),
            SizeButton(12),
          ],
        )
      ],
    );
  }

  Widget _addtocartButton(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //     vertical: MediaQuery.of(context).size.height * 0.01),
      child: AddButton(MediaQuery.of(context).size.height * 0.05,
          MediaQuery.of(context).size.width * 0.80),
    );
  }
}
