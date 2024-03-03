import 'package:flutter/material.dart';

class MyGuideScreen extends StatelessWidget {
  const MyGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20), // Adjust the top padding here
          child: Container(
            width: double.infinity,
            height: 844,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: <Widget>[
                PositionedContent(
                  left: 24,
                  top: 30,
                  imageUrl: 'assets/images/tomato.jpeg',
                  title: 'Green Food',
                  content:
                      'Dictumst scelerisque ut commodo dis. Risus ac tellus sapien gravida sit elementum dui eget nunc. Risus ac tellus sapien gravida sit elementum dui eget nunc.',
                ),
                PositionedContent(
                  left: 24,
                  top: 230,
                  imageUrl: 'assets/images/food container.jpeg',
                  title: 'Food Container',
                  content: 'Dictumst scelerisque ut commodo dis. Risus ac tellus sapien gravida sit elementum dui eget nunc.',
                ),
                PositionedContent(
                  left: 24,
                  top: 430,
                  imageUrl: 'assets/images/meat.png',
                  title: 'Meat',
                  content: 'Eu arcu montes, sit elit, maecenas feugiat. Urna, habitant suspendisse suspendisse pharetra nec.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PositionedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 380;
    double ffem = fem * 0.97;
    return Positioned(
      left: 16 * fem,
      top: 53 * fem,
      child: Align(
        child: SizedBox(
          width: 143 * fem,
          height: 15 * fem,
        ),
      ),
    );
  }
}

class PositionedContent extends StatelessWidget {
  final double left;
  final double top;
  final String imageUrl;
  final String title;
  final String content;

  const PositionedContent({
    Key? key,
    required this.left,
    required this.top,
    required this.imageUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 380;
    double ffem = fem * 0.97;
    return Positioned(
      left: left * fem,
      top: top * fem,
      child: Container(
        width: 324 * fem,
        height: 190 * fem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
              width: 48 * fem,
              height: 48 * fem,
              child: Image.asset(
                imageUrl,
                width: 48 * fem,
                height: 48 * fem,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3999999762 * ffem / fem,
                        color: Color(0xff2d3648),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300 * fem),
                    child: Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        letterSpacing: -0.14 * fem,
                        color: Color(0xff717d96),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
