// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:food_app/interface/pages/auth/login_view.dart';
import 'package:food_app/interface/pages/auth/sign_view.dart';
import 'package:food_app/utils/color.dart';

import '../onboard/onboard_page.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with TickerProviderStateMixin {
  late TabController? controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhiteColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('assets/images/logo2.png'),
                  ),
                  TabBar(
                    indicatorColor: primaryColor,
                    controller: controller,
                    labelColor: blackColor,
                    unselectedLabelColor: const Color(0xff9A9A9D),
                    onTap: ((int tabindex) {
                      setState(() {
                        tabindex = controller!.index;
                      });
                    }),
                    tabs: const [
                      Tab(
                        child: Text(
                          'Login',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Sign-up',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 4,
            child: TabBarView(
              physics: const ScrollPhysics(),
              controller: controller,
              children: [
                Login(),
                Signup(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
