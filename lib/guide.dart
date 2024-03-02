import 'package:flutter/material.dart';

class MyGuideScreen extends StatelessWidget {
  const MyGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fem = 1.0; // Define your scaling factor
    const double ffem = 1.0; // Define another scaling factor if needed

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: 844 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 16 * fem,
              top: 53 * fem,
              child: Align(
                child: SizedBox(
                  width: 143 * fem,
                  height: 30 * fem,
                  child: Text(
                    'ExpirySmart',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24 * fem,
              top: 127 * fem, // Adjust the position as needed
              child: Container(
                width: 324 * fem,
                height: 194 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
                      width: 48 * fem,
                      height: 48 * fem,
                      child: Image.network(
                        '[Image url]', // Replace with your image URL
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
                              'Green food\n',
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
                            constraints: BoxConstraints(maxWidth: 324 * fem),
                            child: Text(
                              'Dictumst scelerisque ut commodo dis. Risus ac tellus sapien gravida sit elementum dui eget nunc. Eu arcu montes, sit elit, maecenas feugiat. Urna, habitant suspendisse suspendisse pharetra nec. Nibh mauris nullam nec mattis.',
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
            ),
            Positioned(
              left: 24 * fem,
              top: 342 * fem, // Adjust the position as needed
              child: Container(
                width: 324 * fem,
                height: 194 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
                      width: 48 * fem,
                      height: 48 * fem,
                      child: Image.network(
                        '[Image url]', // Replace with your image URL
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
                              'Food container\n',
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
                            constraints: BoxConstraints(maxWidth: 324 * fem),
                            child: Text(
                              'Dictumst scelerisque ut commodo dis. Risus ac tellus sapien gravida sit elementum dui eget nunc. Eu arcu montes, sit elit, maecenas feugiat. Urna, habitant suspendisse suspendisse pharetra nec. Nibh mauris nullam nec mattis.',
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
            ),
            Positioned(
              left: 24 * fem,
              top: 564 * fem, // Adjust the position as needed
              height: 194 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
                      width: 48 * fem,
                      height: 48 * fem,
                      child: Image.network(
                        '[Image url]', // Replace with your image URL
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
                              'Food container\n',
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
                            constraints: BoxConstraints(maxWidth: 324 * fem),
                            child: Text(
                              'Dictumst scelerisque ut commodo dis. Risus ac tellus sapien gravida sit elementum dui eget nunc. Eu arcu montes, sit elit, maecenas feugiat. Urna, habitant suspendisse suspendisse pharetra nec. Nibh mauris nullam nec mattis.',
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
          ]
        )
      )
     );
  }
}