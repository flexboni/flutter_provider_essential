import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations {
  Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}

class ChangeNotiProvProxyProvider extends StatefulWidget {
  const ChangeNotiProvProxyProvider({Key? key}) : super(key: key);

  @override
  State<ChangeNotiProvProxyProvider> createState() =>
      _ChangeNotiProvProxyProviderState();
}

class _ChangeNotiProvProxyProviderState
    extends State<ChangeNotiProvProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<Counter>(create: (_) => Counter()),
            ProxyProvider<Counter, Translations>(
              update: (_, counter, ___) => Translations(counter.counter),
            )
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ShowTranslations(),
              SizedBox(height: 20),
              IncreaseButton(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<Counter>().increment(),
      child: const Text(
        'INCREASE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
