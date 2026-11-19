import 'package:flutter/material.dart';
import 'package:num_library/features/auth/login_screen.dart';
import 'package:num_library/features/auth/register_screen.dart';
import 'package:num_library/features/books/add_book_screen.dart';
import 'package:num_library/features/books/book_details_screen.dart';
import 'package:num_library/features/borrow/borrow_history_screen.dart';
import 'package:num_library/features/splash/splash_screen.dart';
import 'package:num_library/shared/widgets/main_shell.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
  static const addBook = '/add-book';
  static const bookDetails = '/book-details';
  static const borrowHistory = '/borrow-history';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    main: (_) => const MainShell(),
    addBook: (_) => const AddBookScreen(),
    bookDetails: (_) => const BookDetailsScreen(),
    borrowHistory: (_) => const BorrowHistoryScreen(),
  };
}
