import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/src/presentation/screens/cart.dart';

import '../../config/injection_container.dart';
import 'bloc/tutorial/article/remote/remote_articles_bloc.dart';
import 'bloc/tutorial/article/remote/remote_articles_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticlesBloc>(
          create: (context) => sl()..add(const GetArticles()),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData.light().copyWith(
            colorScheme: ThemeData.light().colorScheme.copyWith(
                  onPrimary: Colors.white, // Color for checkmark in datatable
                  primary:
                      Colors.red, // Color used for checkbox fill in datatable
                ),
            checkboxTheme: CheckboxThemeData(
              side: MaterialStateBorderSide.resolveWith(
                  (_) => const BorderSide(width: 1, color: Colors.blue)),
              fillColor: MaterialStateProperty.all(Colors.white),
              checkColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const CartScreen()),
    );
  }
}
