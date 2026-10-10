import 'package:flutter/material.dart';
import 'package:notes_apps/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER KATEGORI
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide()),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4),
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Kategori ${index + 1}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // CONTENT
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ListTile(title: Text('Title ${index + 1}')),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Note',
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddNoteScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.black, size: 28),
      ),
    );
  }
}
