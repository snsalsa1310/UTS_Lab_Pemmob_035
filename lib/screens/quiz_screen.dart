import 'package:codequiz/screens/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme_manager.dart';
import '../data/dummy_questions.dart';
import '../models/question.dart';
import '../widgets/answer_option.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  void _selectAnswer(int selectedIndex) {
    if (_isAnswered) return;

    final Question currentQuestion = dummyQuestions[_currentIndex];

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _isAnswered = true;

      if (selectedIndex == currentQuestion.correctAnswerIndex) {
        _score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentIndex < dummyQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswerIndex = null;
        _isAnswered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            userName: widget.userName,
            score: _score,
            totalQuestions: dummyQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = dummyQuestions[_currentIndex];
    final themeManager = Provider.of<ThemeManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pertanyaan ${_currentIndex + 1}/${dummyQuestions.length}'),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeManager>(context).themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => themeManager.toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...currentQuestion.options.asMap().entries.map((entry) {
                        int optionIndex = entry.key;
                        String optionText = entry.value;

                        return AnswerOption(
                          text: optionText,
                          index: optionIndex,
                          isAnswered: _isAnswered,
                          selectedAnswerIndex: _selectedAnswerIndex,
                          correctAnswerIndex:
                              currentQuestion.correctAnswerIndex,
                          onPressed: () {
                            _selectAnswer(optionIndex);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Skor: $_score',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
