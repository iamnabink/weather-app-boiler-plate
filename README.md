# Moru Weather App

A simple weather app built with the help of www.weatherapi.com - as an assignment given by moru team.

### Flutter 3.0.4 Null Safety ⭐

## Features
- Automatically acquire user current location
- Search weather info by location

## How to Run
1. Create an account at [WeatherMap](http://www.weatherapi.com).

2. Then get your API key from https://www.weatherapi.com/my/

3. Clone the repo
   ```sh
   git clone https://gitlab.com/iamnabink/moru-weather.git
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
    |-,env.example                  <--- example application's necessary variables
lib/
    core/                          <--- application layer
        |-data
            |-entities/                     <-- contains generic entities used in project
            |-local/                        <-- Contains file with global local storage function/variable constants
            |-remote/                        <-- contains files related to remote data fetching (mainly from apis)
        |-di/                             <-- contains core classes dependency injection
        |-presentation/                   <-- contains core classes dependency injection
            |-resources/                   <-- contains app theme/constant resources
            |-widgets/                    <-- contains global [shared] widgets
    features/                           <--- data layer
        |-help/                          <-- repositories (retrieve data, heavy processing etc..)
          |-data/                       <--- data layer
            |-repository/                   <-- repositories (retrieve data, heavy processing etc..)
          |-di/                             <-- contains core classes dependency injection
          |-domain/                             <-- domain layer
            |-repository/                   <-- domain repository
          |-presentation                     <-- presentation layer
            |-page                     <-- contains application's UI/Screen
            |-provider                     <-- contains providers
            |-widgets                     <-- contains widgets
        |-home/                   <-- repositories (retrieve data, heavy processing etc..)
          |-data/                   <-- contains app theme/constant resources
            |-datasource/                   <-- data sources for data layer
                |-local/                   <-- local data source [SecureStorage]
                |-remote/                   <-- remote data source [API]
            |-entity/                   <-- contains data entities
            |-repository/                   <-- repository implementation
          |-di/                             <-- contains core classes dependency injection
          |-domain/                             <-- contains dependency injection files
            repository/                   <-- contains app theme/constant resources
          |-presentation                     <-- presentation layer
            |-page                     <-- contains application's UI/Screen
            |-notifiers                     <-- contains  notifiers
            |-widgets                     <-- contains widgets

    routes/                       <--- contains custom route related files
    main.dart                     <--- entry point - production
    main.dev.dart                     <--- entry point - development
test/                               <--- contains test files [Mock Test, Unit tests]


```

Again to note, this is not a best and final version, you are always invited to edit and suggest changes, please make pull request to make changes this readme.


## Contact
- [Nabraj Khadka](https://www.linkedin.com/in/iamnabink/) | [Github](https://github.com/iamnabink)

Author:
    [Nabraj Khadka](https://www.linkedin.com/in/iamnabink/)
    Supreme IT Solutions Kathmandu, Nepal
