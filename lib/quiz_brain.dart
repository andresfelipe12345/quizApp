import 'question.dart';

class QuizBrain {
  int _questions_counter = 0;

  List<Question> _allQuestions = [
    Question(q: 'el perro es mejor que el gato?', a: true),
    Question(q: 'cuando llegan los aliens?', a: true),
    Question(q: 'que hora es?', a: false),
    Question(q: 'PS5 o XBOX?', a: true),
    Question(q: 'el oso es mas fuerte que el leon?', a: true),
    Question(q: 'como me llamo?', a: false),
    Question(q: 'que hay de comer?', a: false),
    Question(q: 'de que color es el cielo?', a: false),
    Question(q: 'cuantos planetas hay?', a: true),
    Question(q: 'fin preguntas!', a: true)
  ];

  String getQuestionText(int questionNumber) {
    return _allQuestions[questionNumber].questionText;
  }

  bool getQuestionAnswer(int questionNumber) {
    return _allQuestions[questionNumber].questionAnswer;
  }

  int getQuestionsSize() {
    return _allQuestions.length;
  }

  void nextQuestion() {
    if (_questions_counter < _allQuestions.length) {
      _questions_counter = _questions_counter + 1;
    }
  }
}
