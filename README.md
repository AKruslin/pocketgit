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

2. Optional - pick sorting method for search

3. Press search button to fetch data about wanted repository if it exists

4. When data is loaded either click on user image to open **User details** or click on body of a repository card to open Repository details

### When in User details

1. There should be shown data about github user.

2. Clicking on open in web will open this user in your web browser.

3. Clicking on one repository from repository list on the lower part of the page will open Repository details just like on Search page.

### When in Repository details

1. There should be shown data about github repository.

2. Clicking on open in web will open this repository in your web browser.

### Communication path between UI and Data

- UI -> BLoC -> Usecase -> Repository -> Datasource
