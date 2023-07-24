import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.result,
    required this.isMale,
    required this.age,
  });

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    // ignore: unused_local_variable
    String resultText = '';

    if (result >= 30)
      resultText = 'Obese';
    else if (result > 25 && result < 30)
      resultText = 'Overweight';
    else if (result >= 18.5 && result <= 24.9)
      resultText = 'Normal';
    else
      resultText = 'Thin';

    // ignore: recursive_getters
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RESULT",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              textAlign: TextAlign.center,
              'Healthiness : $resultPhrase \n ${result.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'Age : $age',
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      )),
    );
  }
}
