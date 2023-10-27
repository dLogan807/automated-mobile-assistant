# Automated Mobile Assistant

## Introduction

Automated Mobile Assistant is an Android and iOS app being developed using Flutter. Its purpose is to automatically generate suggested automated tasks based off the user's activity, assisting them in automating tasks of their everyday life that they choose. It aims to do this transparently, with the user's privacy at its forefront but without compromising ease-of-use.

## Dependencies

Dart is the main development language (Android and iOS have not been individually targeted yet).  
Several Flutter packages are also required for code functionality:
- [geolocator](https://pub.dev/packages/geolocator)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [equatable](https://pub.dev/packages/equatable)
- [http](https://pub.dev/packages/http)
- [geocoding](https://pub.dev/packages/geocoding)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

## Development Setup

Currently, the app is not in a state in which it can be used on a device. However, it may be configured for development by following these steps:

1. Follow this [tutorial](https://www.youtube.com/watch?v=VFDbZk2xhO4) to install Flutter and Android Studio. The use of other editors, such as Visual Studio Code, is up to personal preference. 

2. Clone the project to a local directory or download its zip.

3. Add a .env file to the project's root directory and add your Open Weather Api key for the variable shown below. You can generate an api key by creating an account [here](https://home.openweathermap.org/users/sign_up).  
![.env sample](https://github.com/dLogan807/automated-mobile-assistant/blob/main/env_sample.png?raw=true)
