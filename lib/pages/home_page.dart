import 'package:flutter/material.dart';
import 'package:shoes_app/data.dart';
import 'package:shoes_app/models/brand.dart';
import 'package:shoes_app/models/product.dart';
import 'package:shoes_app/pages/product_page.dart';
import 'package:shoes_app/widgets/brand_button.dart';
import 'package:shoes_app/widgets/product_card.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildUI(context),
        bottomNavigationBar: _bottomNavigationbar(context));
  }

  Widget _bottomNavigationbar(BuildContext context) {
    return WaterDropNavBar(
        backgroundColor: Colors.white,
        bottomPadding: MediaQuery.of(context).size.height * 0.02,
        waterDropColor: Theme.of(context).colorScheme.primary,
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
              filledIcon: Icons.shopping_bag,
              outlinedIcon: Icons.shopping_bag_outlined),
          BarItem(
              filledIcon: Icons.notifications,
              outlinedIcon: Icons.notifications_outlined),
          BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person_outline),
        ],
        selectedIndex: 0,
        onItemSelected: (index) {});
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topbar(context),
            _title(),
            _searchfield(context),
            _categorieslist(context),
            _productsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _topbar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/Profile.jpg'))
        ],
      ),
    );
  }

  Widget _title() {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'Discover',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
    ]));
  }

  Widget _searchfield(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: TextFormField(),
          )
        ],
      ),
    );
  }

  Widget _categorieslist(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            Brand brand = brands[index];
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: BrandButton(brand, index == 0));
          }),
    );
  }

  Widget _productsGrid(BuildContext context) {
    return Expanded(
        child: Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75, crossAxisCount: 2),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return ProductCard(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    product: product,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(product)));
                    },
                  );
                })));
  }
}
