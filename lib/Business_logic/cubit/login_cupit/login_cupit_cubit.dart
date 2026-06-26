import 'package:app_fixed/data/repository/users_rebository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_cupit_state.dart';

class LoginCupitCubit extends Cubit<LoginCupitState> {
  LoginCupitCubit(this.userRebository) : super(LoginCupitInitial());

  final UsersRebository userRebository;

  void login(Map<String, dynamic> loginBody) async {
    emit(LoginLoading());

    try {
      final login = await userRebository.login(loginBody);
      emit(LoginSuccess(login));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
