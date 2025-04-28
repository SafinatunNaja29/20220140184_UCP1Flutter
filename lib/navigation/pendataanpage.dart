import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Pendataan Barang', style: TextStyle(color: Colors.white)),
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
              _buildLabel('Tanggal Transaksi'),
              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Tanggal Transaksi',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _pickDate,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal transaksi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              _buildLabel('Jenis Transaksi'),
              DropdownButtonFormField<String>(
                value: _jenisTransaksi,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Jenis Transaksi',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
                items: ['Barang Masuk', 'Barang Keluar'].map((transaksi) {
                  return DropdownMenuItem(
                    value: transaksi,
                    child: Text(transaksi),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisTransaksi = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih jenis transaksi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              _buildLabel('Jenis Barang'),
              DropdownButtonFormField<String>(
                value: _jenisBarang,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Jenis Barang',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
                items: listBarang.map((barang) {
                  return DropdownMenuItem(
                    value: barang['nama'],
                    child: Text('${barang['nama']}'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisBarang = value;


                    final selectedBarang = listBarang.firstWhere(
                      (barang) => barang['nama'] == value,
                      orElse: () => {'harga': ''},
                    );
                    _hargaSatuanController.text = selectedBarang['harga'].toString();
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih jenis barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Jumlah Barang'),
                        TextFormField(
                          controller: _jumlahBarangController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Harga Satuan'),
                        TextFormField(
                          controller: _hargaSatuanController,
                          readOnly: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixText: 'Rp. ',
                            hintText: 'Harga Satuan',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga satuan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

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

