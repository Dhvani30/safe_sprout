import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dice_app/modules/SurvivorStories/newstory.dart';

class SurvivorStory extends StatefulWidget {
  const SurvivorStory({Key? key}) : super(key: key);

  @override
  _SurvivorStoryState createState() => _SurvivorStoryState();
}

class _SurvivorStoryState extends State<SurvivorStory> {
  List<Map<String, String>> _stories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Survivor Stories',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 226, 227, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${_stories[index]['title']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Description: ${_stories[index]['description']}',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    HapticFeedback.mediumImpact();
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewStory()),
                    );
                    if (result != null) {
                      setState(() {
                        _stories.add({
                          'title': result['title'],
                          'description': result['description']
                        });
                      });
                    }
                  },
                  child: const Text('Add New Story'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
