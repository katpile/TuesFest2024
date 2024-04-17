import 'package:dictionary_app/database/word_db.dart';
import 'package:dictionary_app/model/word.dart';

// Future<bool> doesWordExist(String word) async {
//   final db = await DatabaseService().database;
//   final results = await db.query(
//     'words',
//     where: 'word = ?',
//     whereArgs: [word],
//   );
//   return results.isNotEmpty;
// }

void addWordsToDB() async {
  // Word newWord = Word(
  //   id: 1,
  //   word: 'фееричен',
  //   type: 'същ.',
  //   definition: 'Приказно красив, вълшебен.',
  //   usageExample: 'Пепеляшка отиде на бала с феерична рокля.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 2,
  //   word: 'полифония',
  //   type: 'същ.',
  //   definition: 'Свойство на един знак, образ да притежава няколко значения.',
  //   usageExample: 'Червеното е полифоничен цвят.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 3,
  //   word: 'авантаж',
  //   type: 'същ.',
  //   definition: 'Благоприятно положение, което дава преднина, предимство',
  //   usageExample: 'Съдията даде авантаж на синия отбор.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 4,
  //   word: 'абсолвент',
  //   type: 'същ',
  //   definition: 'Който завършва висше учебно заведение.',
  //   usageExample: 'Абсолвентите в ТУ имат светло бъдеще.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 5,
  //   word: 'автономен',
  //   type: 'прил.',
  //   definition: 'независим, самостоятелен',
  //   usageExample: 'Автономен режим на работа.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 6,
  //   word: 'адент',
  //   type: 'същ.',
  //   definition: 'Убеден привърженикр, последовател на някакво движение.',
  //   usageExample: 'Тя е адент на феминизма.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 7,
  //   word: 'акомодация',
  //   type: 'същ.',
  //   definition: 'Приспособяване, нагаждане',
  //   usageExample: 'Акомодация на окото към тъмнината.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 8,
  //   word: 'акселерация',
  //   type: 'същ.',
  //   definition: 'Ускорение.',
  //   usageExample: 'За тази рязка акселерация ще те глобят.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 8,
  //   word: 'алиенация',
  //   type: 'същ.',
  //   definition: 'Отчуждаване, отчуждение.',
  //   usageExample: 'Алиенация от детските ми приятели.',
  //   addedDate: DateTime.now(),
  // );

  // Word newWord = Word(
  //   id: 8,
  //   word: 'амбивалентен',
  //   type: 'същ.',
  //   definition: 'Двойнствен, двузначен.',
  //   usageExample: 'Амбивалентен символ.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 9,
  //   word: 'алтруизъм',
  //   type: 'същ.',
  //   definition: 'Поставяне на  чуждите интереси над своите.',
  //   usageExample: 'Революционерите показаха алтруизъм.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 10,
  //   word: 'анимизъм',
  //   type: 'същ.',
  //   definition: 'Вяра, че всичко в природата има душа.',
  //   usageExample: 'Много вегани имат анимистичен мироглед.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 11,
  //   word: 'антипатичен',
  //   type: 'прил.',
  //   definition: 'Неприятен.',
  //   usageExample: 'Агресивният му характер го прави антипатичен.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 12,
  //   word: 'апломб',
  //   type: 'същ.',
  //   definition: 'Самоувереност.',
  //   usageExample: 'Говори с апломб.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 13,
  //   word: 'афронтирам',
  //   type: 'прил.',
  //   definition: 'Оскърбявам някого чрез пренебрежително отношение.',
  //   usageExample: 'Той ме афронтира когато не ме поздрави.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 14,
  //   word: 'витален',
  //   type: 'прил.',
  //   definition: 'Изпълнен с живот.',
  //   usageExample: 'Витална поезия.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 15,
  //   word: 'дисидент',
  //   type: 'прил.',
  //   definition:
  //       'Интелектуалец, който е открито инакомислещ спрямо текущата система.',
  //   usageExample: 'Христо Ботев е бил дисидент.',
  //   addedDate: DateTime.now(),
  // );
  // Word newWord = Word(
  //   id: 16,
  //   word: 'дисонанс',
  //   type: 'същ.',
  //   definition: 'Несъответствие.',
  //   usageExample: 'Дисонанс между думи и действия.',
  //   addedDate: DateTime.now(),
  // );
  Word newWord = Word(
    id: 17,
    word: 'еманация',
    type: 'същ.',
    definition:
        'Излъчване, което представя цялото многообразие и същност на нещо.',
    usageExample: 'Еманация на българския дух',
    addedDate: DateTime.now(),
  );
  //await WordDB().create(newWord);
  // if (!(await WordDB().doesWordExist(newWord.word))) {
  //   await WordDB().create(newWord);
  // } else {
  //   print("Word already exists and won't be added again.");
  // }

  // Word newWord = Word(
  //   id: 2,
  //   word: 'полифония',
  //   type: 'същ.',
  //   definition: 'Свойство на един знак, образ да притежава няколко значения.',
  //   usageExample: 'Червеното е полифоничен цвят.',
  //   addedDate: DateTime.now(),
  // );

  // //await WordDB().create(newWord);
  // if (!(await doesWordExist(newWord.word))) {
  //   await WordDB().create(newWord);
  // } else {
  //   print("Word already exists and won't be added again.");
  // }

  //await WordDB().clearTable('words');
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
