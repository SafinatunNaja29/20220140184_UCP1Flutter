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