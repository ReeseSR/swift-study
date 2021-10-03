# 3주차 스터디 📝

## 18. SWIFT Listing data structure Arrays

### 👉 배열의 요소 가져오기

> ✔️ first, last, index 이용하기

```swift
let friends = ["Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica"];

// 배열의 첫 번째 요소의 접근
friends.first // "Chandler"

// 배열의 마지막 요소에 접근
friends.last // "Monica"

// 인덱스를 이용하여 배열의 요소에 접근

friends[2] // "Ross"

friends[4] // "Rachel"
```

### 👉 배열의 요소 더하기

> ✔️ append : adds item to the very end of an array
> ✔️ insert: adds item to the very beginning of an array

```swift
var friends = ["Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica"];

// append 사용하여 배열의 마지막에 욧 더함

friends.append("Gunther"); // ["Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica", "Gunther"]

// insert

friends.insert("Gunther", at:0)// ["Gunther","Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica", "Gunther"]
```

### 👉 배열의 요소 삭제하기, 길이 구하기

> ✔️ remove(at: index) , count

```swift
var friends = ["Gunther","Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica", "Gunther"];

// remove

friends.remove(at: 7) // "Gunther"

// 결과 ["Gunther","Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica"];

// count - 배열의 길이
friends.count // 7
```

---

## 19. Listing Data on IOS

### 👉 Table View Controller

![Screen Shot 2021-10-03 at 7.05.02 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ad6b2d8d-b18d-42ae-98c4-da3b29f76daa/Screen_Shot_2021-10-03_at_7.05.02_PM.png)

✔️ Table View Controller : view Controller with a table view inside of it.

단점: limited

![Screen Shot 2021-10-03 at 7.08.17 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6d237824-2511-4844-8981-28f3bfb876d6/Screen_Shot_2021-10-03_at_7.08.17_PM.png)

✔️ →Storyboard Entry Point: 앱이 어떤 화면에서 시작할 건지 표시

![Screen Shot 2021-10-03 at 7.11.04 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5d9bfb62-4979-4aff-8b87-dc852d1b4f17/Screen_Shot_2021-10-03_at_7.11.04_PM.png)

화살표가 안 보이더라도 View Controller의 ☑️ Is Initial View Controller에 체크해주면 됨.

Main.storyboard에서 View Controller를 삭제했다면 View Controller.swift 파일도 삭제한다.

<🗑 삭제 옵션>

Remove Reference : 파일을 삭제하지 않는 대신 표시되지 않게 함

Move to Trash: 삭제

### 👉 View Controller.swift 생성

🗂 Country List 파일 우클릭 > New File > Cocoa Touch Class

![Screen Shot 2021-10-03 at 7.19.28 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fdaa5964-b6f5-4eab-963c-1aedcf13ecc5/Screen_Shot_2021-10-03_at_7.19.28_PM.png)

Next > Create 로 생성하기

### 👉 연결하기

방금 생성한 CountryTableViewController.siwft를 Storyboard의 Table View Controller와 연결하기

![Screen Shot 2021-10-03 at 7.23.21 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1188306b-b86c-4d79-994b-3f3ba915924f/Screen_Shot_2021-10-03_at_7.23.21_PM.png)

![Screen Shot 2021-10-03 at 7.24.41 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/66227994-0e5d-4485-a4f6-863f24e7cbb0/Screen_Shot_2021-10-03_at_7.24.41_PM.png)

자동으로 연결하고 엔터, Assistant 들어가면 연결된 것 확인할 수 있음.

시뮬레이터에서 라인이 보이지 않는다면 Window > Point Accurate

---

## 20. How to list data on TableView

Row(=Cell) : 열

❓ 테이블에 열이 몇 개 있는지.

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5;
    }
```

row의 개수 결정. 5개의 row 있을 예정.

```swift
// What is each particular item
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = "Hi there";
        // Configure the cell...

        return cell
    }
