import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc_state.dart';
import 'package:bloc/bloc.dart';

class MainPageBloc extends Cubit<MainPageBlocState> {
  MainPageBloc()
      : super(
          LoadedScreenIndexMainPageBlocState(
            index: 0,
          ),
        );

  void selectScreen(int index){
    emit(LoadedScreenIndexMainPageBlocState(index: index));
  }
}
