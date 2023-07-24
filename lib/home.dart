import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_bodymass/result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = false;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            " BODY MASS",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1Expanded(context, 'male'),
                      const SizedBox(
                        width: 15,
                      ),
                      m1Expanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              ' cm',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        Slider(
                          thumbColor: Colors.white,
                          activeColor: Colors.black,
                          inactiveColor: Colors.white60,
                          value: heightVal,
                          onChanged: (newValue) {
                            setState(() {
                              heightVal = newValue;
                            });
                          },
                          min: 90,
                          max: 220,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2Expanded(context, 'weight'),
                      const SizedBox(
                        width: 15,
                      ),
                      m2Expanded(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.blueGrey,
                width: 200,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Result(result: result, isMale: isMale, age: age),
                        ));
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.indigo
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: type == 'age++' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
