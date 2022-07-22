import 'dart:math';
import 'package:bmi_calculater/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  double heightVal = 173;
  double result = 0.0;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    genderSelector(context, "male"),
                    const SizedBox(width: 15),
                    genderSelector(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            "CM",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: heightVal,
                        onChanged: (newVal) {
                          setState(() {
                            heightVal = newVal;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    counterSelector(context, "weight"),
                    const SizedBox(width: 15),
                    counterSelector(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  result = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Result(
                          result: result,
                          age: age,
                          isMale: isMale,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "Calculate",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderSelector(BuildContext context, String type) {
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
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 15),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded counterSelector(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == "weight" ? "Weight" : "Age",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 15),
            Text(
              type == "weight" ? "$weight" : "$age",
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "weight" ? "weight--" : "age--",
                  onPressed: () {
                    setState(() {
                      type == "weight" ? weight-- : age--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: type == "weight" ? "weight++" : "age++",
                  onPressed: () {
                    setState(() {
                      type == "weight" ? weight++ : age++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
