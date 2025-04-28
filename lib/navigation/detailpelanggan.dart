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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'), // Gambar profile
            ),
            const SizedBox(height: 20),
            Text(
              namaCust,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              emailCust,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 2),
            Text(
              noHpCust,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildReadonlyTextField('Alamat', alamatCust, maxLines: 3),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildReadonlyTextField('Provinsi', provinsiCust)),
                const SizedBox(width: 10),
                Expanded(child: _buildReadonlyTextField('Kode Pos', kodePosCust)),
              ],
            ),
            const SizedBox(height: 30),

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
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Selesai', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
