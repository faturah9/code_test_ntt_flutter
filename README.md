# faturcodetestnttflutter

Project Code Test untuk masuk ke NTT menggunakan flutter

Dependencies Injector menggunakan GetIt
Http client Menggunakan Dio
State Management menggunakan Bloc


Alur data
request
- View -> Bloc -> Repository -> Network/Sqlite
  response
- Network -> Repository -> Bloc -> BlocBuilder-> View
  
View(Component untuk ui, jangan taro logic app)
  Folder:
  lib/pages

Bloc(Component untuk logic halaman)
Folder:
lib/bloc
note:
-daftarin bloc/cubit di injection_container.dart

Model(Class Entity Data, penamaannya ngikutin nama table)
Folder:
lib/model
note:
-json to model : https://javiercbk.github.io/json_to_dart/

Repository (File penghubung Bloc ke Data (network / sqlite) penamaannya ngikutin nama table)
Folder:
lib/repository/

Routes (menggunakan navigatorKey: di main.dart dan inject ke dalam injection_container.dart)
Folder:
lib/routes
- app_pages.dart (sebagai lokasi tujuan)
- app_routes.dart (sebagai lokasi nama route)



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
