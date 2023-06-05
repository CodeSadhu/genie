import 'dart:io';
import 'package:genie/commands.dart';
import 'package:path/path.dart' as path;
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser();

  final argResults = parser.parse(arguments);

  if (argResults.rest.isNotEmpty) {
    final command = argResults.rest[0];
    if (command == Commands.generate.name) {
      generateBoilerplateCode();
      return;
    }
  }

  print('Invalid command. Use "generate" to create the boilerplate code.');
}

void generateBoilerplateCode() {
  final libDirectory = Directory('lib');
  final utilsDirectory = Directory(path.join(libDirectory.path, 'utils'));
  final providersDirectory =
      Directory(path.join(libDirectory.path, 'providers'));
  final screensDirectory = Directory(path.join(libDirectory.path, 'screens'));

  // Create directories
  libDirectory.createSync();
  utilsDirectory.createSync();
  providersDirectory.createSync();
  screensDirectory.createSync();

  // Generate files
  generateCommonProviderFile(providersDirectory);
  generateColorsFile(utilsDirectory);
  generateStringsFile(utilsDirectory);
  generateConstantsFile(utilsDirectory);
  generateStylesFile(utilsDirectory);
  generateHomePageFile(screensDirectory);

  print('Boilerplate code generated successfully.');
}

void generateCommonProviderFile(Directory directory) {
  final file = File(path.join(directory.path, 'common_provider.dart'));
  file.createSync();
  file.writeAsStringSync('''
    import 'package:flutter/foundation.dart';

    class CommonProvider with ChangeNotifier {
      // Add your common provider logic here
    }
  ''');
}

void generateColorsFile(Directory directory) {
  final file = File(path.join(directory.path, 'colors.dart'));
  file.createSync();
  file.writeAsStringSync('''
    import 'package:flutter/material.dart';

    class ColorPalette {
      ColorPalette._();

      static const Color white = Colors.white;
      static const Color black = Colors.black;
    }
  ''');
}

void generateStringsFile(Directory directory) {
  final file = File(path.join(directory.path, 'strings.dart'));
  file.createSync();
  file.writeAsStringSync('''
    class Strings {
      Strings._();

      static const String projectName = 'My Project';
    }
  ''');
}

void generateConstantsFile(Directory directory) {
  final file = File(path.join(directory.path, 'constants.dart'));
  file.createSync();
  file.writeAsStringSync('''
    class Constants {
      Constants._();
      static const String fontName = 'Roboto';
    }
  ''');
}

void generateStylesFile(Directory directory) {
  final file = File(path.join(directory.path, 'styles.dart'));
  file.createSync();
  file.writeAsStringSync('''
    import 'package:flutter/material.dart';

    class Styles {
      Styles._();
      
      static const TextStyle appbarStyle = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      );
    }
  ''');
}

void generateHomePageFile(Directory directory) {
  final file = File(path.join(directory.path, 'home_page.dart'));
  file.createSync();
  file.writeAsStringSync('''
    import 'package:flutter/material.dart';

    class HomePage extends StatefulWidget {
      @override
      _HomePageState createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
      // Add your homepage logic here

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Container(),
        );
      }
    }
  ''');
}
