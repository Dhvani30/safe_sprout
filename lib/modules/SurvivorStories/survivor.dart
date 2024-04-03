import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:dice_app/modules/SurvivorStories/newstory.dart';

class SurvivorStory extends StatefulWidget {
  const SurvivorStory({Key? key}) : super(key: key);

  @override
  _SurvivorStoryState createState() => _SurvivorStoryState();
}

class _SurvivorStoryState extends State<SurvivorStory> {
  late CollectionReference<Map<String, dynamic>>
      _storiesCollection; // Define a reference to the Firestore collection

  @override
  void initState() {
    super.initState();
    _storiesCollection = FirebaseFirestore.instance
        .collection('stories'); // Initialize the Firestore collection reference
  }

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
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                // Use a StreamBuilder to listen for changes in Firestore data
                stream: _storiesCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final stories = snapshot.data?.docs ?? [];
                  return ListView.builder(
                    itemCount: stories.length,
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
                              'Title: ${stories[index]['title']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Description: ${stories[index]['description']}',
                            ),
                          ],
                        ),
                      );
                    },
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
                      _storiesCollection
                          .add(result); // Add the new story to Firestore
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
