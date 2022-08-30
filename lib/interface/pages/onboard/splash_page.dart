import 'package:flutter/material.dart';

import 'package:food_app/interface/router/route_name.dart';
import 'package:food_app/utils/color.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateOnBoard();
  }

  _navigateOnBoard() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(
      context, onBoardRoute
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.fill,
          ),
          Center(
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(170),
                color: whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: Text(
                      "Food for Everyone",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: whiteColor,
                        color: primaryColor,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.18,
            top: size.height * 0.30,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ],
      ),
    );
  }
}
