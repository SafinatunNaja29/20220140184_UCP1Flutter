import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmpasswordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Form( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DAFTAR AKUN BARU'),