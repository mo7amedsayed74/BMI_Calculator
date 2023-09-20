import 'package:flutter/material.dart';
import 'result_screen.dart';

import 'dart:math';


class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true;
  double height = 120.0;
  int weight = 50;
  int age = 18;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Body Mass Index',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    firstExpanded(context,'Female'),
                    const SizedBox(
                      width: 8,
                    ),
                    firstExpanded(context,'Male'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style:Theme.of(context).textTheme.headlineLarge,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        min: 80.0,
                        max: 220.0,
                        onChanged: (val) {
                          setState(() {
                            height = val;
                          });
                        },
                        activeColor: Colors.blueGrey[900],
                        inactiveColor: Colors.blueGrey[600],
                        thumbColor: Colors.red,
                        secondaryActiveColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    thirdExpanded(context,'weight'),
                    const SizedBox(
                      width: 8,
                    ),
                    thirdExpanded(context,'age'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.red,
              child: MaterialButton(
                height: MediaQuery.of(context).size.height/12,
                child: Text(
                  'CALCULATE',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                  ),                ),
                onPressed: () {
                  result= weight /pow(height/100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return BmiResultScreen(
                            result: result,
                            age: age,
                            isMale: isMale,
                          );
                        }
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstExpanded(BuildContext context , String gender){
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (gender=='Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isMale && gender=='Male') || (!isMale && gender=='Female') ? Colors.red : Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  gender=='Male'?'assets/images/male.png':'assets/images/female.png',
                ),
                height: 90,
                width: 90,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                (gender=='Male') ? 'Male' : 'FEMALE',
                style:Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget thirdExpanded(BuildContext context , String title){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title, // print (title)
              style:Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              (title == 'weight') ? '$weight' : '$age',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if(title=='weight' && weight > 0) {
                        weight--;
                      }else if(title=='age' && age > 0) {
                        age--;
                      }
                    });
                  },
                  heroTag: (title=='weight') ? 'weight--' : 'age--',  // There are multiple heroes that share the same tag within a subtree.
                  // المفروض يكون في زرار واحد فلوتينج ف بدي لكل واحد زي اسم كدا عشان افرقهم عن بعض

                  mini: true, // size (mini , normal)
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if(title=='weight') {
                        weight++;
                      }else {
                        age++;
                      }
                    });
                  },
                  heroTag:(title=='weight') ? 'weight++' : 'age++',  // There are multiple heroes that share the same tag within a subtree.
                  // المفروض يكون في زرار واحد فلوتينج ف بدي لكل واحد زي اسم كدا عشان افرقهم عن بعض

                  mini: true, // size (mini , normal)
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
