import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.text,
    required this.index,
    required this.onPressed,
    required this.isAnswered,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
  });

  final String text;
  final int index;
  final VoidCallback onPressed;
  final bool isAnswered;
  final int? selectedAnswerIndex;
  final int correctAnswerIndex;

  Color _getColor(BuildContext context) {
    if (!isAnswered) {
      return Theme.of(context).colorScheme.surface;
    }

    if (index == correctAnswerIndex) {
      return Colors.green.shade100;
    } else if (index == selectedAnswerIndex && index != correctAnswerIndex) {
      return Colors.red.shade100;
    }

    return Theme.of(context).colorScheme.surface;
  }

  Color _getBorderColor(BuildContext context) {
    if (!isAnswered) {
      return Theme.of(context).colorScheme.outline.withOpacity(0.5);
    }
    if (index == correctAnswerIndex) {
      return Colors.green;
    }
    if (index == selectedAnswerIndex) {
      return Colors.red;
    }
    return Theme.of(context).colorScheme.outline.withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: _getColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: _getBorderColor(context), width: 1.5),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: isAnswered ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isAnswered
                  ? Colors.black87
                  : Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
      ),
    );
  }
}
