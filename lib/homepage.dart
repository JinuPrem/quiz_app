import 'package:flutter/material.dart';
import 'package:quiz_app/question_datamodel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionNum = 0;
  int count = 0;
  List<Icon> ico = [];
  List<QuestionDataModel> questionbank = [
    QuestionDataModel(question: 'The color of orange is orange', answer: true),
    QuestionDataModel(
        question: 'The black box in a plane is black', answer: false),
    QuestionDataModel(question: 'Fish cannot blink', answer: true),
    QuestionDataModel(question: 'An octopus has three hearts', answer: true),
    QuestionDataModel(
        question: 'There are 14 bones in a human foot', answer: false),
    QuestionDataModel(
        question: 'Hot and cold water sound the same when poured.',
        answer: false),
    QuestionDataModel(question: 'There are five different blood groups', answer: false),
    QuestionDataModel(question: 'Hippos sweat a red substance.', answer: true),
    QuestionDataModel(question: 'The first animal sent into space was a monkey.', answer: false),
    QuestionDataModel(question: 'The United States has the longest coastline in the world.', answer: false),
    QuestionDataModel(question: 'The five rings on the Olympic flag are interlocking', answer: true),
    QuestionDataModel(question: 'Goldfish have a two second memory', answer: false),
    QuestionDataModel(question: 'Venus is the hottest planet in the solar system', answer: true)
  ];

  String getQuestion() {
    return questionbank[questionNum].question;
  }

  bool getAnswer() {
    return questionbank[questionNum].answer;
  }

  void nextQuestion() {
    if (questionNum < questionbank.length) {
      questionNum++;
    }
  }

  bool isFinished() {
    if (questionNum >= questionbank.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    questionNum = 0;
    count = 0;
    ico=[];
  }

  void checkAnswer(bool answer) {
    bool userAnswer = getAnswer();
    setState(() {
      if (isFinished() == true) {
        if (count >= 3) {
          Alert(
            context: context,
            title: "YOU LOSE",
            desc: "YOU LOSE THE QUIZ GAME",
          ).show();
          reset();
          ico=[];
        } else {
          Alert(
            context: context,
            title: "YOU WIN",
            desc: "YOU WIN THE QUIZ GAME",
          ).show();
          reset();
          ico=[];
        }
      } else {
        if (userAnswer == answer) {
          ico.add(Icon(Icons.check,color: Colors.green,));
          nextQuestion();
        } else {
          ico.add(Icon(Icons.close,color: Colors.red,));
          nextQuestion();
          count++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 250.0),
            child: Text(
              getQuestion(),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size.fromHeight(55),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: const Size.fromHeight(55),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: ico,
          )
        ],
      ),
    );
  }
}
