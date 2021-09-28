# 2주차 스터디📝

## 11. SWIFT How to make math operations

> Int, Double 자료형

일반적으로는

```
var m = i * (381 / 1250);
```

계산시 정수 결과가 나온다. Double을 사용하기 위해선 `2.0 / 5.0` 로 표시해야 한다.

그러나 Swift의 경우 별다른 표시 없이도 Double로 변환된다.

```
// 7.62
var m = i * (381 / 1250);
```

> +) 숫자 단위 구분 방법

Swift에서 숫자 단위를 가독성 있게 표시하기 위해서는 언더바(\_) 사용하면 된다.

```
255_000_000 // 25000000
```

---

## 12. Floats Vs Double

1. Float

- Not Recommended to use. Float 는 double만큼 정확하진 않다.

2. Float 형변환

```
var order = 2555.0;

var cut = Float(order) * 0.02
```

게산식에서는 Float와 Double을 혼용해서 쓸 수 없다.

```
var x = 5;

var y = 30.5;

var z: Float = 23.7;

x * y * Double(z)  // 1936.749970
```

---

## 13. Different UI Elements

### 👉 Constraints 적용

constraints 적용하기

<img width="200" alt="Screen Shot 2021-09-27 at 5 28 28 PM" src="https://user-images.githubusercontent.com/75535902/134872901-396fadbc-f3d6-4921-bf6d-3eb73493790a.png">

### 👉 상단과 일정한 거리 유지

<img width="200" alt="Screen Shot 2021-09-27 at 5 36 11 PM" src="https://user-images.githubusercontent.com/75535902/134873694-a0d7eede-5b8f-4587-b5ba-40f597693d6d.png">

> SafeAreaView

아이폰 11, 12와 같이 상단 노치(notch)가 있을 경우 그 부분 빼고 계산해준다.

### 👉 컴포넌트 간 거리 유지

<img width="224" alt="Screen Shot 2021-09-27 at 5 44 04 PM" src="https://user-images.githubusercontent.com/75535902/134874931-7a492a89-bf45-4561-afb7-278014f5a73b.png">

`ctrl` 키 누른 상태로 클릭 후 드래그. `Vertical Standard Spacing` 또는 `Vertical Spacing` 선택.

### 👉 placeholder 설정 및 키보드 선택

<img width="200" alt="Screen Shot 2021-09-27 at 5 53 26 PM" src="https://user-images.githubusercontent.com/75535902/134876436-49407522-3a21-41f4-a3d0-dea0b0bbde90.png">

---

## 14. Reach Data from UI

### String 을 Double로 형변환

형변환의 type는 옵셔널(Optional)

```
Double("3")
```

이 경우 Double? 타입이 된다.

Optional 변수에서 값에 직접 접근하기 위한 방법 중 하나는 force unwrapping 사용 👉 변수 뒤에 ! 붙이면 된다.

```
@IBAction func exchangeButton(_ sender: Any) {
        let ratio = Double(ratioTextField.text!)!
    }

// ratio의 type은 Double
```

---

## 15. UI Actions

### 문자열 보간법

`\()` 사이에 값을 넣어주면 변수와 상수의 값이 자동으로 치환되어 보여진다.

```
var day = "monday";
var income = 300

// "Hi there. It is monday today. I earned 300 today."

print("Hi there. It is \(day). I earned \(income) today.");
```

---
