import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}

class ProxyProviderUpdate extends StatefulWidget {
  const ProxyProviderUpdate({Key? key}) : super(key: key);

  @override
  State<ProxyProviderUpdate> createState() => _ProxyProviderUpdateState();
}

class _ProxyProviderUpdateState extends State<ProxyProviderUpdate> {
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
        title: const Text('ProxyProvider update'),
      ),
      body: Center(
        child: ProxyProvider0<Translations>(
          update: (_, __) => Translations(counter),
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
    return Text(
      Provider.of<Translations>(context).title,
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
