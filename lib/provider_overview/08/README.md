# Chapter15. Consumer

Provider<T> 는 **builder**에 값을 넘긴다. `Consumer`를 사용하면 builder에서 이 값을 받을 수 있다. builder는 null 값이면 안된다.

child parameter에 Widget을 넘기면 해당 Widget은 rebuild에서 제외된다. 즉, 다시 생성되지 않고 재활용된다.
