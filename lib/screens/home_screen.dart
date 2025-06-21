import 'package:flutter/material.dart';
import '../services/cuaca_api.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81D4FA), Color(0xFFE1F5FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Gambar Cuaca
                Image.asset(
                  'assets/images/cuaca.png',
                  height: 150,
                ),

                const SizedBox(height: 16),

                // Teks Motivasi
                const Text(
                  'CUACA HARI INI',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Card Form
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan Nama Kota',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              final weatherData = await _weatherService.fetchWeather(_controller.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResultScreen(weatherData: weatherData),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Gagal mendapatkan data cuaca')),
                              );
                            }
                          },
                          child: const Text('Cari'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
