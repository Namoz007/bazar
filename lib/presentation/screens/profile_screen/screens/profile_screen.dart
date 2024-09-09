import 'package:bazar/core/utils/details/app_details.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc_event.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetMyUserUserBlocEvent());
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppDetails.model!.fullName),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          context.read<UserBloc>().add(GetMyUserFromSourcesUserBlocEvent());
        },
        child: BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, state) {
            if (state is LoadedUserUserBlocState) {
              return RefreshIndicator(
                onRefresh: () async{
                  context.read<UserBloc>().add(GetMyUserFromSourcesUserBlocEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey,),
                            image: DecorationImage(image: AppDetails.model!.imgUrl == null ? const AssetImage("assets/images/person.jpg") : NetworkImage(AppDetails.model!.imgUrl.toString(),),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        
            return Container();
          },
        ),
      ),
    );
  }
}
