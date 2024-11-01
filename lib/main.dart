import 'package:flutter/material.dart';

void main() {
  runApp(UrunUygulamasi());
}

class UrunUygulamasi extends StatefulWidget {
  @override
  _UrunUygulamasiState createState() => _UrunUygulamasiState();
}

class _UrunUygulamasiState extends State<UrunUygulamasi> {
  // Ürün listesini ve seçili ürün indeksini tanımlıyoruz
  final List<Map<String, dynamic>> _urunler = [
    {'ad': 'Elma', 'fiyat': '5 TL'},
    {'ad': 'Armut', 'fiyat': '6 TL'},
    {'ad': 'Muz', 'fiyat': '10 TL'},
    {'ad': 'Portakal', 'fiyat': '8 TL'},
    {'ad': 'Üzüm', 'fiyat': '12 TL'},
    {'ad': 'Çilek', 'fiyat': '15 TL'},
  ];

  int _seciliUrunIndex = -1; // Başlangıçta hiçbir ürün seçili değil

  // Seçilen ürünü güncelleme fonksiyonu
  void _urunSec(int index) {
    setState(() {
      _seciliUrunIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ürünler"),
        ),
        body: Column(
          children: [
            // Ürün adlarının yatay ListView ile gösterilmesi
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _urunler.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _urunSec(index), // Ürün seçimi
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _seciliUrunIndex == index
                            ? Colors.blueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _urunler[index]['ad'],
                          style: TextStyle(
                            fontSize: 16,
                            color: _seciliUrunIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // GridView ile ürünlerin adı ve fiyatının gösterilmesi
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _urunler.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _urunSec(index), // Ürün seçimi
                    child: Container(
                      decoration: BoxDecoration(
                        color: _seciliUrunIndex == index
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _seciliUrunIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _urunler[index]['ad'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _seciliUrunIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _urunler[index]['fiyat'],
                            style: TextStyle(
                              fontSize: 16,
                              color: _seciliUrunIndex == index
                                  ? Colors.white70
                                  : Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
