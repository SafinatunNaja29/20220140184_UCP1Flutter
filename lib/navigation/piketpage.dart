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