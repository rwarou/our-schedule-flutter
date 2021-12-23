# 약속 스케줄 작성 앱

## stack
|SERVER|DATABASE|BACKEND|APPLICATION|
|:---:|:---:|:---:|:---:|
|`aws` or heroku|mongoDB or `mariaDB`|express.js|flutter|

<br>

## developer
- [rwarou]

<br>

## directory
|folder dept|content|other|
|:---|:---:|:---:|
|OUR_SCHEDULE|root directory|
|OUR_SCHEDULE/android|aos directory|AOS 설정할 때 해당 폴더 내 파일에 접근|
|OUR_SCHEDULE/ios|ios directory|IOS 설정할 때 해당 폴더 내 파일에 접근|
|OUR_SCHEDULE/web|web directory|
|OUR_SCHEDULE/lib|flutter directory|이 디렉토리에서 개발 진행|
|OUR_SCHEDULE/lib/components|컴포넌트 모음|아직 사용하지 않음 (12/22 기준)|
|OUR_SCHEDULE/lib/models|모델 모음|아직 사용하지 않음 (12/22 기준)|
|OUR_SCHEDULE/lib/pages|페이지 모음||
|OUR_SCHEDULE/lib/repository|레파지토리 모음|로컬스토리지를 위해 사용하는 중 (12/22 기준)|

<br>

## used dependencies
|name|used version|content|
|:---|:---|:---|
|[get]|^4.6.1|상태관리 라이브러리|
|[flutter_secure_storage]|^5.0.2|localStorage 사용|
|[dio]|^4.0.4|서버와 통신하기 위한 라이브러리 (12/23 기준 아직 사용 전)|
|[table_calendar]|^3.0.3|일정 정보를 표현해주기 위해 사용|
|[intl]|^0.17.0|아직 잘 모르겠음 (추후에 사용하게 될 듯)|
|auto_size_text|^3.0.0|텍스트 사이즈 및 라인 지정하여 동적으로 활용가능한 라이브러리|

<br>

## flutter version
|version|date|
|:---:|:---:|
|2.5.3|2021.12.21~2021.12.23|
|2.8.1|2021.12.23~|



[rwarou]:https://github.com/rwarou
[get]:https://pub.dev/packages/get
[flutter_secure_storage]:https://pub.dev/packages/flutter_secure_storage
[dio]:https://pub.dev/packages/dio
[table_calendar]:https://pub.dev/packages/table_calendar
[intl]:https://pub.dev/packages/intl