import 'package:flutter/material.dart';
import 'injection/injection.dart';
import 'presentation/bloc/search_bloc.dart';
import 'presentation/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureInjection();
  runApp(const PocketGit());
}

class PocketGit extends StatelessWidget {
  const PocketGit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
        ),
      ),
      home: BlocProvider(
        create: (context) => SearchBloc(),
        child: const SearchPage(),
      ),
    );
  }
}
