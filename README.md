# pocket_github_app

Simple Flutter project that is using best practices and architecture.

**Project contains**:

- dependency injection (**GetIt** + **injectable**)
- bloc architecture (**BLoC**)
- networking (**http**)
- parsing json response (**JsonSerializable**)
- opening in browser (**Url launcher**)

## Getting Started

Flutter version: **2.10.3** (**stable**)

For best user experience run app on **iOS** and **Android** platforms, but you can also run it on Web - **UI** is **NOT configured** for Web platform.

## App flow

1. Enter repository in search text field name for example type "flutter"

<img src='https://user-images.githubusercontent.com/70284063/159586641-06d01d3c-1d17-4b27-8dc4-66b5d58f13e4.png' height='650'>

2. Press search button to fetch data about wanted repository if it exists

3. Optional - pick sorting method for search

<img src='https://user-images.githubusercontent.com/70284063/159586875-bc8426fa-a9aa-463b-8881-93cf9b2e5946.png' height='650'>  <img src='https://user-images.githubusercontent.com/70284063/159587087-0646f5a2-a6d8-47c6-8fc2-4bebaaa12b1f.png' height=650>  <img src='https://user-images.githubusercontent.com/70284063/159587264-9e05c446-5e28-422d-8db4-09a521acf97d.png' height=650>

4. When data is loaded either click on user image to open **User details** or click on body of a repository card to open **Repository details**



### When in User details

1. There should be shown data about github user.

2. Clicking on open in web will open this user in your web browser.

3. Clicking on one repository from repository list on the lower part of the page will open Repository details just like on Search page.

<img src='https://user-images.githubusercontent.com/70284063/159587675-4c7f54cd-900b-4af9-bea9-9cbabe8426ef.png' height='650'>  <img src='https://user-images.githubusercontent.com/70284063/159587803-084ad96b-a7f8-445d-8a40-8e01382fb1a6.png' height='650'>

<img src='https://user-images.githubusercontent.com/70284063/159588139-5208ef41-ac0d-4ff5-a467-d197e6e2b6e5.png' height='650'>  <img src='https://user-images.githubusercontent.com/70284063/159588357-09800cd2-a051-418d-8e2e-57df284bd46f.png' height='650'>

### When in Repository details

1. There should be shown data about github repository.

2. Clicking on open in web will open this repository in your web browser.

<img src='https://user-images.githubusercontent.com/70284063/159588652-8592e700-c778-4d1f-9f67-cc1e18bbde1f.png' height='650'>  <img src='https://user-images.githubusercontent.com/70284063/159588562-6dff2b15-b1d1-4184-8ddb-dddd58f42a41.png' height='650'>

### Communication path between UI and Data

- UI -> BLoC -> Usecase -> Repository -> Datasource
