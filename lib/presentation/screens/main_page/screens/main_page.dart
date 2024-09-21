import 'package:bazar/main.dart';
import 'package:bazar/presentation/screens/cart_screen/screens/cart_screen.dart';
import 'package:bazar/presentation/screens/cart_screen/screens/select_my_location.dart';
import 'package:bazar/presentation/screens/home_screen/screens/home_screen.dart';
import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc.dart';
import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc_state.dart';
import 'package:bazar/presentation/screens/orders_screen/screen/orders_screen.dart';
import 'package:bazar/presentation/screens/profile_screen/screens/profile_screen.dart';
import 'package:bazar/presentation/screens/search_screen/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MainPageBloc, MainPageBlocState>(
      builder: (context, state) {
        if (state is LoadedScreenIndexMainPageBlocState) {
          return _screens[state.index];
        }

        return Container();
      },
    ), bottomNavigationBar: BlocBuilder<MainPageBloc, MainPageBlocState>(
      builder: (context, state) {
        if (state is LoadedScreenIndexMainPageBlocState) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.delivery_dining,
                ),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: state.index,
            onTap: (value) {
              context.read<MainPageBloc>().selectScreen(value);
            },
          );
        }
        return Container();
      },
    ));
  }
}
