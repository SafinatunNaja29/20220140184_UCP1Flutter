import 'package:flutter/material.dart';
import 'package:ucp1/navigation/detailbarang.dart'; 

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({super.key});

  @override
  State<PendataanBarangPage> createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahBarangController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();

  String? _jenisTransaksi;
  String? _jenisBarang;

  final Color primaryColor = const Color.fromARGB(255, 75, 139, 241);

  final List<String> listTransaksi = ['Barang Masuk', 'Barang Keluar'];
  final List<Map<String, dynamic>> listBarang = [
    {'nama': 'Laptop', 'harga': 10000000},
    {'nama': 'Keyboard', 'harga': 500000},
    {'nama': 'Mouse', 'harga': 200000},
    {'nama': 'Monitor', 'harga': 2500000},
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailBarangPage(
            tanggal: _tanggalController.text,
            jenisTransaksi: _jenisTransaksi!,
            jenisBarang: _jenisBarang!,
            jumlahBarang: _jumlahBarangController.text,
            hargaSatuan: _hargaSatuanController.text,
          ),
        ),
      );
    }
  }