# Chapter16. Consumer, builder, ProviderNotFoundException

Consumer와 Provider의 builder는 동일한 동작을 한다. Consumer를 사용할 때는 child 안에서 Widget을 추가해주면 된다. Consumer 또는 builder를 사용하지 않으면 `ProviderNotFoundException`이 발생한다.

## Error Message

    The following ProviderNotFoundException was thrown building MyHomePage(dirty) :
    Error: Could not find the correct Provider<Foo> above this MyHomePage Widget

    This happens because you use a 'BuildContext' that does not include th provider of your choice. There are a few common scenarios:

### Scenario -1

    You added a new provider in you `main.dart` and performed a hot-reload. To fix, perform a hot-restart.

### Scenario - 2

    The provider you are trying to read is in a different route.

    Providers are "scoped". So if you insert of provider inside a route, then other routes will not be able to access that provider.

### Scenario - 3

    You used a `BuildContext` that is an ancestor of the provider you are trying to read.

    Make sure that MyHomePage is under your MultiProvider/Provider<Foo>.
    This usually happens when you are creating a provider and trying to read it immediately.

```dart
# For example, instead of :
Widget build(BuildContext context) {
    return Provider<Example>(
        create: (_) => Example(),
        // Will throw a ProviderNotFoundError,
        // because `context` is associated to the widget
        // that is the parent of `Provider<Example>`
        child: Text(context.watch<Example>()),
    )
}
```

```dart
# Consider using builder like so :
Widget build(BuildContext context) {
    return Provider<Example>(
        create: (_) => Example(),
        // we use `builder` to obtain a new `BuildContext`
        // that has access to the provider
        builder: (context) {
            // No longer throws
            return Text(context.watch<Example>()),
        },
    )
}
```
