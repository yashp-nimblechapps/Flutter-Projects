import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stackhive/core/widgets/app_snackbar.dart';
import 'package:stackhive/features/question/data/question_repository.dart';
import 'package:stackhive/features/question/provider/question_provider.dart';
import 'package:stackhive/models/question_model.dart';

void showDeleteQuestionSheet(
  BuildContext parentcontext,
  QuestionModel question, {
  required QuestionRepository repo,
  required PaginatedQuestionsNotifier paginatedNotifier,
}) {
  showModalBottomSheet(
    context: parentcontext,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete_outline, size: 40, color: Colors.red),
            SizedBox(height: 12),

            Text(
              'Delete Question?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),

            Text(
              'This action cannot be undone. The question and all answers will be permanently removed.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () async {
                      context.go('/first');
                      Navigator.pop(context);

                      try {
                        await repo.deleteQuestion(
                          question.id,
                          question: question,
                        );

                        paginatedNotifier.removeLocalQuestion(question.id);

                        if (parentcontext.mounted) {
                          AppSnackBar.show('Question deleted');
                        }
                      } catch (e) {
                        AppSnackBar.show('Delete failed: $e');
                      }
                    },
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
