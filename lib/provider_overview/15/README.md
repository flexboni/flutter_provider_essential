# Chapter22~27. ProxyProvider

ProxyProvider는 다른 Provider의 값에 의존해 값을 만든다.

## 형태

```dart
ProxyProvider({
    Key? key,
    Create<R>? create,
    required ProxyProviderBuilder<T, R> update,
    UpdateShouldNotify<R>? updateShouldNotify,
    Dispose<R>? dispose,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
})

typedef ProxyProviderBuilder<T, R> = R Function(
    BuildContext context,
    T value,
    R? previous, // 이전 값
)

typedef ProxyProviderBuilder2<T, T2, R> = R Function(
    BuildContext context,
    T value,
    T2 value2,
    R? previous, // 이전 값
)
```

## Update 되는 경우

- 의존하는 Provider의 값을 처음 얻게 되는 경우
- 의존하는 Provider의 값이 변하는 경우
- ProxyProvider가 rebuild 되는 경우
