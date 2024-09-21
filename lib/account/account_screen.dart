// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final List<String> useratributes;
  const AccountScreen({
    super.key,
    required this.useratributes,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child:SignOutButton()
      ),
    );
  }
}