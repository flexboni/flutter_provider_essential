import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview_05/model/dog.dart';
import 'package:provider/provider.dart';

class Overview10 extends StatefulWidget {
  const Overview10({Key? key}) : super(key: key);

  @override
  State<Overview10> createState() => _Overview10State();
}

class _Overview10State extends State<Overview10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 10'),
      ),
      body: ChangeNotifierProvider<Dog>(
        create: (context) => Dog(name: 'dog10', breed: 'breed10', age: 10),
        child: Selector<Dog, String>(
          selector: (BuildContext context, Dog dog) => dog.name,
          builder: (BuildContext context, String name, Widget? child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  child!, // rebuild 제외된 widget
                  const SizedBox(height: 20),
                  Text(
                    '- name : $name',
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
    return Selector<Dog, String>(
      selector: (BuildContext context, Dog dog) => dog.breed,
      builder: (context, breed, _) {
        return Column(
          children: <Widget>[
            Text(
              '- breed: $breed',
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
    return Selector<Dog, int>(
      selector: (context, dog) => dog.age,
      builder: (_, age, __) {
        return Column(
          children: [
            Text(
              '- age: $age',
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
