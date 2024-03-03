import 'package:flutter/material.dart';

class MyGuideScreen extends StatelessWidget {
  const MyGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double fem = size.width / 380;
    final double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30 * fem), // Adjust the space between header and content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/tomato.jpeg',
                  title: 'Fruit and Vegetable Scraps',
                  content:
                      'Compost: Add to your compost bin for nutrient-rich soil. \nReuse: Make vegetable broth from peels or use citrus peels for homemade cleaners.',
                ),
                SizedBox(height: 20 * fem), // Adjust the space between content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/food container.jpeg',
                  title: 'Food Container',
                  content: 'Compost: Clean cardboard/paper and tear for compost. \nReuse: Use for storage, crafts, or recycle for new products.',
                ),
                SizedBox(height: 20 * fem), // Adjust the space between content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/fish.jpeg',
                  title: 'Meat and Fish Scraps',
                  content: 'Compost: Add sparingly; bury deep to deter pests.\nReuse: Use leftover meat/fish for soups or stocks.',
                ),
                SizedBox(height: 20 * fem), // Adjust the space between content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/egg.jpeg',
                  title: 'Eggshells',
                  content: 'Compost: Crush and add to compost for calcium boost.\nReuse: Crushed shells deter pests; use as calcium supplement.',
                ),
                SizedBox(height: 20 * fem), // Adjust the space between content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/milk.jpeg',
                  title: 'Dairy Products (e.g., Milk, Cheese)',
                  content: 'Compost: Use sparingly; bury deep to avoid odor.\nReuse: Make yogurt or cheese from expired milk; use cheese rinds for flavor.',
                ),
                SizedBox(height: 20 * fem), // Adjust the space between content
                PositionedContent(
                  left: 24 * fem,
                  imageUrl: 'assets/images/bread.jpeg',
                  title: 'Stale Bread and Pastries',
                  content: 'Compost: Tear into small pieces and add to compost.\nReuse: Make breadcrumbs, croutons, or bread pudding.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PositionedContent extends StatelessWidget {
  final double left;
  final String imageUrl;
  final String title;
  final String content;

  const PositionedContent({
    Key? key,
    required this.left,
    required this.imageUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double fem = size.width / 380;
    final double ffem = fem * 0.97;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 24 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6 * fem),
            width: 48 * fem,
            height: 48 * fem,
            child: Image.asset(
              imageUrl,
              width: 48 * fem,
              height: 48 * fem,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: Color(0xff2d3648),
            ),
          ),
          SizedBox(height: 6 * fem),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.14,
              color: Color(0xff717d96),
            ),
          ),
        ],
      ),
    );
  }
}
