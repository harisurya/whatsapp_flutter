import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_flutter/models/models.dart';
import 'package:whatsapp_flutter/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserInitial userInitial) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserWhatsapp user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is SignOut) {
      await Authservices.signOut();
      yield UserInitial();
    } else if (event is UpdateUser) {
      UserWhatsapp updatedUser = (state as UserLoaded).user.copyWith(
          name: event.name,
          profilePicture: event.imageProfileURL,
          gender: event.gender);

      UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    }
  }
}
