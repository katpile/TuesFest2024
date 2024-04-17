import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dictionary_app/model/word.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_app/database/word_db.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  late Timer _timer;
  final WordDB _wordDB = WordDB();
  Word? _word;

  @override
  void initState() {
    // Check if notifications are allowed and request permission if not
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    _fetchAndDisplayRandomWord();

    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      if (_isNineAM()) {
        _fetchAndDisplayRandomWord();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // void _fetchAndDisplayRandomWord() async {
  //   Word? word = await _wordDB.fetchRandomWord();
  //   setState(() {
  //     _word = word;
  //   });
  // }

  void _fetchAndDisplayRandomWord() async {
    print('Fetching word...');
    try {
      Word? word = await _wordDB.fetchRandomWord();
      if (word != null) {
        print('Word fetched: ${word.word}');
        setState(() {
          _word = word;
        });
      } else {
        print('No word found.');
        setState(() {
          // Set a default state if no word is found
          _word = Word(
            id: 0,
            word: 'Default',
            type: 'N/A',
            definition: 'No word found.',
            usageExample: 'N/A',
            addedDate: DateTime.now(),
          );
        });
      }
    } catch (e) {
      print('An error occurred: $e');
      print('Error Details: ${e.toString()}');
      setState(() {
        _word = Word(
          id: 0,
          word: 'Error',
          type: 'N/A',
          definition:
              'An error occurred while fetching the word. Please try again later.',
          usageExample: 'N/A',
          addedDate: DateTime.now(),
        );
      });
    }
  }

  bool _isNineAM() {
    DateTime now = DateTime.now();
    return now.hour == 9 && now.minute == 0 && now.second == 0;
  }

  @override
  Widget build(BuildContext context) {
    print("Building word page");
    final Color beige = Color(0xFFF5F5DC);
    final Color brown = Color(0xFFA52A2A);

    return Scaffold(
      backgroundColor:
          Color(0xFF121212), // Set the Scaffold background color to black
      appBar: AppBar(
        title: Text(
          'За думите',
          style: TextStyle(
            fontFamily: 'Agnets',
            color: beige,
          ),
        ),
        backgroundColor: brown,
      ),
      body: _word != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ДУМА НА ДЕНЯ',
                    style: TextStyle(
                      fontFamily: 'Agnets',
                      fontSize: 24,
                      color: beige,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.7,
                    padding: EdgeInsets.all(
                        25), // Include padding inside the constraints
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/scroll.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${_word?.word}',
                            style: TextStyle(
                              fontFamily: 'Czizh',
                              fontSize: 36,
                              color: brown,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'дефиниция: ${_word?.definition}',
                            style: TextStyle(
                              fontFamily: 'Czizh',
                              fontSize: 18,
                              color: brown,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'тип: ${_word?.type}',
                            style: TextStyle(
                              fontFamily: 'Czizh',
                              fontSize: 18,
                              color: brown,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'пример: ${_word?.usageExample}',
                            style: TextStyle(
                              fontFamily: 'Czizh',
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: brown,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
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
