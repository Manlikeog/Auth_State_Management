import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/data/models/user_model.dart';

class UserRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserRepository({required this.auth});

  // login user function
  Future<User?> login(String email, String password) async {
    try {
      var userauth = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userauth.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  // signup user function
  Future<User?> signup(String email, String password, String address,
      String name, String phone) async {
    try {
      var userauth = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      postDetailsToFirestore(name, address, phone);
      return userauth.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  postDetailsToFirestore(String name, String address, String phone) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userauth = FirebaseAuth.instance;
    User? user = userauth.currentUser;

    UserModel userModel = UserModel();
    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = name;
    userModel.address = address;
    userModel.phone = int.parse(phone);

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
