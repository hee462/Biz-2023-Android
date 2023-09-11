# Naver OpenAPI를 활용한 영화정보 어플

- OpenAPI를 사용하기 위한 Dependeny 도구 설치

```bash
flutter pub add http flutter_html

```

## 프로젝트 패키지 이름 변경하기

- 프로젝트를 생성할때 기본 패키지를 잘 만들어야 한다. 패키지를 잘못만들면, google paly stroe와 App store에 어플을 배포할수 없다.
  패키지는 기존의 다른 어플과 완전히 다른 값으로 설정해야 한다.
- 패키지는 회사의 인터넷 홈페이지 주소와 연동하여 설정한다. -`https://www.hee462.com`이라는 홈페이지가 있으면, `com.callor.어플이름`형식으로 사용한다.
  프로젝트를 만들 당시에 패키지를 잘못 지정하거나, 지정하지 않았을 경우 개발도중 패키지명을 변경해야할 필요가있다.
  이때 사용하는 도구가 있다.
- 패키지명 변경도구 : `flutter pub add change_app_package_name`
- 패키지명 변경 :`flutter pub run change-app-package-name:main com.hee462.movie` -> main 이후 나온 단어로 파일 바뀜

## OpenAPI 를 사용하기 위한 Android 설정 변경

- `\android\src\main\kotlin` 폴더의 `MainActivity.kt` 파일에서 패키지명이 잘 설정되었는지 확인한다.
- `\android\src\main\AndroidMainfast.xml` 파일을 열어서 패키지명이 잘 설정되었는지 확인을 해야한다.
- ` AndroidManifast.xml` 파일에서 다음 항목을 찾는다

```xml

<manifest xmlns:android="http://schemas.android.com/apk/res/android">
 <application>
```

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
 <queries>
  <package android:name"com.hee462.moive"/>
 </queries>

```

- 어플에서 인터넷을 통하여 외부 API를 사용하기 위한 권한을 부여한다
-
