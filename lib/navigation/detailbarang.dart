import 'package:flutter/material.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;

  const DetailBarangPage({
    Key? key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
  }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    int jumlah = int.tryParse(jumlahBarang) ?? 0;
    int harga = int.tryParse(hargaSatuan) ?? 0;
    int totalHarga = jumlah * harga;

    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.2),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, color: Colors.white, size: 48),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Data Berhasil Disimpan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              _buildDetailRow('Tanggal', tanggal),
              _buildDetailRow('Jenis Transaksi', jenisTransaksi),
              _buildDetailRow('Jenis Barang', jenisBarang),
              _buildDetailRow('Jumlah Barang', jumlahBarang),
              _buildDetailRow('Jenis Harga Satuan', 'Rp. $hargaSatuan'),
              _buildDetailRow('Total Harga', 'Rp. $totalHarga'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    'Selesai',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(thickness: 1, color: Colors.grey),
        const SizedBox(height: 8),
      ],
    );
  }
}
