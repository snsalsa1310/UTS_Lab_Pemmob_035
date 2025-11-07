import '../models/question.dart';

const List<Question> dummyQuestions = [
  Question(
    text: "Apa nama perusahaan yang mengembangkan Flutter?",
    options: ['Google', 'Apple', 'Microsoft', 'Facebook'],
    correctAnswerIndex: 0,
  ),
  Question(
    text: "Apa bahasa pemrograman utama yang digunakan oleh Flutter?",
    options: ['JavaScript', 'Swift', 'Kotlin', 'Dart'],
    correctAnswerIndex: 3,
  ),
  Question(
    text: "Apa sebutan untuk 'building block' dasar dalam UI Flutter?",
    options: ['Component', 'Screen', 'Widget', 'View'],
    correctAnswerIndex: 2,
  ),
  Question(
    text:
        "Widget mana yang dapat mengubah 'state' atau datanya selama runtime?",
    options: ['StatelessWidget', 'StatefulWidget', 'Text', 'Icon'],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        "Widget mana yang digunakan untuk menata layout anak-anaknya (children) secara horizontal?",
    options: ['Column', 'Row', 'Stack', 'ListView'],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        "Widget mana yang digunakan untuk menata layout anak-anaknya (children) secara vertikal?",
    options: ['Column', 'Row', 'Stack', 'Container'],
    correctAnswerIndex: 0,
  ),
  Question(
    text:
        "File apa yang digunakan untuk mengelola 'dependencies' (library) dalam proyek Flutter?",
    options: ['build.gradle', 'package.json', 'pubspec.yaml', 'settings.dart'],
    correctAnswerIndex: 2,
  ),
  Question(
    text:
        "Widget apa yang biasanya menjadi 'root' (akar) dari aplikasi Material Design?",
    options: ['Scaffold', 'MaterialApp', 'Container', 'MyApp'],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        "Widget apa yang digunakan untuk memberi 'padding' (jarak dalam) di sekitar widget lain?",
    options: ['Padding', 'Container', 'Center', 'Spacer'],
    correctAnswerIndex: 0,
  ),
  Question(
    text:
        "Perintah apa yang dijalankan untuk mengambil paket/library baru yang ditambahkan di 'pubspec.yaml'?",
    options: [
      'flutter install',
      'flutter run',
      'flutter create',
      'flutter pub get',
    ],
    correctAnswerIndex: 3,
  ),
];
