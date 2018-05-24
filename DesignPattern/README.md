# Design Pattern
디자인 패턴이란? 프로그램 개발에서 자주 나타나는 과제를 해결하기 위한 방법 중 하나로, 과거의 소프트웨어 개발 과정에서 발견된 설계의 노하우를 축적하여 이름을 붙여, 이후에 재이용하기 좋은 형태로 특정의 규약을 묶어서 정리한 것입니. 알고리즘과 같이 프로그램 코드로 바로 변환될 수 있는 형태는 아니지만, 특정한 상황에서 구조적인 문제를 해결하는 방식을 설명해줍니다.


+ 디자인 패턴은 크게 3가지로 나눌 수 있습니다. **1. 생성 패턴, 2. 구조 패턴, 3. 행동 패턴**입니다. 
+ **생성 패턴**은 객체 인스턴스 생성을 위한 패턴으로, 클라이언트와 그 클라이언트에서 생성해야 할 객체 인스턴스 사이의 연결을 끊어주는 패턴입니다.
+ **구조 패턴**은 클래스 및 객체들의 구성을 통해서 더 큰 구조로 만들 수 있게 해주는 것과 관련된 패턴입니다. 
+ **행동 패턴**은 클래스와 객체들이 상호작용하는 방법 및 역할을 분담하는 방법과 관련된 패턴입니다.

### 생성 패턴
1. [Singleton pattern(싱글톤 패턴)](#singleton-pattern(싱글톤-패턴))
2. Abstract Factory(추상 팩토리 패턴)
3. Builder pattern(빌더 패턴)
4. Factory Method pattern(팩토리 메서드 패턴)
5. Prototype pattern(프로토타입 패턴)

### 구조 패턴
1. Adapter pattern(어댑터 패턴)
2. Bridge pattern(브릿지 패턴)
3. Composite pattern(컴포지트 패턴)
4. Decorator pattern(데코레이터 패턴)
5. Facade pattern(퍼사드 패턴)
6. Flyweight pattern(플라이웨이트 패턴)
7. Proxy pattern(프록시 패턴)

### 행동 패턴
1. Chain of Responsibility pattern(역할 사슬 패턴)
2. Command pattern(커맨드 패턴)
3. Interpreter pattern(인터프리터 패턴)
4. Iterator pattern(이터레이터 패턴)
5. Mediator pattern(미디에이터 패턴)
6. Memento pattern(메멘토 패턴)
7. Observer pattern(옵저버 패턴)
8. State pattern(상태 패턴)
9. Strategy pattern(스트래티지 패턴)
10. Template Method pattern(템플릿 메서드 패턴)
11. Visitor pattern(비지터 패턴)

## 생성패턴
### Singleton pattern(싱글톤 패턴)
- 싱글톤 패턴이란? 프로젝트 내에 인스턴스가 단 1개인 객체입니다. 인스턴스가 여러개 존재할 때 문제가 발생하는 오디오나 카메라 등에 문제가 생기지 않게 구현하는 방법입니다. 단일 인스턴스를 생성하기 위해 일반적으로 지연로드를 사용합니다. ex) UIApplication, AppDelegate 등이 있습니다. 
- 싱글톤 패턴을 좀더 자세히 고찰해본다면 멀티 스레드 환경에서 충돌할 수 있는 임계영역에서 객체를 획득하는 규칙을 위반하는 경우가 있습니다. 예를 들면 A스레드에서 객체를 생성하는 getInstance함수를 접근 중이고 B스레드에서 A스레드가 객체를 생성하지 않았기에 getInstance를 호출했다고 가정한다면 A,B 스레드 모두 객체를 획득해버리 됩니다. 이때 getInstance함수에 **상호배제를 걸어주는 것이 싱글톤 패턴의 핵심**입니다.
- objective-C에선 dispatch_once(뮤텍스)와 @synchronized라는 상호배제를 제공합니다. 하지만 swift에선 이 방법 대신 다음과 같은 방식을 차용합니다.

~~~swift
class Singleton {
static let sharedManager = Singleton()
private init() { }
}
~~~

init 이외 다른 작업이 필요하다면 아래와 같이 구현할 수 있습니다.
~~~swift
class Singleton {
static let sharedManager: Singleton = {
let instance = Singleton()
...
return instance
}()

private init() { }
}
~~~

Objective-C의 dispatch_once를 사용하지 않고 동작할 수 있는 것은 The lazy initialzer는 global에 처음 액세스할 때 실행되며 이를 위해서 dispatch_once가 초기화됩니다. 그럼 dispatch_once를 사용할 수 있습니다. initializer로 글로벌 변수를 선언하고 비공개로 표시하면 됩니다.
![](/assets/images/designPattern/singleton_1.png)
[원문: Apple Swift Blog](https://developer.apple.com/swift/blog/?id=7)


[뒤로](https://github.com/bugkingK/Welcome-My-Github)/[위로](#Design-Pattern)
