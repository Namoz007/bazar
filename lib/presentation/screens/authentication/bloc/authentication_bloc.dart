import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/repostories/authentication_repositories.dart';
import 'package:bazar/presentation/screens/authentication/bloc/authentication_bloc_event.dart';
import 'package:bazar/presentation/screens/authentication/bloc/authentication_bloc_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final _repositories = getIt<AuthenticationRepositories>();

  AuthenticationBloc() :
        super(InitialAuthenticationBlocState()) {
    on<LoggedUserAuthenticationBlocEvent>(_userLogged);
    on<SignUpUserAuthenticationBlocEvent>(_registerUser);
    on<LoginUserAuthenticationBlocEvent>(_loginUser);
    on<ResetPasswordUserAuthenticationBlocEvent>(_resetPassword);
  }

  void _loginUser(LoginUserAuthenticationBlocEvent event,emit) async{
    emit(LoadingAuthenticationBlocState());
    final response = await _repositories.loginUser(event.model);
    if(response == null){
      final userdata = await _repositories.getUser();
      if(userdata){
        emit(AuthenticatedUserAuthenticationBlocState());
      }else{
        emit(ErrorAuthenticationBlocState(message: "Something went wrong!"));
      }
    }else{
      emit(ErrorAuthenticationBlocState(message: response));
    }
  }

  void _resetPassword(ResetPasswordUserAuthenticationBlocEvent event,emit) async{
    emit(LoadingAuthenticationBlocState());
    _repositories.resetPasswordForEmail(event.email);
    emit(ErrorAuthenticationBlocState(message: "Message has been sent to your email"));
  }

  void _userLogged(LoggedUserAuthenticationBlocEvent event,emit) async{
    emit(LoadingAuthenticationBlocState());
    final _response = await _repositories.userLogged();
    if(_response){
      await _repositories.getUser();
      emit(AuthenticatedUserAuthenticationBlocState());
    }else{
      emit(UnAuthenticatedUserAuthenticationBlocState());
    }
  }

  void _registerUser(SignUpUserAuthenticationBlocEvent event,emit) async{
    emit(LoadingAuthenticationBlocState());
    final _reponse = await _repositories.registerUser(event.model);
    if(_reponse == null){
      emit(AuthenticatedUserAuthenticationBlocState());
    }else{
      emit(ErrorAuthenticationBlocState(message: _reponse));
    }
  }
}
