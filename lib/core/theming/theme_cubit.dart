import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Theme Cubit to handle changing between themes.
class ThemeCubit extends Cubit<ThemeMode> {
  // Constructor - sets the initial theme to light
  ThemeCubit(this._secureStorage) : super(ThemeMode.light);
  final FlutterSecureStorage _secureStorage;


  // Toggles between light and dark themes
  void toggleTheme()async {
    ThemeMode newTheme= state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await storeCurrentTheme(newTheme);
    emit(newTheme);
  }


  Future<void> storeCurrentTheme(ThemeMode themeMode)async{
    print('=====theme store $themeMode');
    _secureStorage.write(key: 'ThemeMode', value: themeMode.name);
  }


  Future<void> getCurrentTheme()async {
    String? theme=  await _secureStorage.read(key: 'ThemeMode');
    ThemeMode themeMode;
    print('=======theme1 $theme');

    if(theme==null){
      print('=======theme2 $theme');

      themeMode= ThemeMode.light;
    }else {
      print('=======theme3 $theme');

      themeMode= theme== 'light'? ThemeMode.light : ThemeMode.dark;
    }
    print('=======theme $themeMode');
    emit(themeMode);
  }
}
