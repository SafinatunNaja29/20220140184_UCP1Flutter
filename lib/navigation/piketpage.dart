import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  const PiketPage({super.key});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> { 
  final List<String> _tugasPiketList = ['Menyapu']; 
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDate;
  String _namaAnggota = "Admin";

  @override
  void dispose() {
    _tugasController.dispose();
    super.dispose();
  }
}

void _addTugasPiket() {
    if (_tugasController.text.isNotEmpty) {
      setState(() {
        _tugasPiketList.add(_tugasController.text);
        _tugasController.clear();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _navigateToDetail(String tugas) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPiketPage(tugas: tugas),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piket Gudang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Anggota',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              initialValue: _namaAnggota,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Pilih Tanggal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _selectedDate != null
                            ? '${_getDayName(_selectedDate!.weekday)}, ${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)} ${_selectedDate!.year}'
                            : 'Pilih Tanggal',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),