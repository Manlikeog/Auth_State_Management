// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/interface/pages/dashboard/home/home.dart';
import 'package:food_app/interface/router/route_name.dart';
import 'package:food_app/interface/widgets/input_field.dart';
import 'package:food_app/logic/login_bloc/bloc/login_bloc.dart';
import 'package:food_app/utils/color.dart';

import '../onboard/onboard_page.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginBloc? loginBloc;
  Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginInitial) {
                    const Center(child: Text('Waiting'));
                  }

                  if (state is LoginSucceed) {
                    Navigator.pushReplacementNamed(context, homeRoute);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoginFailed) {
                    return // just in case of an unexpected error
                        Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
              InputField(
                controller: mailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your valid email address';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                labelText: 'Email address',
                hintText: 'timilehin883@gmail.com',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: passwordController,
                labelText: 'Password',
                hintText: '*********',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(value)) {
                    return 'Password must have at least one special character';
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              FlatButton(
                onPressed: () {
                  _navigateHome();
                },
                height: 65,
                minWidth: double.infinity,
                color: primaryColor,
                textColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _navigateHome() {
    if (formkey.currentState!.validate()) {
      try {
        loginBloc!.add(
          LoginPressed(
            email: mailController.text,
            password: passwordController.text,
          ),
        );
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
