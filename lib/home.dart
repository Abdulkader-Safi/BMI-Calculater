import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  double heightVal = 170;

  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 15),
              GenderSelector(context, "male"),
              const SizedBox(width: 15),
              GenderSelector(context, "female"),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }

  Expanded GenderSelector(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(type == "male" ? Icons.male : Icons.female),
              const SizedBox(height: 15),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
