import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TablePageContent extends StatelessWidget {
  const TablePageContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabela'),
      ),
      body: Column(
        children: [
          // Nagłówek tabeli
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('Nazwa drużyny',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Mecze',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Punkty',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Bramki',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          // Lista drużyn
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('table')
                  .orderBy('points', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Coś poszło nie tak'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Ładowanie'));
                }
                final documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(document['team_name'] ?? ''),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(document['matches']?.toString() ?? '',
                                textAlign: TextAlign.center),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(document['points']?.toString() ?? '',
                                textAlign: TextAlign.center),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(document['goals']?.toString() ?? '',
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
