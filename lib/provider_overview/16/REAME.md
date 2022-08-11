# Chapter 29. Errors & addPostFrameCallback 2

## Page Rendering 하는 절차

1. Create element (BuildContext)
2. initState
3. didChangeDependencies
4. Build

위 절차에 따라 진행되면 화면에 보이게 된다.

## 주의!

`initState`에서 rendering 중 일 때 context를 활용해 화면에 추가적으로 작업을 하려고 하면 안된다.

cf) setState() or markNeedsBuild() called during build 오류 발생

## 해결방법

`addPostFrameCallback`, `Future.delay`, `Future.microtask`을 사용하면 위 오류를 해결할 수 있다. 추가적인 작업을 현재 rendering이 완료된 후로 미루는 역할을 한다.

```dart
// 해결법 - 1
WidgetsBinding.instance.addPostFrameCallback((Duration timestamp) {
    ...
});

// 해결법 - 2
Future.delayed(Duration(seconds: 0), () {
    ...
});

// 해결법 - 3
Future.microtask(() {
    ...
});
```
