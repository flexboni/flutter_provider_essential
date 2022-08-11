import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations with ChangeNotifier {
  late int _value;

  void update(Counter counter) {
    _value = counter.counter;
    notifyListeners();
  }

  String get title => 'You clicked $_value times';
}

class ChangeNotiProviderChangeNotiProxyProvider extends StatefulWidget {
  const ChangeNotiProviderChangeNotiProxyProvider({Key? key}) : super(key: key);

  @override
  State<ChangeNotiProviderChangeNotiProxyProvider> createState() =>
      _ChangeNotiProviderChangeNotiProxyProviderState();
}

class _ChangeNotiProviderChangeNotiProxyProviderState
    extends State<ChangeNotiProviderChangeNotiProxyProvider> {
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
            ChangeNotifierProxyProvider<Counter, Translations>(
              create: (_) => Translations(), // 새로운 Translation 인스턴스가 생성됨
              update: (_, counter, translations) {
                translations!.update(counter);
                return translations;
              },
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
