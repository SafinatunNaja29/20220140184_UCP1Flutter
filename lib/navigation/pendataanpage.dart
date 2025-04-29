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

  final TextEditingController _jumlahBarangController = TextEditingController();
  final TextEditingController _hargaSatuanController = TextEditingController();

  String? _jenisTransaksi;
  String? _jenisBarang;
  DateTime? _selectedDate;
  bool _isTanggalEmpty = false;

  @override
  void dispose() {
    _jumlahBarangController.dispose();
    _hargaSatuanController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _hargaSatuanController.text = 'Rp. ';
  }

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true, 
        title: const Text(
          'Pendataan Barang',
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
              _buildLabel('Tanggal Transaksi'),
              InkWell(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedDate != null
                            ? '${_getDayName(_selectedDate!.weekday)}, ${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)} ${_selectedDate!.year}'
                            : 'Pilih Tanggal',
                          style: TextStyle(
                            color: _selectedDate != null ? Colors.black : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isTanggalEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Tanggal transaksi tidak boleh kosong',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 16),

              _buildLabel('Jenis Transaksi'),
              DropdownButtonFormField<String>(
                value: _jenisTransaksi,
                decoration: InputDecoration(
                  hintText: 'Pilih Jenis Transaksi',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                items: listTransaksi.map((transaksi) {
                  return DropdownMenuItem(
                    value: transaksi,
                    child: Text(transaksi),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisTransaksi = value;
                  });
                  _formKey.currentState!.validate(); 
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
                decoration: InputDecoration(
                  hintText: 'Pilih Jenis Barang',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                items: listBarang.map((barang) {
                  return DropdownMenuItem<String>(
                    value: barang['nama'],
                    child: Text(barang['nama']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisBarang = value;
                    final selectedBarang = listBarang.firstWhere(
                      (barang) => barang['nama'] == value,
                      orElse: () => {'harga': ''},
                    );
                    _hargaSatuanController.text = 'Rp. ${selectedBarang['harga']}';
                  });
                  _formKey.currentState!.validate();
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
                          onChanged: (value) {
                            _formKey.currentState!.validate(); 
                          },
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: primaryColor),
                            ),
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
                          decoration: InputDecoration(
                            hintText: 'Harga Satuan',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16), 
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _isTanggalEmpty = false;
      });
    }
  }


 String _getDayName(int weekday) {
  switch (weekday) {
    case 1: return 'Senin';
    case 2: return 'Selasa';
    case 3: return 'Rabu';
    case 4: return 'Kamis';
    case 5: return 'Jumat';
    case 6: return 'Sabtu';
    case 7: return 'Minggu';
    default: return '';
  }
}

String _getMonthName(int month) {
  switch (month) {
    case 1: return 'Januari';
    case 2: return 'Februari';
    case 3: return 'Maret';
    case 4: return 'April';
    case 5: return 'Mei';
    case 6: return 'Juni';
    case 7: return 'Juli';
    case 8: return 'Agustus';
    case 9: return 'September';
    case 10: return 'Oktober';
    case 11: return 'November';
    case 12: return 'Desember';
    default: return '';
  }
}

 void _submitForm() {
  setState(() {
    _isTanggalEmpty = _selectedDate == null;
  });

  if (_formKey.currentState!.validate() && !_isTanggalEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBarangPage(
          tanggal: '${_getDayName(_selectedDate!.weekday)}, ${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)} ${_selectedDate!.year}',
          jenisTransaksi: _jenisTransaksi!,
          jenisBarang: _jenisBarang!,
          jumlahBarang: _jumlahBarangController.text,
          hargaSatuan: _hargaSatuanController.text,
        ),
      ),
    );
  }
}
}