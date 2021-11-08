# 4주차 스터디 📝

## SECTION 7. Important Swift Concepts

---

### 26. Swift Functions

```swift

func dayOfWeek(day: String, month, Int) {
    print("Today is \(day). we are in \(month).");
}

dayOfWeek(day: "Monday", month: 7);  // "Today is Monday. We are in 7."


func mulitpy(x: Int, y: Int){
    print(x * y);
}

multiply(x: 7, y: 5);   // 35
```

✔️ 함수를 호출할 때 파라미터 이름을 필요로 한다.

ex) dayOfWeek(day: "Monday", month: 7);

👉 파라미터 이름 day, month

---

### 27. Swift Take Data from a function

```swift
func mulitpy(x: Int, y: Int){
    print(x * y);
}

var result = multiply(x: 7, y: 5);   // WARNING: Variable 'result' inferred to have type '()', which may be unexpected

result / 4 // ERROR: Cannot conver value of type '()' to expected argument type 'int'

```

👇

```swift
func mulitpy(x: Int, y: Int) -> Int {   // 반환 타입이 int
    return x * y;    // 리턴값 줘서 ERROR 해결
}

var result : Int = multiply(x: 8, y: 2);   // result를 INT로 지정함으로써 WARNING 해결

result / 4 // 4

multiply(x:5, y: multiply(x: 8, y: 2))  // 80


```

✔️ `->` 를 사용하여 함수의 반환 타입을 지정할 수 있다.

✔️ 함수의 파라미터로 함수를 넣는 것도 가능하다.

✅ CountryTableViewController

```Swift

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return flags.count;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = flags[indexPath.row];
        performSegue(withIdentifier: "DefinitionSegue", sender: selectedCountry)
    }   // 리턴값 없음

```

Quiz 1. func takes 3 doubles add them and return an INT

```Swift
func add(x: Double, y: Double, z: Double) -> Int{
    return Int(x + y + z);
}

print(add(x: 6.2, y: 4.6, z: 8.3));
```

---

### 28. Classes in Swift ~ 29. Swift Class Methods

✔️ 클래스 이름은 UpperCamelCase(ClassName 등)으로 선언한다.

```Swift
class Car {
    var brand = ""
    var modelYear = 0
    var color = ""

    func drive() {
        print("vroom vroom");
    }

    func intro(){
        print("This \(color) \(brand) is \(modelYear) model");
    }

}

var myCar = Car();

myCar.modelYear = 2010

myCar.modelYear // 2010

myCar.color = "blue"
myCar.brand = "ford"
myCar.drive() // "vroom vroom";
myCar.intro()   // This blue ford is 2010 model

var sportCar = Car()

sportCar.brand = "ferrari"
sportCar.modelYear = 2003
sportCar.color = "red"
sportCar.intro();  // This red ferrari is 2003 model

```

---

### 30. Swift Build Class hierarchy

```Swift
class Vehicle {
    var brand = ""
    var modelYear = 0

    func drive(){
        print("asdasdasdasd");
    }

}

class Truck: Vehicle {
    override func drive(){
        print("pit pit");
    }
}

class Car: Vehicle {
    var color = ""

    override func drive(){
        print("vroom vroom");

        super.drive
    }
}

var myCar = Car();

myCar.modelYear = 2010
myCar.color = "blue"
myCar.brand = "ford"
myCar.drive();  // asdasdasdasd

var myTruck = Truck();
myTruck.modelyear // 0
Turck().drive();    // vroom vroom


```

CountryDefinitionViewController는 UIViewController 상속받고 있음.
따라서 super.viewDidLoad는 UIViewController의 viewDidLoad 메소드 호출.

---

## SECTION 8. App Refactor With Classes

---

#### 옵셔널

옵셔널 : 변수에 값이 있을 수도 - 없을 수도!

`var year : Int? `

👉 Int 형 값이 들어갈 수도, 없을 수도!

✔️ 옵셔널 기호 : ? 또는 !

`var year: Int? = nil`

✔️ nil: 값이 없다는 뜻의 키워드.

일반 변수에서는 데이터가 없다는 케이스가 없기 때문에 nil을 대입하면 에러가 발생한다.

그에 비해 옵셔널은 값이 있을 수도 - 없을 수도 있는 형태이기 때문에 Int형 옵셔널로 변수를 선언하면 Int 값을 넣을 수도 있고 nil을 넣을 수도 있다!

#### 옵셔널 언래핑

옵셔널은 값이 있을 수도 있고 / 없을 수도 있다.

❓ 그러나 옵셔널 형 변수에 어떤 값이 들어았는지 정확하게 알고 있다면?

👉 값을 알려주기 위해서는 **언래핑** 과정이 필요.

언래핑

- 옵셔널 바인딩
- 강제로 언래핑 👉 ! 사용

강제 언래핑(! 사용) : 값이 있든 없든 일단 언래핑한다
-> 그러나 만약 옵셔널 형 변수에 들어 있던 값이 nil(없는 값)일 에러가 발생하게 된다.

그래서 옵셔널 바인딩을 사용하게 된다.

#### 옵서녈 바인딩

```Swift
var year: Int ? = 2001;

if let x : Int = year{
    print(x);
}else{
    print("Year is nill");
}
```

```Swift
cell.textLabel?.text = flags[indexPath.row].flag + " - " + String(flags[indexPath.row].year);
```

tableLabel 뒤의 ? 의 뜻 : tableLabel이 존재한다면 text의 값 보내기. nil일 경우 이 줄 건너뛰고 실행.

```Swift
var myVehicle : Vehicle = Car();

if let myCar = myVehicle as? Car{
    print(myCar)
}   // 옵셔널 바인딩

```

옵셔널 바인딩 활용

✅ CountryTableViewController

```Swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defOfViewController = segue.destination as! CountryDefinitionViewController;
        let selectedCountry = sender as! String;    // !를 이용해 강제 언래핑 사용,performSegue의 sender의 자료형이 String이 아닐 경우에는 에러 발생 -> 현재는 sender의 자료형이 Country 구조체이므로 에러 발생함!
        defOfViewController.country = selectedCountry;
    }

👇

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let defOfViewController = segue.destination as? CountryDefinitionViewController{

            if let selectedCountry = sender as? String{
            defOfViewController.country = selectedCountry;

        }
    }
}

```
