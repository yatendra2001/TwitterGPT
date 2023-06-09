// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:twitter_gpt/utils/session_helper.dart';
import '../../repositories/authentication/auth_repo.dart';

part 'app_init_event.dart';
part 'app_init_state.dart';

class AppInitBloc extends Bloc<AppInitEvent, AppInitState> {
  final AuthRepository _authRepository;
  late StreamSubscription<auth.User?> _userSubscription;

  AppInitBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AppInitState.unknown()) {
    _userSubscription =
        _authRepository.user.listen((user) => add(AuthUserChanged(user: user)));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  @override
  Stream<AppInitState> mapEventToState(AppInitEvent event) async* {
    if (event is AuthUserChanged) {
      yield* _mapAuthUserChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      await _authRepository.logOut();
    }
  }

  Stream<AppInitState> _mapAuthUserChangedToState(
      AuthUserChanged event) async* {
    yield AppInitState.loading();
    if (event.user != null) {
      SessionHelper.displayName = event.user!.displayName;
      SessionHelper.phone = event.user!.phoneNumber;
      SessionHelper.uid = event.user!.uid;
      SessionHelper.bearerToken = await event.user!.getIdToken();
      // log('bearer token: ${SessionHelper.bearerToken}');
      yield AppInitState.authenticated(user: event.user!);
    } else {
      yield AppInitState.unauthenticated();
    }
  }
}
