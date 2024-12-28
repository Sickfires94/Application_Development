

import 'package:first_app/Services/JuiceService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class JuiceEvent {}
class fetchJuice extends JuiceEvent{}

abstract class JuiceState {}
class JuiceInitial extends JuiceState{}
class JuiceLoading extends JuiceState{}

class JuiceLoaded extends JuiceState{
  final Juice juice;
  JuiceLoaded(this.juice);
}

class JuiceError extends JuiceState{
  final String error;
  JuiceError(this.error);
}

class JuiceBloc extends Bloc<JuiceEvent, JuiceState> {
  JuiceBloc() : super(JuiceInitial()){
    on<fetchJuice> (_onFetchJuices);
  }

  Future<void> _onFetchJuices(
      fetchJuice event,
      Emitter<JuiceState> emit
      ) async {
    emit(JuiceLoading());
    Juice? juice = await JuiceService.getData();
    print(juice?.name);
    emit(JuiceLoaded(juice!));
}
}



