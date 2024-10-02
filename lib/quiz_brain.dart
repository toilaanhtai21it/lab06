import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;

  Icon correct = const Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrong = const Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Widget> scoreKeeper = [];

  final List<Question> _questionBank = [
    Question('Messi là GOAT bóng đá', true),
    Question('Jack 5 củ bỏ con, đúng hay sai ?', true),
    Question('Cristiano Ronaldo là cầu thủ xuất sắc nhất thế giới, đúng hay sai?', false),
    Question('Mr.Beast là Youtuber có lượt đăng ký cao nhất Youtube.', true),
    Question('MV có lượt xem cao nhất Việt Nam là "Thiên Lý ơi".', false),
    Question('Cristiano Ronaldo đã đạt được nút vàng Youtube.', true),
    Question('Cristiano Ronaldo đã ghi được rất nhiều bàn thắng ở vòng Knock-Out World Cup.', false),
    Question(
        'Thí sinh Olympia Phạm Tường Lan Vy đã ăn cắp chất xám của người khác để đạt được học bổng.',
        true),
    Question(
        'Ở Mỹ, bạn có thể dùng súng thỏa thích.',
        false),
    Question(
        'Trong Thám tử lừng danh Conan, Conan hiện đang học lớp 1 tại trường Tiểu học Teitan.',
        true),
    Question(
        'Khá Bảnh và Lê Văn Luyện đã ra tù.',
        false),
    Question('Faker là tuyển thủ Liên Minh Huyền Thoại xuất sắc nhất.', true),
    Question(
        'Monkey D.Luffy đã ăn Trái Cao Su.',
        false),
    Question(
        'Đúng là Sai, Sai là Đúng.',
        true),
  ];

  void questionChecker(bool flag) {
    bool correctAnswer = getAnswer();
    if (correctAnswer == flag) {
      scoreKeeper.add(correct);
    } else {
      scoreKeeper.add(wrong);
    }
  }

  void nextQuestion(context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
      scoreKeeper.clear();
      Alert(
          context: context,
          title: "KẾT THÚC",
          desc: "Chúc mừng, bạn đã hoàn thành bài thi. Chúc bạn may mắn lần sau 🙂",
          style: const AlertStyle(
            backgroundColor: Colors.teal,
            alertBorder:Border(),
            animationType: AnimationType.fromTop,
          ),
      ).show();
    }
  }

  String getQuestionText() => _questionBank[_questionNumber].question;

  bool getAnswer() => _questionBank[_questionNumber].answer;
}
