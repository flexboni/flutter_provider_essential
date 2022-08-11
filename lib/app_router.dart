import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/main.dart';
import 'package:flutter_provider_essential/provider_overview_01/overview_01.dart';
import 'package:flutter_provider_essential/provider_overview_02/overview_02.dart';
import 'package:flutter_provider_essential/provider_overview_03/overview_03.dart';
import 'package:flutter_provider_essential/provider_overview_04/overview_04.dart';
import 'package:flutter_provider_essential/provider_overview_05/overview_05.dart';
import 'package:flutter_provider_essential/provider_overview_06/overview_06.dart';
import 'package:flutter_provider_essential/provider_overview_07/overview_07.dart';
import 'package:flutter_provider_essential/provider_overview_08/overview_08.dart';
import 'package:flutter_provider_essential/provider_overview_09/overview_09.dart';
import 'package:flutter_provider_essential/provider_overview_10/overview_10.dart';
import 'package:flutter_provider_essential/provider_overview_12/overview_12.dart';

class AppRoutes {
  static const main = '/';
  static const overView01 = '$main/over-view-01';
  static const overView02 = '$main/over-view-02';
  static const overView03 = '$main/over-view-03';
  static const overView04 = '$main/over-view-04';
  static const overView05 = '$main/over-view-05';
  static const overView06 = '$main/over-view-06';
  static const overView07 = '$main/over-view-07';
  static const overView08 = '$main/over-view-08';
  static const overView09 = '$main/over-view-09';
  static const overView10 = '$main/over-view-10';
  static const overView12 = '$main/over-view-12';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRoutes.overView01:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview01(),
          settings: settings,
        );

      case AppRoutes.overView02:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview02(),
          settings: settings,
        );

      case AppRoutes.overView03:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview03(),
          settings: settings,
        );

      case AppRoutes.overView04:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview04(),
          settings: settings,
        );

      case AppRoutes.overView05:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview05(),
          settings: settings,
        );

      case AppRoutes.overView06:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview06(),
          settings: settings,
        );

      case AppRoutes.overView07:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview07(),
          settings: settings,
        );

      case AppRoutes.overView08:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview08(),
          settings: settings,
        );

      case AppRoutes.overView09:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview09(),
          settings: settings,
        );

      case AppRoutes.overView10:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview10(),
          settings: settings,
        );

      case AppRoutes.overView12:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Overview12(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MyApp(),
          settings: settings,
        );
    }
  }
}
