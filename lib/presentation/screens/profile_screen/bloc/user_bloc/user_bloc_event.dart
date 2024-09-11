import 'package:bazar/data/models/user_model.dart';

sealed class UserBlocEvent {}

final class GetMyUserUserBlocEvent extends UserBlocEvent {}

final class GetMyUserFromSourcesUserBlocEvent extends UserBlocEvent {}

final class EditUserBlocEvent extends UserBlocEvent {
  UserDetails model;

  EditUserBlocEvent({
    required this.model,
  });
}
