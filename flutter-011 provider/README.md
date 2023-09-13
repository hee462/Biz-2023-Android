# flutter 의 provider

- flutter는 `state` 기반의 뷰모델 패턴을 따라서 작성되는 프로젝트이다.
- `state 변수` 값이 변화가 생기면 화면이 reRendering 되는 큰 구조를 가진 프로젝트를 말한다.

## flutter의 state

- state 변수를 선언한 클래스에서는 자유롭게 값을 읽고 쓰고, 변화 시킬수 있다.
- state 변수는 부모 Widget 에서 자손 widget 으로 전달할 수 있다.
- state 변수는 형제 widget 간에는 전달이 불가능하다
- state 변수를 형제간에 공유하려면, 부모 widget으로 끌어올리고 부모에서 자손으로 재전달 해야만 읽기가 가능
- 만약 부모 widget에서 전달한 state 변수를 자손 widget에서 변화시키려면, state를 변화시킬 수 있는 함수를 전달하여
  실행해야 한다.
- flutter 에서도 state(매개변수, 전달값)이 부모에서 자손으로 또 그 자손으로 전달될 때 props Drilling 현상이 발생할수 있다.
- Props Drilling 현상을 조금이나마 줄이기 위하여, 여러가지 도구가 있는데,
  그중 flutter에서 비교적 사용하기 쉬운 provider를 사용하여 적용해 보자

## flutter 의 상태 관리 도구

- Getx : BuilderContext 관리가 다소 불편한 도구 하지만 flutter에서 가장 많이 사용함
- Bloc(비지니스 로직 컴포넌트) : 비동기 환경에 최적하된 도구, 학습난이도가 높은 편
  Getx의 단점을 보완하면서 점점 사용자가 많아지는 추세
- Mobx : 리엑스에도 같은 도구가 있고, React 개발자들이 flutter로 전향하면서 많은 사용자가 늘어나는중
- provider : Getx 다음으로 사용자가 많고, 비교적 난이도가 낮음, 잘못사용하면 변수 관리 과정에서 메모리 누수(leak)가 발생할 확률이 매우 높다.

## flutter MVVM 패턴

- 일반적인 프로젝트에서는 내부에서 사용되는 변수, 화면에 표시하고자 하는 변수들을 개발자가 일일히 모두 챙기는 코드를 다수 작성해한다.
- MVVM 패턴에서는 State를 잘 활용하고, Notify 를 잘 활용하여 state의 변화를 자동으로 화면에 반영하는 방법이다.

## View model

- Dto 클래스와 화면에 rendering 을 수행하는 코드가 융합된 형태
-
