# Chapter11. read, watch, select extensions methods

extension method는 dart 2.7에서 소개됐다.

기존 라이브러리에 사용자가 추가적인 기능을 만들고 싶을 때 사용한다.

## context.read<T>() -> T

Provider에 접근에 T를 반환한다.

`Provider.of<T>(context, listen: false)` 와 같은 역할을 한다.

## context.watch<T>() -> T

Provider의 변화를 구독한다.

`Provider.of<T>(context)` 와 같은 역할을 한다.

## context.select<T, R>(R selector(T value)) -> R

특정 값의 변화에 대해서만 구독을 한다.

```dart
    context.select<Dog, String>((Dog dog) => dog.name)
```
