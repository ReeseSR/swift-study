# 7주차 스터디 📝

## SECTION 11. JSON and API

---

### 47. Guard Else and Do Catch Statement

👉 Completion Handler


Completion Handler를 이해하기 위해서는 우선 클로저(Closure)에 대한 이해가 선행되어야 한다. 



📌 **클로저**

클로저는 코드의 블럭. 일급시민(first-citizen)으로, 전달인자, 변수, 상수 등으로 저장, 전달이 가능하다.

함수 역시 클로저의 일종으로, `이름이 있는 클로저` 라고 불린다.

✏️ 기본 클로저 문법

```Swift
{ (매개변수 목록) -> 반환타입 in
    실행 코드
}
```

✏️ 클로저의 사용
```Swift
// sum이라는 상수에 클로저를 할당
let sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}

let sumResult: Int = sum(1, 2)
print(sumResult) // 3
```


✏️ 함수의 전달인자로서의 클로저


클로저는 주로 함수의 전달인자로 많이 사용됩니다. 함수 내부에서 원하는 코드블럭을 실행할 수 있습니다.


```Swift
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)

print(calculated) // 60
```

✏️ 다양한 클로저 표현

클로저는 다양한 모습으로 표현될 수 있습니다. 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저(trailing closure)로 함수 밖에 구현할 수 있습니다.

컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수, 반환 타입을 생략할 수 있습니다.

반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 return 키워드를 생략하더라도 반환 값으로 취급합니다.

전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 축약된 전달인자 이름($0, $1, $2…)을 사용 할 수 있습니다.

- 후행 클로저

클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있습니다.

```Swift
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(result) // 20
```

- 단축 인자 이름

클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있습니다. 단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1, $2… 처럼 표현합니다.

```Swift
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})

print(result) // 20


// 당연히 후행 클로저와 함께 사용할 수 있습니다
result = calculate(a: 10, b: 10) {
    return $0 + $1
}

print(result) // 20
```

✏️ 축약 전과 후
```Swift
//축약 전
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})

//축약 후
result = calculate(a: 10, b: 10) { $0 + $1 }

print(result) // 20
```

