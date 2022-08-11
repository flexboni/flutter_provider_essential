import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/dog.dart';

class Overview04 extends StatefulWidget {
  const Overview04({Key? key}) : super(key: key);

  @override
  State<Overview04> createState() => _Overview04State();
}

class _Overview04State extends State<Overview04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 04'),
      ),
      body: ChangeNotifierProvider<Dog>(
        create: (context) => Dog(name: 'dog04', breed: 'breed04'),
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '- name : ${Provider.of<Dog>(context).name}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
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
          '- breed: ${Provider.of<Dog>(context).breed}',
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
          '- age: ${Provider.of<Dog>(context).age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
