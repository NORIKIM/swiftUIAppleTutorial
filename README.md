# swiftUI Apple Tutorial
[애플 튜토리얼](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)



## Selectable

<img width="432" alt="스크린샷 2023-12-27 오후 3 40 17" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/b0623c95-1ef2-4f51-9277-b4ec4d3f9c66">

Selectable 기능을 사용하면 preview에 보이는 컴포넌트들을 하나하나 눌러서 수정이 가능해진다!

원하는 컴포넌트 위에서 'control+commant+click'을 하게 되면 팝업 창이 뜨고 'Show SwiftUI Inspector'를 누르면

<img width="408" alt="스크린샷 2023-12-27 오후 3 47 20" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/5892c9d4-9297-40af-8d15-08b1f7c3809b">

위와 같이 해당 컴포넌트의 스타일이나 사이즈 등을 빠르게 설정할 수 있다.



## Spacer

Stack 내의 컴포넌트들이 디바이스 전체 너비를 사용하도록 레이아웃을 수정하려면 뷰 사이에 'Spacer()'를 넣어주면 된다.

<img width="244" alt="스크린샷 2023-12-28 오후 3 52 18" src="https://github.com/NORIKIM/swiftUIAppleTutorial/assets/31604976/e04be731-6f53-46ec-9a7c-c0fe3f2701d7">

위와 같이 뷰들이 양쪽으로 분리 되었따~



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



