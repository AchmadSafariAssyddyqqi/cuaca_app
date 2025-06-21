import 'package:flutter/material.dart';
import 'detail_screen.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const ResultScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final cityName = weatherData['name'];
    final temperature = weatherData['main']['temp'];
    final description = weatherData['weather'][0]['description'];
    final iconCode = weatherData['weather'][0]['icon'];
    final iconUrl = "https://openweathermap.org/img/wn/$iconCode@2x.png";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4FC3F7), Color(0xFFE1F5FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon Cuaca dari API
                  Image.network(iconUrl, scale: 0.9),

                  const SizedBox(height: 16),

                  // Kota
                  Text(
                    cityName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Suhu
                  Text(
                    '$temperature °C',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Deskripsi Cuaca
                  Text(
                    description.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.2,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Tombol Lihat Detail
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(weatherData: weatherData),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Lihat Detail',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 🔙 Tombol Kembali
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman HomeScreen
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Kembali"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
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
}
