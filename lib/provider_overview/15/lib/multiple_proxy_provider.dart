import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}

class MultiProxyProvider extends StatefulWidget {
  const MultiProxyProvider({Key? key}) : super(key: key);

  @override
  State<MultiProxyProvider> createState() => _MultiProxyProviderState();
}

class _MultiProxyProviderState extends State<MultiProxyProvider> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ProxyProvider0<int>(update: (_, __) => counter),
            ProxyProvider<int, Translations>(
                update: (_, value, __) => Translations(value)),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShowTranslations(),
              const SizedBox(height: 20),
              IncreaseButton(increment: increment),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.watch<Translations>().title;
    return Text(
      title,
      style: const TextStyle(fontSize: 28),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    Key? key,
    required this.increment,
  }) : super(key: key);

  final VoidCallback increment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: const Text(
        'INCREASE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
