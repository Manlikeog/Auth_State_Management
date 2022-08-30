import 'package:flutter/material.dart';

import 'package:food_app/interface/router/route_name.dart';
import 'package:food_app/utils/color.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: deepprimaryColor,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/onboard.png",
                fit: BoxFit.fill,
                width: size.width * 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 68),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.1,
                        backgroundColor: whiteColor,
                        child: Image.asset(
                          "assets/images/logo2.png",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                        width: double.infinity,
                      ),
                      const Text(
                        "Food for Everyone",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isLoading = true;
                        });

                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            setState(() {
                              _isLoading = false;
                            });
                            _navigateAuth(context);
                          },
                        );
                      },
                      child: Container(
                        width: size.width * 0.6,
                        height: size.height * 0.064,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: whiteColor,
                                  color: primaryColor,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "Get Started",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

_navigateAuth(BuildContext context) {
  Navigator.pushReplacementNamed(
    context,
authRoute
  );
}
