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
  
  bool obscurePassword = true;

  @override
  void initState() {  
    super.initState();
  }

  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(  
      body: Form( 
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),  
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              const SizedBox(height: 50),

              Image.asset(
                'assets/image/logo.png', 
                height: 150,      
              ),

              const Text(
                'SELAMAT DATANG KEMBALI',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
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
                  labelText: 'Password',
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
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  backgroundColor: Color.fromARGB(255, 253, 194, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Masuk', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text(
                  'Belum memiliki akun? Silakan daftar di sini!',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}