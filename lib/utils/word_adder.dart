import 'package:dictionary_app/database/word_db.dart';
import 'package:dictionary_app/model/word.dart';

void addWordsToDB() async {
  Word newWord = Word(
    id: 1,
    word: 'фееричен',
    type: 'същ.',
    definition: 'Приказно красив, вълшебен.',
    usageExample: 'Пепеляшка отиде на бала с феерична рокля.',
    addedDate: DateTime.now(),
  );

  await WordDB().create(newWord);

  // List<Word> wordsToAdd = [
  //   Word(
  //     id: 1,
  //     word: 'фееричен',
  //     type: 'същ.',
  //     definition: 'Приказно красив, вълшебен.',
  //     usageExample: 'Пепеляшка отиде на бала с феерична рокля.',
  //     addedDate: DateTime.now(),
  //   ),
  //   Word(
  //     id: 2,
  //     word: 'полифония',
  //     type: 'същ.',
  //     definition: 'Свойство на един знак, образ да притежава няколко значения.',
  //     usageExample: 'Червеният цвят е полифоничен.',
  //     addedDate: DateTime.now(),
  //   ),
  //   Word(
  //     id: 3,
  //     word: 'симпозиум',
  //     type: 'същ.',
  //     definition:
  //         'Конференции, на които става обмяна и консумация на академични идеи.',
  //     usageExample:
  //         'Група атински аристократи присъстват на симпозиум и говорят за любов, докато пияният Алкивиад не нахлува и решава вместо това да обсъжда Сократ.',
  //     addedDate: DateTime.now(),
  //   ),
  //   Word(
  //       id: 4,
  //       word: 'трансцендентен',
  //       type: 'прил.',
  //       definition:
  //           'Във философията трансцендентен е човек който се намира извън пределите на познанието и опита.В теологията - областта на абсолютното и божественото, която се намира изцяло извън материалната вселена.',
  //       usageExample: '',
  //       addedDate: DateTime.now()),
  //   Word(
  //       id: 5,
  //       word: 'лиминален',
  //       type: 'прил.',
  //       definition: 'Прагов, който трудно се възприема.',
  //       usageExample:
  //           'Тези цикади не са просто декоративни. Те добавят дълбока метафора, трансцендентен музикален мотив и лиминален аспект към диалога на Сократ и Федър.',
  //       addedDate: DateTime.now()),
  //   Word newWord = Word(
  //       id: 6,
  //       word: 'еманация',
  //       type: 'същ.',
  //       definition:
  //           'Излъчване, което представя цялото многообразие и същност на нещо.',
  //       usageExample: 'Бай Ганьо е еманация на българския дух.',
  //       addedDate: DateTime.now());
  //   Word(
  //       id: 7,
  //       word: 'еманципация',
  //       type: 'същ.',
  //       definition: 'Освобождаване от зависимост, ограничения, предразсъдъци.',
  //       usageExample:" В процеса на еманципация, жените се борят за равнопоставеност, достъп до образование и възможност за професионално развитие",
  //       addedDate: DateTime.now())
  //   // Add more words as needed
  // ];

  //await WordDB().insertWords(wordsToAdd);
}
