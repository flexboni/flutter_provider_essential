import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview_05/model/dog.dart';
import 'package:provider/provider.dart';

class Overview08 extends StatefulWidget {
  const Overview08({Key? key}) : super(key: key);

  @override
  State<Overview08> createState() => _Overview08State();
}

class _Overview08State extends State<Overview08> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 08'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<Dog>(
              create: (context) =>
                  Dog(name: 'dog08', breed: 'breed08', age: 8)),
        ],
        child: Consumer<Dog>(
          builder: (BuildContext context, Dog dog, Widget? child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  child!, // rebuild 제외된 widget
                  const SizedBox(height: 20),
                  Text(
                    '- name : ${dog.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const BreedAndAge(),
                ],
              ),
            );
          },
          // rebuild 되지 않는 widget을 적용할 수 있다.
          child: const Text(
            'I Like dogs very much',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, dog, __) {
        return Column(
          children: <Widget>[
            Text(
              '- breed: ${dog.breed}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, dog, __) {
        return Column(
          children: [
            Text(
              '- age: ${dog.age}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<Dog>().grow(),
              child: const Text(
                'Grow',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        );
      },
    );
  }
}
