# Weather Boilerplate App

Flutter Boilerplate project with Riverpod and SOLID principles for scalable and maintainable Flutter applications.

### Flutter 3.0.4 Null Safety ⭐

## Features
- Automatically acquire user current location
- Search weather info by location

## How to Run
1. Create an account at [WeatherMap](http://www.weatherapi.com).

2. Then get your API key from https://www.weatherapi.com/my/

3. Clone the repo
   ```sh
   git clone https://gitlab.com/iamnabink/weather-app-boiler-plate.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. This app uses `freezed`,`auto_route_generator`,'json_serializable' libraries that works with code generation, execute the following command to generate files
   ```sh
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

5. Navigate to **assets/env** and paste your API key to the OPEN_API_KEY variable
   ```dart
   OPEN_API_KEY = Paste Your API Key Here
   ```
6. Run the App


### Folder structure

```
assets
    |-fonts/                         <--- Custom fonts
    |-images/                        <--- file resources
    |-.env                          <--- application's necessary variables
    |-.env.example                  <--- example application's necessary variables
lib/
    core/                          <--- app global/core files
        |-data
            |-entities/                     <-- contains generic entities used in project
            |-local/                        <-- Contains file with global local storage function/variable constants
            |-remote/                        <-- contains files related to remote data fetching (mainly from apis)
        |-di/                             <-- contains core classes dependency injection
        |-presentation/                   <-- contains core classes dependency injection
            |-resources/                   <-- contains app theme/constant resources
            |-widgets/                    <-- contains global [shared] widgets
    features/                           <---features layer
        |-help/                          <-- Help screen layer
          |-data/                           <--- data layer
            |-repository/                       <-- repositories (retrieve data, heavy processing etc..)
          |-di/                             <-- contains core classes dependency injection
          |-domain/                         <-- domain layer / help page business requirements
            |-repository/                       <-- domain repository
          |-presentation                     <-- presentation layer
            |-page                              <-- contains application's UI/Screen
            |-provider                     <-- contains providers
            |-widgets                     <-- contains widgets
        |-home/                   <--  Home screen layer
          |-data/                   <-- data layer
            |-datasource/                   <-- data sources for data layer
                |-local/                   <-- local data source [SecureStorage]
                |-remote/                   <-- remote data source [API]
            |-entity/                   <-- contains data entities
            |-repository/                   <-- repositories (retrieve data, heavy processing etc..)
          |-di/                             <-- contains core classes dependency injection
          |-domain/                             <-- domain layer / help page business requirements
            repository/                   <-- domain repository
          |-presentation                     <-- presentation layer
            |-page                     <-- contains application's UI/Screen
            |-notifiers                     <-- contains  notifiers
            |-widgets                     <-- contains widgets

    routes/                       <--- contains custom route related files
    main.dart                     <--- entry point - production
    main.dev.dart                 <--- entry point - development
test/                             <--- contains test files [Mock Test, Unit tests]


```

## Technologies

### Architecture
- **Clean Architecture (TDD)**

### Libraries
- **Riverpod (state managment, dependencies manager, ui components , hooks)**
- **Auto Route (navigation service)**
- **Weather Api**
- **Sentry (crash analytics)**
- **Freezed | Json Serializable (Code generation for immutable classes)**


### Storage
- **Flutter SecureStorage**

Again to note, this is not a best and final version, you are always invited to edit and suggest changes, please make pull request to make changes this readme.


## Contact
- [Nabraj Khadka](https://www.linkedin.com/in/iamnabink/) | [Github](https://github.com/iamnabink)

Author:
    [Nabraj Khadka](https://www.linkedin.com/in/iamnabink/)
    Supreme IT Solutions Kathmandu, Nepal
