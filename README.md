# CoreDataListProject
**CoreData 활용 연습을 위해 [기존에 SwiftUI로 만든 숫자 카드 클릭 게임](https://github.com/Eunice0927/GridRowProject)을 가지고와 게임 성적을 저장하도록 했다.** <br/>
- 게임 결과가 Core Data에 저장되어 TableView로 보여진다. <br/>
- 게임 결과는 최대 20등까지 보여진다. <br/>
- 두 뷰는 탭바로 연결되었다.

## 게임 설명
- 1~20까지 순서대로 카드를 누른다.
- 알맞은 카드를 누르면 카드가 사라진다.
- 성공, 실패에 따라 결과 화면이 보여진다.

## 게임 화면
- 실패(case1): 1부터 시작했지만 중간에 틀린 경우
- 실패(case2): 1도 누르지 못한 경우

|시작|실패(case1)|실패(case2)|성공|다시하기|
|:-:|:-:|:-:|:-:|:-:|
|<img height="300" src="https://github.com/Eunice0927/GridRowProject/assets/106911494/76a94885-6183-4544-9c9d-6e4fa36d9483">|<img height="300" src="https://github.com/Eunice0927/GridRowProject/assets/106911494/77b828b2-310a-4419-8238-9155b99100a6">|<img height="300" src="https://github.com/Eunice0927/GridRowProject/assets/106911494/4e2dac47-ae22-4519-a8a6-059f5a1b91b7">|<img height="300" src="https://github.com/Eunice0927/GridRowProject/assets/106911494/76674b53-807c-4af2-a440-6ea3865fd92b">|<img height="300" src="https://github.com/Eunice0927/GridRowProject/assets/106911494/3b2238b6-9a18-458a-a326-d0ab19b483a2">|

## 결과 화면
|결과|
|:-:|
|<img height="300" src="https://github.com/Eunice0927/CoreDataListProject/assets/106911494/4ad8dc99-3412-4410-bd02-23c9159330d9">|
