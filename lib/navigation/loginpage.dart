import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
  
  bool obscurePassword = true;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(email: emailController.text)),
      );
    }
  }

  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(  
      body: SafeArea( 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const SizedBox(height: 50),

              Image.asset(
                'assets/image/logo.png', 
                height: 90,      
              ),
              const SizedBox(height: 10),

              const Text(
                'SELAMAT DATANG KEMBALI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,

                ),
              ),
              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_autoValidateMode == AutovalidateMode.always) {
                    _formKey.currentState!.validate();
                  }
                },
              ),
              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Password'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_autoValidateMode == AutovalidateMode.always) {
                    _formKey.currentState!.validate();
                  }
                },
              ),
              const SizedBox(height: 30),

               SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateAndLogin,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color.fromARGB(255, 75, 139, 241),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
              const SizedBox(height: 10),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text: 'Belum memiliki akun? Silahkan '),
                      TextSpan(
                        text: 'Daftar disini!',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
      ),
    );
  }
}