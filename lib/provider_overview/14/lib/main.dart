import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_14/show_me_counter.dart';

import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counter = Counter();

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                      value: _counter,
                      child: const MyHomePage(),
                    ));

          case '/counter':
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                      value: _counter,
                      child: const ShowMeCounter(),
                    ));
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/counter'),
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<Counter>().increment(),
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
