import 'package:flutter/material.dart';
import 'package:ucp1/navigation/detailpelanggan.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> { 
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

  final Color primaryColor = const Color.fromARGB(255, 75, 139, 241);

  void _resetForm() {
      _formKey.currentState?.reset();
      _namaController.clear();
      _emailController.clear();
      _noHpController.clear();
      _alamatController.clear();
      _provinsiController.clear();
      _kodePosController.clear();
    }
  }