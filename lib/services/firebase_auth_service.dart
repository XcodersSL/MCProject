import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signup(String username, String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future logininwithgoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential myCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(myCredential);

    debugPrint(user.user?.displayName);
  }
}

class AuthService {
  Future signup(String username, String email, String password) async {
    var url = Uri.parse('http://10.0.2.2/flutter/blogapp/usercreate.php');
    await http.post(url,
        body: {"username": username, "email": email, "u_password": password});
  }

  Future login(String email, String password) async {
    var url =
        Uri.parse('http://10.0.2.2/flutter/blogapp/userlog.php'); //Api Link
    final response =
        await http.post(url, body: {"email": email, "u_password": password});
    return jsonDecode(response.body);
  }
}

class Foodstore {
  Future getfood() async {
    var url = Uri.parse('http://10.0.2.2/flutter/blogapp/showProducts.php');
    final response = await http.post(url);
    return jsonDecode(response.body);
  }

  Future orderplace(String foodsId, String userId) async {
    var url = Uri.parse('http://10.0.2.2/flutter/blogapp/orderplace.php');
    final response =
        await http.post(url, body: {"foodsId": foodsId, "userId": userId});
  }
}
