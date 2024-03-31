import 'package:dictionary_app/model/word.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_app/database/word_db.dart';
import 'package:google_fonts/google_fonts.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  Future<List<Word>>? futureWord;
  final wordDB = WordDB();
  Word? _word;

  @override
  void initState() {
    super.initState();
    fetchWord();
  }

  void fetchWord() async {
    //DateTime currentDate = DateTime.now();

    Word? word = await WordDB().fetchById(1);

    if (word != null) {
      setState(() {
        _word = word;
      });
    } else {
      print('No word found with ID 1.');
      // Initialize _word with a default value or handle the case where _word is null
      setState(() {
        _word = Word(
            id: 0,
            word: '',
            type: '',
            definition: '',
            usageExample: '',
            addedDate: DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Дума на деня'),
        backgroundColor:
            Colors.brown[400], // Set app bar background color to brown
      ),
      body: _word != null
          ? Center(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.5, // Set the width of the container to 50% of the screen width
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/scroll.png'), // Path to your scroll image asset
                      fit: BoxFit
                          .fill, // Ensure the image covers the entire container
                    ),
                  ),
                  child: SingleChildScrollView(
                    // Make the content scrollable
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100), // Add space from top
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              120, 0, 20, 0), // Adjust left and right padding
                          child: Text(
                            '${_word?.word}',
                            style: GoogleFonts.pangolin(
                                //fontStyle: GoogleFonts.pangolin(),
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.brown[800]), // Set word text style
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              120, 0, 20, 0), // Adjust left and right padding
                          child: Text(
                            'Тип: ${_word?.type}',
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.brown[800]), // Set type text style
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              120, 0, 20, 0), // Adjust left and right padding
                          child: Text(
                            'Дефиниция: ${_word?.definition}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors
                                    .brown[800]), // Set definition text style
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              120, 0, 100, 0), // Adjust left and right padding
                          child: Text(
                            'Пример: ${_word?.usageExample}',
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                color: Colors.brown[
                                    800]), // Set usage example text style
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
