import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = new QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questions_counter = 0;

  Icon giveAnswer(bool ans, int q_counter) {
    if (ans == quizBrain.getQuestionAnswer(q_counter)) {
      Icon icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      scoreKeeper.add(icon);
    } else {
      Icon icon = Icon(
        Icons.close,
        color: Colors.red,
      );
      scoreKeeper.add(icon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(questions_counter),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  int size = quizBrain.getQuestionsSize();
                  if (questions_counter + 1 == size) {
                    questions_counter = 0;
                    scoreKeeper = [];
                  } else {
                    giveAnswer(true, questions_counter);
                    questions_counter = questions_counter + 1;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  int size = quizBrain.getQuestionsSize();
                  if (questions_counter + 1 == size) {
                    questions_counter = 0;
                    scoreKeeper = [];
                  } else {
                    giveAnswer(false, questions_counter);
                    questions_counter = questions_counter + 1;
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
