import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? 'no_user';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Couple Diary'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('diaries')
            .doc(userId)
            .collection('entries')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // If the Firestore connection is still loading, show a spinner
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Once we have data, get the list of documents
          final docs = snapshot.data!.docs;

          // If there are no entries, show a friendly placeholder message
          if (docs.isEmpty) {
            return const Center(
              child: Text("No diary entries yet! Tap '+' to add one."),
            );
          }

          // Otherwise, build a ListView of entries
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final memo = data['memo'] ?? '';
              final imageUrl = data['imageUrl'] as String?;

              return ListTile(
                title: Text(memo),
                leading: imageUrl != null
                    ? Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.photo),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Example: add a sample entry to Firestore when the button is pressed
          final currentUserId = FirebaseAuth.instance.currentUser!.uid;
          await FirebaseFirestore.instance
              .collection('diaries')
              .doc(currentUserId)
              .collection('entries')
              .add({
            'memo': 'My first diary entry!',
            'timestamp': FieldValue.serverTimestamp(),
          });
        },
      ),
    );
  }
}
