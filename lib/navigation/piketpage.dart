import 'package:flutter/material.dart';
import 'package:ucp1/navigation/detailpiket.dart';

class PiketPage extends StatefulWidget {
  final String emailUser;

  const PiketPage({super.key, required this.emailUser});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> { 
  final List<String> _tugasPiketList = []; 
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDate;
  late String _emailUser;
  bool _isFieldEmpty = false; 
  bool _isDateEmpty = false;

  @override
void initState() {
  super.initState();
  _emailUser = widget.emailUser;
}


  void _addTugasPiket() {
    if (_tugasController.text.isNotEmpty) {
      setState(() {
        _tugasPiketList.add(_tugasController.text);
        _tugasController.clear();
        _selectedDate = null;
        _isFieldEmpty = false;
        _isDateEmpty = false;
      });
    } else {
       setState(() {
        _isFieldEmpty = _tugasController.text.isEmpty;
        _isDateEmpty = _selectedDate == null;
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
        _isDateEmpty = false;
      });
    }
  }

  @override
  void dispose() {
    _tugasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 75, 139, 241);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white), 
        ),
        iconTheme: const IconThemeData(color: Colors.white), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              initialValue: _emailUser,
              decoration: InputDecoration(
                labelText: 'Nama Anggota',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Pilih Tanggal',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_isDateEmpty) 
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Tanggal tidak boleh kosong',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          
            const SizedBox(height: 24),

            const Text(
              'Tugas Piket',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _tugasController,
                    onChanged: (_) {
                      if (_isFieldEmpty) {
                        setState(() {
                          _isFieldEmpty = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Tugas Piket',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: _isFieldEmpty ? 'Tugas tidak boleh kosong' : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _addTugasPiket,
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 24),

             const Center(
              child: Text(
                'Daftar Tugas Piket',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
             Expanded(
              child: _tugasPiketList.isEmpty
                  ? const Center(child: Text('Belum ada data'))
                  : ListView.builder(
                      itemCount: _tugasPiketList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: const Icon(Icons.assignment, color: Colors.blue),
                            title: Text(_tugasPiketList[index]),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPiketPage(
                                    tugas: _tugasPiketList[index],
                                    nama: _emailUser,
                                    tanggal: _selectedDate ?? DateTime.now(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
             )
          ],
        ),
      ),
    );
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
}
