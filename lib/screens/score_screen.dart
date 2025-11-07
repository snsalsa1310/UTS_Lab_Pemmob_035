import 'package:codequiz/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/primary_button.dart';

class ScoreScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;

  const ScoreScreen({
    super.key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
  });

  String _getFeedbackMessage() {
    double percentage = score / totalQuestions;
    if (percentage == 1.0) {
      return 'Luar Biasa! Sempurna!';
    } else if (percentage >= 0.8) {
      return 'Kerja Bagus, $userName!';
    } else if (percentage >= 0.5) {
      return 'Tidak Buruk! Terus belajar.';
    } else {
      return 'Jangan Menyerah, Coba Lagi!';
    }
  }

  Color _getFeedbackColor() {
    double percentage = score / totalQuestions;
    if (percentage >= 0.8) {
      return Colors.green;
    } else if (percentage >= 0.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void _playAgain(BuildContext context) {
    // Navigasi ke WelcomeScreen dan menghapus semua rute sebelumnya
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skor Akhir'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        // PERUBAHAN UTAMA: Membungkus Padding dengan SingleChildScrollView
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              // mainAxisAlignment.center tidak diperlukan dalam SingleChildScrollView
              // jika ingin memastikan konten berada di tengah saat ruang cukup:
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gambar SVG menggunakan ukuran relatif
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                const SizedBox(height: 24),

                Text(
                  _getFeedbackMessage(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _getFeedbackColor(),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'Skor akhir Anda adalah:',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),

                Text(
                  '$score / $totalQuestions',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 48),

                PrimaryButton(
                  text: 'MAIN LAGI',
                  onPressed: () {
                    _playAgain(context);
                  },
                ),
                // Optional: Tambahkan SizedBox di bawah jika ingin tombolnya tidak terlalu dekat dengan bawah layar
                // const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}