import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String namaCust;
  final String emailCust;
  final String noHpCust;
  final String alamatCust;
  final String provinsiCust;
  final String kodePosCust;
  final Color primaryColor = const Color.fromARGB(255, 75, 139, 241);


  const DetailPelangganPage({
    Key? key,
    required this.namaCust,
    required this.emailCust,
    required this.noHpCust,
    required this.alamatCust,
    required this.provinsiCust,
    required this.kodePosCust,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Detail $namaCust'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),