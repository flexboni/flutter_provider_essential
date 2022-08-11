import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  late int _value;

  String get title => 'You clicked $_value times';

  void update(int newValue) {
    _value = newValue;
  }
}

class ProxyProviderCreateUpdate extends StatefulWidget {
  const ProxyProviderCreateUpdate({Key? key}) : super(key: key);

  @override
  State<ProxyProviderCreateUpdate> createState() =>
      _ProxyProviderCreateUpdateState();
}

class _ProxyProviderCreateUpdateState extends State<ProxyProviderCreateUpdate> {
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
        title: const Text('ProxyProvider create/update'),
      ),
      body: Center(
        child: ProxyProvider0<Translations>(
          create: (_) => Translations(),
          update: (_, Translations? translations) {
            translations!.update(counter);
            return translations;
          },
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
