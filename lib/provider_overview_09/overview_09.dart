import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class Overview09 extends StatelessWidget {
  const Overview09({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 09'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        child: Consumer<Foo>(
          builder: (BuildContext context, Foo foo, Widget? _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    foo.value,
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => foo.changeValue(),
                    child: const Text(
                      'Change Value',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
