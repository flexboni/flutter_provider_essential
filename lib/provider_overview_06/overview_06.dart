import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview_05/model/dog.dart';
import 'package:flutter_provider_essential/provider_overview_06/model/babies.dart';
import 'package:provider/provider.dart';

class Overview06 extends StatefulWidget {
  const Overview06({Key? key}) : super(key: key);

  @override
  State<Overview06> createState() => _Overview06State();
}

class _Overview06State extends State<Overview06> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 06'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<Dog>(
              create: (context) =>
                  Dog(name: 'dog06', breed: 'breed06', age: 3)),
          FutureProvider<int>(
              initialData: 0,
              create: (context) {
                final dogAge = context.read<Dog>().age;
                final babies = Babies(age: dogAge);
                return babies.getBabies();
              }),
        ],
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '- name : ${context.watch<Dog>().name}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                const BreedAndAge(),
              ],
            ),
          );
        },
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
    return Column(
      children: <Widget>[
        Text(
          '- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${context.watch<Dog>().age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Text(
          '- number of babies: ${context.watch<int>()}',
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
  }
}
