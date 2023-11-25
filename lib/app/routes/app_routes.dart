// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const FORGOT = _Paths.FORGOT;
  static const SIGNUP = _Paths.FORGOT;
  static const SAVEDTRIPS = _Paths.SAVEDTRIPS;
  static const EDITPROFILE = _Paths.EDITPROFILE;
  static const APPSETTINGS = _Paths.APPSETTINGS;
  static const CHANGEPASSWORD = _Paths.CHANGEPASSWORD;
  static const HOST = _Paths.HOST;
  static const GENERATOR = _Paths.GENERATOR;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const FORGOT = '/forgot';
  static const SIGNUP = '/signup';
  static const SAVEDTRIPS = '/savedtrips';
  static const EDITPROFILE = '/editprofile';
  static const APPSETTINGS = '/appsettings';
  static const CHANGEPASSWORD = '/changepassword';
  static const HOST = '/host';
  static const GENERATOR = '/generator';
}
