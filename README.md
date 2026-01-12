# internet_checker_plus

A lightweight Flutter plugin to check **real internet connectivity** and **connection stability level** in real time.
Unlike basic connectivity checkers, `internet_checker_plus` measures **actual network usability** and classifies the connection into clear stages:
**offline**, **poor**, **unstable**, **warn**, and **stable**.
This helps apps prevent failed API calls, dropped calls, and poor user experiences by reacting **before** the network becomes unusable.


## Features
- Check internet connections
- Detects offline internet
- Measures latency & jitter
- Connection levels:
    - poor
    - unstable
    - warn
    - stable
- No third-party dependencies
- pub.dev lifetime safe

## Add to your pubspec.yaml:
````
dependencies:
  internet_checker_plus: ^0.1.0

````
````
Install:

flutter pub add internet_checker_plus

````

Import:
````
import 'package:internet_checker_plus/internet_checker_plus.dart';

````

## Usage Example

`````
final level = await InternetCheckerPlus.check();

if (level == InternetLevel.unstable) {
  // handle unstable internet
}


switch (level) {
  case InternetLevel.offline:
    print('No internet');
    break;
  case InternetLevel.poor:
    print('Poor connection');
    break;
  case InternetLevel.unstable:
    print('Unstable connection');
    break;
  case InternetLevel.warn:
    print('Connection warning');
    break;
  case InternetLevel.stable:
    print('Stable connection');
    break;
}


`````

## Stream

````
InternetCheckerPlus.onStatusChange().listen((level) {
  print('Internet level: $level');
});


````

🤝 Contributing

Contributions are welcome!
Feel free to open an issue or submit a pull request.


⭐ Support the Project

## Example App

Check out the [example](https://github.com/sajibsaha4647/internet_checker_plus.git) directory for a complete working app.

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you find this package helpful, please give it a ⭐ on [GitHub](https://github.com/sajibsaha4647/internet_checker_plus.git)!
EOF