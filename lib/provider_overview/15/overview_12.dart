import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/05/model/dog.dart';
import 'package:flutter_provider_essential/provider_overview/12/counter.dart';
import 'package:flutter_provider_essential/provider_overview/12/show_me_counter.dart';
import 'package:provider/provider.dart';

class Overview12 extends StatefulWidget {
  const Overview12({Key? key}) : super(key: key);

  @override
  State<Overview12> createState() => _Overview12State();
}

class _Overview12State extends State<Overview12> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Anonymous Route'),
          ),
          body: ChildWidget(context),
        );
      },
    );
  }

  Widget ChildWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  // builder의 context를 다른이름으로 한 이유는
                  // Navigator에 사용된 context와 동일한 것을 사용해야 한다.
                  builder: (_) => ChangeNotifierProvider.value(
                        value: context.read<Counter>(),
                        child: ShowMeCounter(),
                      )),
            ),
            child: const Text(
              'Show Me Counter',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.read<Counter>().increment(),
            child: const Text(
              'Increment Counter',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
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