```

Table View Controller에서 cell은 Storyboard에서 가져오는 것. reuseIdentifier 필요함.

![Screen Shot 2021-10-04 at 12.09.52 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9f4eb3a5-c203-4a67-90be-137f8fdb76b0/Screen_Shot_2021-10-04_at_12.09.52_AM.png)

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        cell.textLabel?.text = "Hi there";
        // Configure the cell...

        return cell
    }
```

Identifier의 이름이 같으면 Table View Contorller와 스토리보드 연결

![Screen Shot 2021-10-04 at 12.13.31 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/82e95fd2-db03-444f-9754-8d64af0f677d/Screen_Shot_2021-10-04_at_12.13.31_AM.png)

✔️ indexPath : 현재 몇 번째 인덱스에 있는지. tableView 메소드에서 리턴하는 인덱스 개수만큼.

```swift
let flags = ["🇧🇷", "🇳🇿", "🇵🇰","🇮🇹","🇹🇷"];

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        cell.textLabel?.text = flags[indexPath.row];
        // Configure the cell...

        return cell
```

![Screen Shot 2021-10-04 at 12.25.54 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/80c40c47-1bf9-4285-8989-58f9f350fa93/Screen_Shot_2021-10-04_at_12.25.54_AM.png)

---

# Routing on IOS

## 22. Route to another screen

View controller 에서 다른 View controller로 이동. Segue로. 이를 위해 navigation controller 필요함.

### 👉 Navigation Controller

'Country Table View Controller' (작은 노란색 버튼) 클릭 > Editor > Embed in > Navigation Controller.

![Screen Shot 2021-10-04 at 12.39.32 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/05bbb1fc-8438-4f74-a768-f9b0622f9d7e/Screen_Shot_2021-10-04_at_12.39.32_AM.png)

Navigation Controller를 Entry point로 잡음. `ctrl + 드래그` 해서 Table View로 연결하면 'Relationship Segue' 뜬다. 거기서 root view controller 선택.

+) + 버튼에서 생성하는 방식도 있음. 그럴 경우 Relationship 세팅되어 있음.

### 다른 View Controller로 이동.

텍스트의 길이가 label의 사이즈보다 클 경우

![Screen Shot 2021-10-04 at 12.48.56 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ce3da457-ade3-40c5-8073-df4116f3eec0/Screen_Shot_2021-10-04_at_12.48.56_AM.png)

![Screen Shot 2021-10-04 at 12.50.33 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2b98e97d-cb26-4c06-8cf4-e5eceb68e371/Screen_Shot_2021-10-04_at_12.50.33_AM.png)

Lines의 개수 조절하면 됨. 2면 2줄 표시. 0일 경우 모두 표시.

국기를 클릭하면 상세 페이지로 이동 👉 Segue 사용.

### Segue 만들기

시작점이 되는 View Controller 선택 > View Controller에서 `ctrl+드래그` 로 연결하고 싶은 View Controller로 끌고감 > 'Show' Segue 선택

![Screen Shot 2021-10-04 at 12.54.37 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/de1c8adb-6374-42b4-97b5-b898b67e5af0/Screen_Shot_2021-10-04_at_12.54.37_AM.png)

![Screen Shot 2021-10-04 at 12.56.28 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/57804bad-9763-4f66-a336-5513ef0b5a42/Screen_Shot_2021-10-04_at_12.56.28_AM.png)

그러면 이렇게 Segue 생성되고 그 전 View Controller로 돌아갈 수 있는 백 버튼이 생긴 것을 확인할 수 있다. Segue는 runSegue 또는 startSegue와 같은 코드가 실행되기 전까지는 작동하지 않는다.

### ✏️ Segue 이름 설정

![Screen Shot 2021-10-04 at 12.59.49 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d19a3b43-2d3e-4513-8f98-205f052b81fd/Screen_Shot_2021-10-04_at_12.59.49_AM.png)

작성한 Segue Indentifier 복사.

✅ CountryTableViewController.swift

didSelect 입력 > TableView 선택 > performSegue 메소드 추가(withIdentifer에 아까 전 생성한 segue 이름 넣어준다.)

