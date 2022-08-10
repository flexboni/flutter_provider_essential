import 'package:flutter/material.dart';

import 'model/dog.dart';

class Overview03 extends StatefulWidget {
  const Overview03({Key? key}) : super(key: key);

  @override
  State<Overview03> createState() => _Overview03State();
}

class _Overview03State extends State<Overview03> {
  final dog = Dog(name: 'dog03', breed: 'breed03');

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age listener: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '- name : ${dog.name}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '- breed: ${dog.breed}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => dog.grow(),
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
