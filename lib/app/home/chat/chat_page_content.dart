import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPageContent extends StatefulWidget {
  const ChatPageContent({
    super.key,
  });

  @override
  State<ChatPageContent> createState() => _ChatPageContentState();
}

class _ChatPageContentState extends State<ChatPageContent> {
  String _message = '';

  void _sendMessage() {
    if (_message.isNotEmpty) {
      FirebaseFirestore.instance.collection('chat').add({
        'message': _message,
        'timestamp': FieldValue.serverTimestamp(),
      });
      setState(() {
        _message = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Czat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Coś poszło nie tak'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Ładowanie...'));
                }
                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index]['message'] as String;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(message),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Wpisz wiadomość',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _message = value;
                      });
                    },
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _message.isEmpty
                      ? null
                      : () {
                          FirebaseFirestore.instance.collection('chat').add({
                            'message': _message,
                            'timestamp': FieldValue.serverTimestamp(),
                          });
                        },
                  child: const Text('Wyślij'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
