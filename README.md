# 데이터 모델링

## 데이터 정보

- 일상에서 생성되는 수없이 많은 데이터가 있다
- 이러한 데이터를 수집하여 컴퓨터, SW를 통하여 정보로 재 생산해 내는 일을 `정보처리`라고 한다.
- 일상의 데이터를 청보처리해 가공하여 생산한 것을 `정보`라고 한다.
- `정보`는 데이터에 `가치`를 부여한 것이다.
- `정보`는 필요한 사용자에게 `의사결정`을 하는 도구로 사용된다.

## 데이터 모델링

- 데이터를 수집하여 정보처리를 하려고 할때, 먼저 사용자에게 어떤 정보를 보여줄 것인가를 생각해야 한다.
- 일상의 흩어진 데이터를 수집하여 정보처리에 적합한 형태로 수집을 해야 하는데, 이때 어떻게 데이터를 수집할 것인가 고민하는 것을 `데이터 모델링`이라고 한다.

## 데이터 모델링 도구

- 'https://draw.io', 'https://app.diagrams.net/'

## 개념적 데이터 모델링

- 현실세계의 데이터를 정보처리를 하기위해 추상화 단계를 거치는데, 꼭 필요한 항목만 추출하여 정리하는 단계
- 현실세계의 중요 데이터 항목을 추출하여 데이터베이스 `개념적 세계`로 옮기는 작업
- 개념적 세계 ; 정보처리를 하기위한 준비 단계
- 이때 모델링된 정보를 diagram 으로 옮기는데 이 diagram을 `ER(Entity RelationShip) Diagram` 라고 한다.

### Entity(객체, 개체)

- ERD 에서 사각형으로 표현하면 된다.
- 사각형 틀 안에 객체의 이름을 표기한다.

### Attribute(속성, type)

- 개체(Entity)가 가지고 있는 고유한 단위 특성
- 의미있는 가장 작은 논리적 단위
- (엑셀데이터)표의 각 항목을 의미한다.
- 타원을 그리고 타원 안에 속성의 이름을 표기한다.

### Entity, Attribute 연결선

- 화살표를 사용하여 Entity에서 Attribute 반향으로 직선으로 연결한다.
  -dddd
