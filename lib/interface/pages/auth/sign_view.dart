// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/interface/router/route_name.dart';
import 'package:food_app/logic/signup_bloc/signup_bloc.dart';
import 'package:food_app/interface/widgets/input_field.dart';
import 'package:food_app/utils/color.dart';

class Signup extends StatelessWidget {
  Signup({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  SignupBloc? signupBloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    signupBloc = BlocProvider.of<SignupBloc>(context);
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              InputField(
                controller: nameController,
                labelText: 'Username',
                hintText: 'Marvis Dew',
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: mailController,
                labelText: 'Email address',
                hintText: 'timilehin883@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your valid email address';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: addressController,
                labelText: 'Address',
                hintText: '4, Akinsanya, Eyita, Ikorodu, Lagos.',
                type: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: phoneController,
                labelText: 'Phone number',
                hintText: '+2349061597460',
                type: TextInputType.phone,
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
                type: TextInputType.text,
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
                      'Forgot passcode?',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
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
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              BlocConsumer<SignupBloc, SignupState>(
                listener: (context, state) {
                  if (state is SignupInitial) {
                    const Center(child: Text('Waiting'));
                  }
                  if (state is SignupSucceed) {
                    Navigator.pushReplacementNamed(context, homeRoute);
                  }
                },
                builder: (context, state) {
                  if (state is SignupLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SignupFailed) {
                    return // just in case of an unexpected error
                        Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateHome() {
    if (formkey.currentState!.validate()) {
      try {
        signupBloc!.add(SignUpPressed(
          email: mailController.text,
          password: passwordController.text,
          address: addressController.text,
          name: nameController.text,
          phone: phoneController.text,
        ));
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
