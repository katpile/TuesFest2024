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
  // Future<List<Word>>? futureWord;
  // late Timer _timer;
  // final wordDB = WordDB();
  // Word? _word;
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

    // Fetch and display a random word when the app starts
    _fetchAndDisplayRandomWord();

    // Check if it's 9 a.m. every minute and fetch a new random word if so
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

  void _fetchAndDisplayRandomWord() async {
    Word? word = await _wordDB.fetchRandomWord();
    setState(() {
      _word = word;
    });
  }

  // @override
  // void initState() {
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  //   super.initState();
  //   fetchWord();
  // }

  // void fetchWord() async {
  //   //DateTime currentDate = DateTime.now();

  //   Word? word = await WordDB().fetchRandomWord();

  //   if (word != null) {
  //     setState(() {
  //       _word = word;
  //     });
  //   } else {
  //     print('No word found with fetched ID.');
  //     // Initialize _word with a default value or handle the case where _word is null
  //     setState(() {
  //       _word = Word(
  //           id: 0,
  //           word: '',
  //           type: '',
  //           definition: '',
  //           usageExample: '',
  //           addedDate: DateTime.now());
  //     });
  //   }
  bool _isNineAM() {
    DateTime now = DateTime.now();
    return now.hour == 9 && now.minute == 0 && now.second == 0;
  }

  @override
  Widget build(BuildContext context) {
    final Color beige = Color(0xFFF5F5DC);
    final Color brown = Color(0xFFA52A2A);

    return Scaffold(
      backgroundColor:
          Colors.black, // Set the Scaffold background color to black
      appBar: AppBar(
        title: Text(
          'За думите',
          style: TextStyle(
            fontFamily: 'Bulgaria Moderna',
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
                    'Дума на деня',
                    style: TextStyle(
                      fontFamily: 'Bulgaria Moderna',
                      fontSize: 24,
                      color: beige,
                    ),
                  ),
                  SizedBox(height: 16), // Adds space between text and scroll
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: EdgeInsets.all(
                        16), // Include padding inside the constraints
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/scroll.png'),
                        fit: BoxFit.fill,
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
                              fontFamily: 'Bulgaria Moderna',
                              fontSize: 36,
                              color: brown,
                              // Other style properties
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  24), // Adjust space between text elements as needed
                          Text(
                            'дефиниция: ${_word?.definition}',
                            style: TextStyle(
                              fontFamily: 'Bulgaria Moderna',
                              fontSize: 18,
                              color: brown,
                              // Other style properties
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'тип: ${_word?.type}',
                            style: TextStyle(
                              fontFamily: 'Bulgaria Moderna',
                              fontSize: 18,
                              color: brown,
                              // Other style properties
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'пример: ${_word?.usageExample}',
                            style: TextStyle(
                              fontFamily: 'Bulgaria Moderna',
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: brown,
                              // Other style properties
                            ),
                            textAlign: TextAlign.center,
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
