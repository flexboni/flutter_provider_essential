# Chapter10. ChangeNotifierProvider

ChangeNotifierProvider = ChangeNotifier + Provider

## 특징

- 필요할 때 인스턴스를 생성하고 필요 없어지면 메모리에서 사라진다.
- Provider.of 를 사용해서 쉽게 접근할 수 있다.
- State 변화 감지 : Provider.of<T>(context),
- State 변화 감지 없이 Provider에만 접근 : Provider.of<T>(context, listen: false)
