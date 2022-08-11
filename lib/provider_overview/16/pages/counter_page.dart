import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/16/providers/counter.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCounter = 0;

  @override
  void initState() {
    super.initState();
    // Widget이 build 되는 동안 rebuild 되라고 요청하게 되면 오류가 발생하게 된다.
    // context
    //     .read<Counter>()
    //     .increment();
    // myCounter = context.read<Counter>().counter + 10;

    // 해결법 - 1
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });

    // 해결법 - 2
    Future.delayed(Duration(seconds: 0), () {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });

    // 해결법 - 3
    Future.microtask(() {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Text(
          'counter: ${context.watch<Counter>().counter}\nmyCounter: $myCounter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.read<Counter>().increment(),
      ),
    );
  }
}
