import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const DetailScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final cityName = weatherData['name'];
    final wind = weatherData['wind']['speed'];
    final humidity = weatherData['main']['humidity'];
    final pressure = weatherData['main']['pressure'];
    final iconCode = weatherData['weather'][0]['icon'];
    final iconUrl = "https://openweathermap.org/img/wn/$iconCode@2x.png";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF29B6F6), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Ikon & Nama Kota
                  Image.network(iconUrl, height: 100),
                  const SizedBox(height: 12),
                  Text(
                    'Detail Cuaca: $cityName',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Card Detail Info
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _buildDetailItem('Kecepatan Angin', '$wind m/s'),
                          const Divider(),
                          _buildDetailItem('Kelembapan', '$humidity %'),
                          const Divider(),
                          _buildDetailItem('Tekanan Udara', '$pressure hPa'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tombol Kembali
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
        Text(value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