[출처: 야곰님의 스위프트 기본 문법 강좌](https://yagom.github.io/swift_basic/contents/12_closure/)



👉 Completion Handler의 활용

Alamofire같은 통신 라이브러리에서 JSON 형태 데이터를 받아올 때 Completion Handler 이용

```Swift
Alamofire.request("https://google.com").responseJson { response in 
    print(response)
}
```

📌 **@escaping 클로저**

→ 클로저가 함수의 인자로 전달되었을 때, *함수의 실행이 종료되고 난 후*, 즉 함수 밖에서(escaping) 실행되는 클로저.

escaping 클로저가 자주 사용되는 예로는 비동기가 실행되는 HTTP Request Completion Handler가 있다.

```Swift
func makeRequest(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
  URLSession.shared.dataTask(with: URL(string: "http://jusung.github.io/")!) { data, response, error in
    if let error = error {
      completion(.failure(error))
    } else if let data = data, let response = response {
      completion(.success((data, response)))
    }
  }
}
```

makeRequest() 함수에서 사용되는 completion 클로저는 URL 요청이 끝난 후 비동기로 실행된다. 이 때 completion의 타입에 @escaping 키워드를 붙여서 escaping 클로저임을 명시해야 한다.

[출처: 토미의 개발노트](https://jusung.github.io/Escaping-Closure/)


---

👉 guard else

```Swift
guard (조건) else { 조건이 false 일때 실행되는 부분 }
//  else 안에 break나 return 과 같이 종료 구문이 있어야 한다.
```
guard 활용 시 해당 조건을 검사하고, 해당 조건이 true라면 통과하지만 false인 경우 바로 else로 떨어져 종료 구문을 실행한다.

---

👉 Coding Key

[출처: 우짱의 iOS 블로그](https://woozzang.tistory.com/129)

Coding Key 프로토콜은 주로 커스텀 키 매핑에 사용된다.

‼️ Coding Key 프로토콜을 채택해야지 사용할 수 있다.

```Swift
struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
    var elevation: Double

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case elevation
    }
}
```
- Coordinate의 인스턴스가 인코딩/디코딩 될 때 case에 해당하는 속성들이 모두 있어야 한다.
- CodingKeys들의 case는 인코딩/디코딩 되는 타입의 속성과 이름과 모두 매칭되어야 한다.
- CodingKeys 열거형의 case 이름과 속성 이름이 일치하지 않는다면, String을 Raw value로 사용하여 제공한다 (커스텀 키 매핑)

```JSON
{
    "status": "OK",
    "code": 200,
    "total": 1,
    "data": [
        {
            "title": "There's no.",
            "author": "Aliza Abbott",
            "genre": "Ratione",
            "description": "THE VOICE OF THE SLUGGARD,\"' said the Footman, and began to get to,' said the Gryphon, 'she wants for to know when the tide rises and sharks are around, His voice has a timid voice at her as hard as.",
            "isbn": "9787109643574",
            "image": "http://placeimg.com/480/640/any",
            "published": "2015-07-05",
            "publisher": "Dolor Est"
        }
    ]
}
```

```Swift
struct Book: Codable {
    let title: String
    let author: String
    let genre: String
    let description: String
    let isbn: String
    let coverURL: String
    let publsiehd: String
    let pusblisher: String
    
    private enum CodingKeys: String, CodingKey {
        case title, author, isbn
        case coverURL = "image" // 커스텀 키 매핑
    }
}
```


----

## SECTION 12. MVVM

---

### 49. MVVM

👉 MVC 패턴

✔️ Model

✔️ View

✔️ Controller

View가 Controller에게 이벤트 전송. Controller는 Model을 업데이트.


```Swift
class PC {
    var brand: String
    var prodYear: Date
    var hasGraphicCard: Bool
    var cpu: String
    var color: String

    init(brand: String, prodYear: Date, hasGraphicCard: Bool, cpu: String, color: String) {
        self.brand = brand
        self.prodYear = prodYear
        self.hasGraphicCard = hasGraphicCard
        self.cpu = cpu
        self.color = color
    }
}
```

Controller

```Swift
class MVCViewController: UIViewController {
    private var pc = PC()

    @IBOulet weak var brand: UILabel!
    @IBOulet weak var cpu: UILabel!
    @IBOulet weak var color: UILabel!
    @IBOulet weak var age: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateScreen()
    } 

    func updateScreen() {
        brand.attributedText = getBrandAttributedString
        cpu.text = pc.cpu
        color.text = pc.color
        age.text = getAgeString()
    }

    func getBrandAttributedString() -> NSAttributedString {
        let color = pc.hasGraphicCard ? UIColor.green : UIColor.black
        let brand = pc.hasGraphicCard ? pc.brand + "+" : pc.brand

        return NSAttributedString(string: brand, attributes: [NSForegroundColorAttributeName: color])
    }
}
```


MVVM

View + Controller를 View로 만든다. 

View와 Model 사이를 연결하는 것이 View Model

```Swift 
class PCViewModel {
    var brand: NSAttributedString
    var cpu: String
    var color: String
    let age: String

    private var pc: PC

    init(pc: PC) {
        self.pc = pc
        self.brand = PCViewModel.getBrandAttributedString(with: pc)
        self.age = PCViewModel.getAgeString(with: pc)
        self.cpu = cpu
        self.color = color
    }

    private static func getBrandAttributedString(with pc: PC) -> NSAttributedString {
        let color = pc.hasGraphicCard ? UIColor.green : UIColor.black
        let brand = pc.hasGraphicCard ? pc.brand + "+" : pc.brand

        return NSAttributedString(string: brand, attributes: [NSForegroundColorAttributeName: color])
    }
}
```

```Swift
class MVVMViewController: UIViewControler {
    private var pcViewModel = PCViewModel(pc: PC())

    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var age: UILabel!

    override func viewWillAppear(_ animated:Bool){
        super.viewWIllAppear(animated)
        updateScreen()
    } 

    func updateScreen() {
        brand.attributedText = pcViewModel.brand
        cpu.text = pcViewModel.cpu
        color.text = PcviewModel.color
        age.text = pcViewModel.age
    }
}
```

장점

- translation codes live seperated of the View Controller

- View Controller is smaller and easily maintainable

- Generates testable code

- Makes changes in the UI and Model easier

단점

- Could be overkill

- Could create memory issues


