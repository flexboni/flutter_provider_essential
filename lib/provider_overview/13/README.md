# Chapter20. Provider Access - Named router access

`.value` constructor은 **Provider Access** 와 연관이 있다.

- Anonymous router access
- Named route access
- Generated route access

## Error

Router을 통해 전환된 별도의 화면은 같은 부모의 Provider에 속하지 못한다. ChangeNotifierProvider.value를 사용해 하나의 Provider에 속할 수 있게 변경한다.

<img width="1083" alt="image" src="https://user-images.githubusercontent.com/29271126/184061271-79c29f3b-5044-4f17-ac3a-535386c30783.png">

<변경 후>

![image](https://user-images.githubusercontent.com/29271126/184063959-f7e2156f-f20c-4992-8e12-b31642044255.png)
