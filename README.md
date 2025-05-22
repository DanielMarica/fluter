# note_flutter

## Documentation References by Chapter

### Chapter 1: Stateless Widgets
- **Justification: Used to define a widget that does not change over time, forming the basis for `LaureatWidget`, `ProductWidget`, and `CustomButton`.**  
  StatelessWidget - [https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- **Justification: Displays text content, used in `LaureatWidget` and layout examples like product descriptions.**  
  Text - [https://api.flutter.dev/flutter/widgets/Text-class.html](https://api.flutter.dev/flutter/widgets/Text-class.html)
- **Justification: Provides a styled container for `LaureatWidget` to display laureate information in a card layout.**  
  Card - [https://api.flutter.dev/flutter/widgets/Card-class.html](https://api.flutter.dev/flutter/widgets/Card-class.html)
- **Justification: Adds spacing around widgets, used in `LaureatWidget` and product layouts for padding.**  
  Padding - [https://api.flutter.dev/flutter/widgets/Padding-class.html](https://api.flutter.dev/flutter/widgets/Padding-class.html)
- **Justification: Organizes widgets vertically, used in `Homescreen` and `ProductWidget` layouts.**  
  Column - [https://api.flutter.dev/flutter/widgets/Column-class.html](https://api.flutter.dev/flutter/widgets/Column-class.html)
- **Justification: Loads and displays images, used to add `iphone.jpg` in `ProductWidget`.**  
  Image.asset - [https://api.flutter.dev/flutter/widgets/Image/Image.asset.html](https://api.flutter.dev/flutter/widgets/Image/Image.asset.html)
- **Justification: Arranges widgets horizontally, used in `ProductWidget` to align text and images.**  
  Row - [https://api.flutter.dev/flutter/widgets/Row-class.html](https://api.flutter.dev/flutter/widgets/Row-class.html)
- **Justification: Expands a widget to fill available space, used in `ProductWidget` to manage layout constraints.**  
  Expanded - [https://api.flutter.dev/flutter/widgets/Expanded-class.html](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
- **Justification: Constrains widget size or creates empty space, used for spacing in layouts.**  
  SizedBox - [https://api.flutter.dev/flutter/widgets/SizedBox-class.html](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)
- **Justification: Creates a raised button, used as the basis for `CustomButton` to show laureate details.**  
  ElevatedButton - [https://api.flutter.dev/flutter/material/ElevatedButton-class.html](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
- **Justification: Displays a dialog, used in `CustomButton` to show laureate details on press.**  
  AlertDialog - [https://api.flutter.dev/flutter/material/AlertDialog-class.html](https://api.flutter.dev/flutter/material/AlertDialog-class.html)

### Chapter 2: Stateful Widgets and Lists
- **Justification: Defines a widget with mutable state, used for `HomeScreen` to toggle property types.**  
  StatefulWidget - [https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- **Justification: Manages the state of a `StatefulWidget`, used in `_HomeScreenState` for state updates.**  
  State - [https://api.flutter.dev/flutter/widgets/State-class.html](https://api.flutter.dev/flutter/widgets/State-class.html)
- **Justification: Provides a toggle switch, used in `HomeScreen` to switch between sales and rentals.**  
  Switch - [https://api.flutter.dev/flutter/material/Switch-class.html](https://api.flutter.dev/flutter/material/Switch-class.html)
- **Justification: Builds a dynamic list efficiently, used in `HomeScreen` to display properties.**  
  ListView.builder - [https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
- **Justification: Displays a single list item with a standard layout, used within `PropertyWidget` for property details.**  
  ListTile - [https://api.flutter.dev/flutter/material/ListTile-class.html](https://api.flutter.dev/flutter/material/ListTile-class.html)
- **Justification: Adds a divider between list items, used in `ListView.separated` for visual separation.**  
  Divider - [https://api.flutter.dev/flutter/widgets/Divider-class.html](https://api.flutter.dev/flutter/widgets/Divider-class.html)

### Chapter 4: Navigation and State Management
- **Justition: Provides a reactive way to access and rebuild UI based on changes in a `ChangeNotifier`, used in `ListScreen` to access `ArticleViewModel` for displaying and filtering articles.**  
  Consumer - [https://pub.dev/documentation/provider/latest/provider/Consumer-class.html](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html)
- **Justification: A state management package that provides dependency injection and reactive updates, used to manage `ArticleViewModel` in `ListScreen` for handling article data and state.**  
  provider - [https://pub.dev/packages/provider](https://pub.dev/packages/provider)
- **Justification: A routing package for declarative navigation, used in `ListScreen` to navigate to the article creation screen (`/create-article`) and article details screen (`/articles/:id`).**  
  go_router - [https://pub.dev/packages/go_router](https://pub.dev/packages/go_router)
- **Justification: Provides a material design structure for the app, used in `ListScreen` to create the main layout with an `AppBar`, `FloatingActionButton`, and body content.**  
  Scaffold - [https://api.flutter.dev/flutter/material/Scaffold-class.html](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- **Justification: Creates a floating action button, used in `ListScreen` to trigger navigation to the article creation screen.**  
  FloatingActionButton - [https://api.flutter.dev/flutter/material/FloatingActionButton-class.html](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html)
- **Justification: Displays an icon button, used in `ListScreen` for toggling read status and deleting articles.**  
  IconButton - [https://api.flutter.dev/flutter/material/IconButton-class.html](https://api.flutter.dev/flutter/material/IconButton-class.html)
- **Justification: Displays a dynamic list with separators, used in `ListScreen` to show a list of articles with dividers between them.**  
  ListView.separated - [https://api.flutter.dev/flutter/widgets/ListView/ListView.separated.html](https://api.flutter.dev/flutter/widgets/ListView/ListView.separated.html)

### ALL dependences if needed it 



### Installation de sqlite pour Flutter
Nous allons installer le package sqlflite et son alternative web, sqflite_common_ffi_web:

flutter pub add sqflite
flutter pub add path
flutter pub add sqflite_common_ffi_web
Il faut ensuite tourner une petite ligne de commande (dans le terminal, dans le répertoire de votre application):

dart run sqflite_common_ffi_web:setup