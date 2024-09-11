import 'package:bazar/core/utils/details/app_details.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc_event.dart';
import 'package:bazar/presentation/screens/profile_screen/bloc/user_bloc/user_bloc_state.dart';
import 'package:bazar/presentation/widgets/profile_screen_widgets/edit_my_datas.dart';
import 'package:bazar/presentation/widgets/profile_screen_widgets/profile_details.dart';
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
        title: BlocBuilder<UserBloc,UserBlocState>(builder: (context,state){
          if(state is LoadedUserUserBlocState){
            return Text(state.userModel.fullName);
          }
          return Text(AppDetails.model!.fullName);
        },),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const EditMyDatas(),
                isScrollControlled: true,
                isDismissible: false,
              );
            },
            child: const Icon(
              Icons.mode_edit_outlined,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserBloc>().add(GetMyUserFromSourcesUserBlocEvent());
        },
        child: ListView(
          children: [
            BlocBuilder<UserBloc, UserBlocState>(
              builder: (context, state) {
                if (state is LoadedUserUserBlocState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<UserBloc>()
                          .add(GetMyUserFromSourcesUserBlocEvent());
                    },
                    child: ProfileDetails(
                      model: state.userModel,
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
