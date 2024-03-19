import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewStory extends StatelessWidget {
  const NewStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add your story',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              maxLength: 80,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onTap: () {
                HapticFeedback.mediumImpact();
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descController,
              maxLength: 1000,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              onTap: () {
                HapticFeedback.mediumImpact();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Navigator.pop(
                    context,
                    {
                      'title': titleController.text,
                      'description': descController.text
                    },
                  );
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
