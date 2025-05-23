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
  bool _autoValidate = false;


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
    setState(() {
      _autoValidate = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPelangganPage(
          namaCust: _namaController.text,
          emailCust: _emailController.text,
          noHpCust: _noHpController.text,
          alamatCust: _alamatController.text,
          provinsiCust: _provinsiController.text,
          kodePosCust: _kodePosController.text,
        ),
      ),
    );
  } else {
    setState(() {
      _autoValidate = true;
    });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
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
          autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Nama Customer'),
              _buildTextField(_namaController, 'Nama Customer'),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Email'),
                        _buildTextField(_emailController, 'Email'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('No Hp'),
                        _buildTextField(_noHpController, 'No Hp'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildLabel('Alamat'),
              _buildTextField(_alamatController, 'Alamat'),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Provinsi'),
                        _buildTextField(_provinsiController, 'Provinsi'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Kode Pos'),
                        _buildTextField(_kodePosController, 'Kode Pos'),
                      ],
                    ),
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
                  child: const Text('Simpan', style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _resetForm,
                  child: Text(
                    'Reset',
                    style: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hint tidak boleh kosong';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}
  