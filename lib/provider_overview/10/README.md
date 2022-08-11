# Chapter17. Selector

Consumer 위젯과 비슷한 성격인데 좀 더 세세한 컨트롤을 할 수 있다. Selector 위젯은 selector에서 특정 값을 반환한다.

```dart
Selector<T, B>({ // T : 여러 property를 갖는 object, B : 그 중 특정 property
    Key? key,
    required ValueWidgetBuilder<S> builder,
    required S selector(BuildContext, A),
    ...
})
```
