import 'package:flutter/material.dart';

class OverView01 extends StatefulWidget {
  const OverView01({Key? key}) : super(key: key);

  @override
  State<OverView01> createState() => _OverView01State();
}

class _OverView01State extends State<OverView01> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20),
              child: const Text(
                'MyHomePage',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            CounterA(
              counter: _counter,
              increment: _incrementCounter,
            ),
            const SizedBox(height: 20),
            Middle(counter: _counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final Function() increment;

  const CounterA({
    Key? key,
    required this.counter,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            '$counter',
            style: const TextStyle(fontSize: 48),
          ),
          ElevatedButton(
            onPressed: increment,
            child: const Text(
              'Increment',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CounterB(counter: counter),
          const SizedBox(width: 20),
          const Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  const CounterB({Key? key, required this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10),
      child: Text(
        '$counter',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Sibling',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
