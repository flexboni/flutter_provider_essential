import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/dog.dart';

class OverView02 extends StatefulWidget {
  const OverView02({Key? key}) : super(key: key);

  @override
  State<OverView02> createState() => _OverView02State();
}

class _OverView02State extends State<OverView02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 02'),
      ),
      body: Center(
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
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

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
  const Age({Key? key}) : super(key: key);

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
