# swiftUI Apple Tutorial
[애플 튜토리얼](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)



## Selectable

<img width="432" alt="스크린샷 2023-12-27 오후 3 40 17" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/b0623c95-1ef2-4f51-9277-b4ec4d3f9c66">

Selectable 기능을 사용하면 preview에 보이는 컴포넌트들을 하나하나 눌러서 수정이 가능해진다!

원하는 컴포넌트 위에서 'control+commant+click'을 하게 되면 팝업 창이 뜨고 'Show SwiftUI Inspector'를 누르면

<img width="408" alt="스크린샷 2023-12-27 오후 3 47 20" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/5892c9d4-9297-40af-8d15-08b1f7c3809b">

위와 같이 해당 컴포넌트의 스타일이나 사이즈 등을 빠르게 설정할 수 있다.

<br>

## Spacer

Stack 내의 컴포넌트들이 디바이스 전체 너비를 사용하도록 레이아웃을 수정하려면 뷰 사이에 'Spacer()'를 넣어주면 된다.

<img width="244" alt="스크린샷 2023-12-28 오후 3 52 18" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/e04be731-6f53-46ec-9a7c-c0fe3f2701d7">

위와 같이 뷰들이 양쪽으로 분리 되었따~

<br>

## Embed

코드 내의 컴포넌트 위에 마우스 포인터를 두고 'comman+click' 하게 되면 해당 컴포넌트를 stack 등에 embed 할 수 있다

<img width="306" alt="스크린샷 2023-12-28 오후 4 11 05" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/fd878a37-fef2-4a8e-b4bf-ec429ab3876f">



## Custom Image View

asset에 추가한 이미지를 띄워보자

1) SwiftUI View 파일 생성

2) body에 기본으로 들어가 있는 Text를 Image로 바꾸고 문자열을 asset에 추가한 이미지 파일명을 넣어준다.

   이렇게 하면 사용하려는 이미지를 커스텀 할 수 있는 파일이 생성 된 것!

   ex. 테두리 커스텀 ->

   .clipShape(:_ style):  잘라냄

   ```swift
   // style 종류
   Circle()    //원
   Ellipse()   //타원
   Capsule()   //캡슐
   Rectangle() //직사각형
   RoundedRectangle(cornerRadius: 30) //둥근모서리
   ```

   ```swift
   // 사용
   
   var body: some View {
           Image("이미지명")
               .clipShape(Circle())
   }

​	

## identifiable

어떤 모델에 식별자가 필요할 때 사용되는 프로토콜

id 프로퍼티를 반드시 선언해야 하며 생성된 인스턴스를 비교할 수 있게 된다.

```swift
struct Landmark: ..., identifiable {
  var id: Int
  ...
}
```



만약, List에 이 프로토콜을 적용하지 않을 경우엔 List를 초기화 할 때 파라미터값으로 id를 전달해주어야 한다.

```swift
struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: .\id) { landmark in
            ...
        }
    }
}
```

<br>

## Canvas Device Setting

<img width=300 src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/8465a1df-8769-48c6-9cf7-7634e364628f">

preview에 보이는 디바이스의 캔버스 설정을 할 수 있다.

다크모드, 라이트모드 / 세로 모드, 가로모드 / 글씨크기

<br>

## List vs forEach

Handling user input 파트에서 

```swift
List(someModelList) { ... }
```

->

```swift
List {
  forEach(someModelList) { ... }
}
```

이렇게 수정하도록 가이드 하고 

> To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the `ForEach` type instead of passing your collection of data to `List`.

위와 같은 설명을 덧붙이는데 잘 이해가 가지 않아 찾아보았다.



**forEach**

- 데이터를 전달하기만 할 뿐 뷰의 졍렬에 대해 관여하지 않는다

- 단일 컨테이너뷰

- for-loop 동작



**List**

- 여러 뷰를 함께 구성할 수 있다

- 단일 셀 유형으로만 구성되는 목록을 원하는 경우 초기화 작업에서 forEach처럼 사용가능 'List(1 ..< 5)'

- 스크롤이 가능하다

- UITableView 처럼 동작



**forEach + List**

- forEach를 List 안에 사용하여 동적/정적 콘텐츠를 모두 가질 수 있다

  - = List는 셀을 재사용 한다 = forEach안의 데이터, 뷰 모두 재사용 된다.

  - 콘텐츠 유형이 다른 두 배열을 기반으로 List를 만들경우 사용할 수 있다.

- onMove, onDelete... 사용가능



참고: 

https://stackoverflow.com/questions/60900285/list-or-listforeach-the-right-approach-in-swiftui

https://stackoverflow.com/questions/56535326/what-is-the-difference-between-list-and-foreach-in-swiftui



## @State

뷰 내부의 특정 상태를 저장하고 해당 상태가 변경될 때 자동으로 뷰를 다시 그려주는 property wrapper이다.

```swift
import SwiftUI

struct ContentView: View {
    // @State 속성
    @State private var counter = 0

    var body: some View {
        VStack {
            Text("Counter: \(counter)")
            Button("Increment") {
                // @State 속성의 값을 변경
                counter += 1
            }
        }
    }
}
```



## @Obsevable

Observation을 사용하면 property wrapper나 binding없이도 데이터의 변경에 따라 view를 업데이트 할 수 있게 해준다. (iOS 17 이상 필요)

(아직은 잘 모르겠음 공부해서 추가 예정...)


## View 띄우기
UIKit에서 viewController를 기존 viewController위에 모달 처럼 띄우던 방식처럼
SwiftUI에서는 기본적으로 sheet 형식과 fullScreenCover 방식이 지원된다.

```swift
Button {
 // code
} label: {
  Label("View 띄우기", systemImage: "person.crop.circle")
}
.sheet(isPresented: $isShowing) {
  // code
}
```
이런식으로 작성해주면 아래에서 위로 올라오는 화면을 다 덮지 않는 View가 띄워진다.
