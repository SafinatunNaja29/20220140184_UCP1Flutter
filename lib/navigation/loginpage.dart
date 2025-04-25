import 'package:flutter/material.dart';
import 'package:ucp1/navigation/homepage.dart';
import 'package:ucp1/navigation/registerpage.dart';

class LoginPage extends StatefulWidget { 
  const LoginPage({super.key}); 

  @override
  State<LoginPage> createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> { 
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void initState() {  
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    final _formKey = GlobalKey<FormState>(); 
    return Scaffold(  
      body: Form( 
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),  
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,  
            children: []
              