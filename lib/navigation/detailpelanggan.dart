import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String namaCust;
  final String emailCust;
  final String noHpCust;
  final String alamatCust;
  final String provinsiCust;
  final String kodePosCust;

  const DetailPelangganPage({
    Key? key,
    required this.namaCust,
    required this.emailCust,
    required this.noHpCust,
    required this.alamatCust,
    required this.provinsiCust,
    required this.kodePosCust,
  }) : super(key: key);