import 'package:flutter/material.dart';
import 'package:my_app/widgets/TipSlider.dart';
import 'package:my_app/widgets/bill_amount.dart';
import 'package:my_app/widgets/person_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  int _personCount = 1;

  double _tipPercent = 1;

  void _incrementPerson() {
    setState(() {
      _personCount++;
    });
  }

  void _decrementPerson() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UTip App',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Total per person', style: style),
                Text(
                  '\$100.00',
                  style: style.copyWith(
                    fontSize: theme.textTheme.headlineMedium!.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: theme.colorScheme.onPrimary,
                  width: 2,
                ),
              ),

              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 3),
                ),
                child: Column(
                  children: [
                    BillAmount(
                      billAmount: '',
                      onChanged: (value) {
                        print("$value"); // Handle bill amount change
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PersonCount(
                        theme: theme,
                        personCount: _personCount,
                        onIncrement: _incrementPerson,
                        onDecrement: _decrementPerson,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip", style: theme.textTheme.titleMedium),
                          Text("\$20.13", style: theme.textTheme.titleMedium),
                        ],
                      ),
                    ),

                    Text(
                      "${(_tipPercent * 100).round()} %",
                      style: theme.textTheme.titleMedium,
                    ),
                    TipSlider(
                      tipPercent: _tipPercent,
                      onChanged: (value) {
                        setState(() {
                          _tipPercent = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
