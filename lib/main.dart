import 'package:diaco/cubit/GetList/get_list_cubit.dart';
import 'package:diaco/pages/login_screen.dart';
import 'package:diaco/pages/message_screen.dart';
import 'package:diaco/repositories/diaco_repositories.dart';
import 'package:diaco/server/diaco_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DiacoRepositories(
          diacoApiServices: DiacoApiServices(client: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetListCubit(
                diacoRepositories: context.read<DiacoRepositories>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            MessageScreen.routeName: (context) => const MessageScreen()
          },
        ),
      ),
    );
  }
}
