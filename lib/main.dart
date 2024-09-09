import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/datasources/authentication_sources.dart';
import 'package:bazar/data/repostories/authentication_repositories.dart';
import 'package:bazar/data/repostories/order_repositories.dart';
import 'package:bazar/data/repostories/products_repositories.dart';
import 'package:bazar/data/repostories/user_repositories.dart';
import 'package:bazar/firebase_options.dart';
import 'package:bazar/presentation/screens/authentication/bloc/authentication_bloc.dart';
import 'package:bazar/presentation/screens/authentication/screens/splash_screen.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc.dart';
import 'package:bazar/presentation/screens/home_screen/products_bloc/products_bloc.dart';
import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dependencysSetup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepositories()),
        RepositoryProvider(create: (context) => ProductsRepositories()),
        RepositoryProvider(create: (context) => OrderRepositories()),
        RepositoryProvider(create: (context) => UserRepositories()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(create: (context) => MainPageBloc()),
          BlocProvider(create: (context) => ProductsBloc()),
          BlocProvider(create: (context) => OrderBloc()),
          BlocProvider(create: (context) => UserBloc()),
          
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
        ),
      ),
    );
  }
}
