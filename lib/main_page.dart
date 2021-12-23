import 'package:flutter/material.dart';

class Exam extends StatefulWidget {
  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  double slidervalue = 0;
  double floatvalue = 0;

  var activeClick = Colors.green;
  var deactiveClick = Colors.black;
  var click1 = Colors.black;
  var click2 = Colors.black;
  void click(int c) {
    if (c == 1) {
      if (click1 == deactiveClick) {
        click1 = activeClick;
        click2 = deactiveClick;
      } else if (click1 == activeClick) {
        click1 = deactiveClick;
      }
    } else if (c == 2) {
      if (click2 == deactiveClick) {
        click2 = activeClick;
        click1 = deactiveClick;
      } else if (click2 == activeClick) {
        click2 = deactiveClick;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Performance Test Exam"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: reuseContainer(
                colors: Colors.black,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${slidervalue.round()}',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Slider(
                        value: slidervalue,
                        max: 500,
                        onChanged: (double newvalue) {
                          setState(() {
                            slidervalue = newvalue;
                          });
                        }),
                  ],
                ),
              ))
            ],
          )),
          Expanded(
              child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      click(1);
                    });
                  },
                  child: reuseContainer(
                    colors: click1,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text('click'),
                        // SizedBox(height: 20,),
                        Text(
                          'Cick me',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      click(2);
                    });
                  },
                  child: reuseContainer(
                    colors: click2,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Click me',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: reuseContainer(
            colors: Colors.black,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      floatvalue--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '${floatvalue.round()}',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      floatvalue++;
                    });
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class reuseContainer extends StatelessWidget {
  final Widget? content;
  Function? tapcontent;
  final Color colors;
  reuseContainer({required this.colors, this.content, this.tapcontent});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colors,
        ),
        child: content);
  }
}
