import "package:flutter/material.dart";

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Gender : ${isMale ? 'Male' : 'Female'}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Gender : ${result}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
