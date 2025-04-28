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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPelangganPage(
            namaCust: _namaController.text,
          ),
        ),
      );
    }
  }

  @override
    void dispose() {
      _namaController.dispose();
      _emailController.dispose();
      _noHpController.dispose();
      _alamatController.dispose();
      _provinsiController.dispose();
      _kodePosController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Data Pelanggan',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Nama Customer'),
              _buildTextField(_namaController, 'Nama Customer'),
              const SizedBox(height: 16),

              _buildLabel('Email'),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(_emailController, 'Email'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(_noHpController, 'No Hp'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildLabel('Alamat'),
              _buildTextField(_alamatController, 'Alamat', maxLines: 3),
              const SizedBox(height: 16),

              _buildLabel('Provinsi'),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(_provinsiController, 'Provinsi'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(_kodePosController, 'Kode Pos'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Simpan', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
  }