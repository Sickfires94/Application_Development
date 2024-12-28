
import 'package:first_app/bottomBar/screenEnums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class bottomBarEvent{}
class homeSwitch extends bottomBarEvent{}
class screen2Switch extends bottomBarEvent{}
class screen3Switch extends bottomBarEvent{}

abstract class bottomBarState{}
class homeScreen extends bottomBarState{}
class screen2 extends bottomBarState{}
class screen3 extends bottomBarState{}

enum screens{
  home, screen2, screen3
}

class bottomBarBloc extends Bloc<bottomBarEvent, bottomBarState>{
  screens _screen;

  bottomBarBloc() : _screen = screens.home, super(homeScreen()){
    on<homeSwitch>(_homeSwitch);
    on<screen2Switch>(_screen2Switch);
    on<screen3Switch>(_screen3Switch);
  }

  void _homeSwitch(homeSwitch event, Emitter<bottomBarState> emit) {
    _screen = screens.home;
    emit(homeScreen());
  }

  void _screen2Switch(screen2Switch event, Emitter<bottomBarState> emit) {
    _screen = screens.screen2;
    emit(screen2());
  }

  void _screen3Switch(screen3Switch event, Emitter<bottomBarState> emit) {
    _screen = screens.screen3;
    emit(screen3());
  }



}

