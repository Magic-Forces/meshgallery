// MeshGallery - gallery app
// Copyright (C) 2025 Magic-Forces
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/config/globals.dart';
import 'package:meshgallery/theme/theme.dart';
import 'package:meshgallery/utils/permissions.dart';

import 'package:meshgallery/homepage.dart';
import 'package:meshgallery/pages/permission_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final permissionsGranted = await requestPermissions();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      useFallbackTranslations: true,
      child: MyApp(
        startPage: permissionsGranted.allGranted
            ? const HomePage()
            : const PermissionGate(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startPage;
  const MyApp({super.key, required this.startPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeshGallery',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: startPage,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
