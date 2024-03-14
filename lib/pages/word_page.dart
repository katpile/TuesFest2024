import 'package:dictionary_app/model/word.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dictionary_app/database/word_db.dart'; // Import your WordDB class

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  Future<List<Word>>? futureWord;
  final wordDB = WordDB();
  late Word _word;

  @override
  void initState() {
    super.initState();
    fetchWord();
  }

  void fetchWord() async {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Fetch words from the database with the addedDate matching the current day
    List<Word> words = await WordDB().fetchAllByDate(currentDate);

    if (words.isNotEmpty) {
      setState(() {
        _word = words.first;
      });
    } else {
      print('No word found for today.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word of the Day'),
      ),
      // ignore: unnecessary_null_comparison
      body: _word != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Word: ${_word.word}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Type: ${_word.type}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Definition: ${_word.definition}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Usage Example: ${_word.usageExample}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