![Screen Shot 2021-10-04 at 1.01.49 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e94ef654-113e-477e-b9da-a8c6051e0622/Screen_Shot_2021-10-04_at_1.01.49_AM.png)

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DefinitionSegue", sender: nil)
    }
```

row를 터치할 때마다 위 메소드가 실행될 것.

😔 문제점: 다른 국가를 선택해도 생성한 브라질 국기만 뜬다...

### ✏️ 백버튼 이름 바꾸기

변경 전에는 Title과 동일했으나, Back Button 이름을 따로 설정해주면 거기 맞춰서 변경된다.

![Screen Shot 2021-10-04 at 1.08.06 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8649eb14-cd5e-45b6-9baf-aead2a2c3817/Screen_Shot_2021-10-04_at_1.08.06_AM.png)

---

## 23. Data transfer between Screen.

새로 생성한 view controller(상세 정보를 표시하는 view controller)에 대한 코드가 없다. 생성하자.

CountryTableViewController 를 생성했을 때처럼

File > new File > Cocoa Touch Class > Subclass of 👉 UIViewController, 클래스 이름은 CountryDefinitionViewController로 설정

![Screen Shot 2021-10-04 at 1.12.41 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/732fb5e9-2d46-4042-9627-8037b7a60bcd/Screen_Shot_2021-10-04_at_1.12.41_AM.png)

Storyboard에 새로 생성된 View Controller의 작은 노란 버튼 클릭 > Custom Class를 아까전에 생성한 View Controller와 연결해준다.

![Screen Shot 2021-10-04 at 1.16.32 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/da700421-64d0-436b-a3e1-b6fd6525824a/Screen_Shot_2021-10-04_at_1.16.32_AM.png)

그럼 properties를 이제 코드에서 편집할 수 있다.

연결된 걸 확인하려면 Storyboard의 properties를 클릭하면 CountryDefinitionViewController가 표시된다.

✅ CountryDefinitionViewController

```swift
import UIKit

class CountryDefinitionViewController: UIViewController {

    @IBOutlet weak var bigFlagLabel: UILabel!

    @IBOutlet weak var countryDefinitionLabel: UILabel!

    var country = "🇨🇦";


    override func viewDidLoad() {
        super.viewDidLoad()

        bigFlagLabel.text = country;
    }
```

그럼 이제 상세 화면 이동시 캐나다 국기 표시됨.

### 👉 View Controller에서 다른 View Controller로 이동시 데이터 보내기

tableView 메소드의 sender 이용.

❓ 어떤 국기가 선택되었는지 알 수 있을까?

👉 indexPath.row 이용하기

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = flags[indexPath.row];
        performSegue(withIdentifier: "DefinitionSegue", sender: selectedCountry)
    }
```

그러나 다른 View Controller의 변수를 수정하기 위해서는 prepare 메소드 필요. prepare for segue라고 치면 자동으로 나온다.

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defOfViewController = segue.destination as! CountryDefinitionViewController;

        // CountryDefinitionViewController의 변수에 접근 가능
        defOfViewController.country = "🇲🇽";
    }
```

상세 페이지 이동시 멕시코 국기 표시된다.

그럼 이제 tableView의 sender로 보낸 selectedCountry를 넘겨주면 된다. sender는 prepare 메소드의 파라미터이기도 하다.

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = flags[indexPath.row];
        performSegue(withIdentifier: "DefinitionSegue", sender: selectedCountry)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defOfViewController = segue.destination as! CountryDefinitionViewController;
        let selectedCountry = sender as! String;    // performSegue의 sender가 String인 것
        // CountryDefinitionViewController의 변수에 접근 가능
        defOfViewController.country = selectedCountry;
    }
```

## 24. SWIFT for in loop

```swift
// 10부터 시작해서 20까지.
for count 10...20{
    print(count);
}

let friends = ["Chandler", "Phoebe", "Ross", "Joey", "Rachel", "Monica"];

// friends 배열의 요소 하나하나 꺼내온다.
for friend in friends {
	print("One of the friends character is \(friend)");
}

```
