import 'package:flutter/material.dart';
import 'package:ucp1/navigation/piketpage.dart';
import 'package:ucp1/navigation/pelangganpage.dart';
import 'package:ucp1/navigation/pendataanpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFFDF8F8), 
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/image/profile.jpg'), 
                      ),
                      const SizedBox(width: 12),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat Datang',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.black),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/image/promo.png', 
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                ],
                ),
          
        )
        ),
    );
    
  }
}