import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/repostories/location_repositories.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/location_cubit/location_cubit_state.dart';
import 'package:bloc/bloc.dart';

class LocationCubit extends Cubit<LocationCubitState> {
  final LocationRepositories _repositories = getIt<LocationRepositories>();
  LocationCubit() : super(InitialLocationCubitState());

  void getMyLocation() async {
    emit(LoadingLocationCubitState());
    final location = await _repositories.getMyLocation();
    if (location == null) {
      emit(ErrorLocationCubitState(
          message: "Sorry,we could not find your address"));
    } else {
      emit(LoadedLocationCubitState(point: location));
    }
  }
}
