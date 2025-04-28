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