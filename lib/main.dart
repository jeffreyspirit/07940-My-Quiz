import 'package:flutter/material.dart';


void main() => runApp(Quizzler());
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //TODO: 6.ปรับปรุง UI ตามชอบ
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: const Text('Jeff Quiz',
            style: TextStyle(
              color: Colors.black,),),
          actions: <Widget>[
            Icon(
                Icons.settings,
                color: Colors.black,
              ),
          ],
          backgroundColor: Colors.orange[200],
        ),
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

class _QuizPageState extends State<QuizPage> {
  //create an empty list
  //TODO: 2.ปรับปรุงให้ scoreKeeper ให้เริ่มต้นเป็นลิสต์ว่าง
  List<Icon> scoreKeeper = [
  ];

  //TODO: 4.ปรับปรุงคำถามและคำตอบที่สอดคล้องกัน โดยให้มีคำถาม-คำตอบอย่างน้อย 5 ข้อ อาจเป็นคำถามใหม่ทั้งหมดก็ได้
  List<String> questions = [
    'Nile is the world’s longest river',
    'the Great Barrier Reef located in NewZealand',
    'France gifted the Statue of Liberty to the US',
    'Cristiano Ronaldo is football player',
    'there are 216 bones in human body'
  ];
  List<bool> answers = [true,false, true, true,false];
  int questionNumber = 0;
  int correctscore = 0;







  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //TODO: 5.แสดงผลคะแนนที่ได้ กำหนดให้ตอบถูกต้องในแต่ละข้อจะได้ 1 คะแนน (นักเรียนอาจต้องเขียนโปรแกรมในส่วนอื่นด้วย เพื่อสามารถแสดงผลคะแนนที่ถูกต้อง)
        Text('score: $correctscore',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer==true) {
                  setState(() {
                    //เมื่อกดปุ่ม True เพิ่มข้อมูลเข้าไปในลิสต์ scoreKeeper โดยใช้ add method
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                    correctscore ++;
                    //ตรวจสอบว่าข้อคำถามจะไม่เกิน index
                    if (questionNumber < questions.length-1) {
                      questionNumber++;
                    }
                    else {
                      //TODO: 1.ถ้าคำถามหมดแล้ว ให้เริ่มต้นใหม่ โดยกลับไปที่คำถามเดิมและเคลียร์ scoreKeeper ด้วย
                      questionNumber = 0;
                      scoreKeeper = [];
                      correctscore = 0;
                    }
                  });
                }
                if (correctAnswer==false) {
                  setState(() {
                    //เมื่อกดปุ่ม True เพิ่มข้อมูลเข้าไปในลิสต์ scoreKeeper โดยใช้ add method
                    scoreKeeper.add(
                        Icon(
                          Icons.do_not_disturb,
                          color: Colors.red,
                        ));
                    //ตรวจสอบว่าข้อคำถามจะไม่เกิน index
                    if (questionNumber < questions.length-1) {
                      questionNumber++;
                    }
                    else {
                      questionNumber = 0;
                      scoreKeeper = [];
                      correctscore = 0;
                    }
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              // color: Colors.red,
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //TODO: 3.ปรับปรุงโค้ด เมื่อกดปุ่ม False แล้วให้มีการทำงานในลักษณะเดียวกับปุ่ม True
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer==false) {
                  setState(() {
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                    correctscore ++;
                    if (questionNumber < questions.length-1) {
                      questionNumber++;
                    }
                    else {
                      questionNumber = 0;
                      scoreKeeper = [];
                      correctscore = 0;
                    }
                  });
                }
                if (correctAnswer==true) {
                  setState(() {
                    //เมื่อกดปุ่ม True เพิ่มข้อมูลเข้าไปในลิสต์ scoreKeeper โดยใช้ add method
                    scoreKeeper.add(
                        Icon(
                          Icons.do_not_disturb,
                          color: Colors.red,
                        ));
                    //ตรวจสอบว่าข้อคำถามจะไม่เกิน index
                    if (questionNumber < questions.length-1) {
                      questionNumber++;
                    }
                    else {
                      questionNumber = 0;
                      scoreKeeper = [];
                      correctscore = 0;
                    }
                  });
                }
              },
            ),
          ),
        ),
        //แสดงผล icon สำหรับ scoreKeeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

