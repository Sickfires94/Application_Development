import 'dart:convert';

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'launch_model.dart';

abstract class LaunchEvent {}
class FetchLaunches extends LaunchEvent{}

abstract class LaunchState{}
class LaunchInitial extends LaunchState{}
class LaunchLoading extends LaunchState{}

class LaunchLoaded extends LaunchState{
  final List<Launch> launch;
  LaunchLoaded(this.launch);
}

class LaunchError extends LaunchState{
  final String error;
  LaunchError(this.error);
}

class LaunchBloc extends Bloc<LaunchEvent, LaunchState>{
  LaunchBloc() : super(LaunchInitial()){
    on<FetchLaunches>(_onFetchLaunches);
  }

  Future<void> _onFetchLaunches(
      FetchLaunches event,
      Emitter<LaunchState> emit,
      ) async {
    emit(LaunchLoading());
    try{
        final response = await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));
        if(response.statusCode == 200){
          List data = jsonDecode(response.body);
          final launches =  data.map((launch) => Launch.fromJson(launch)).toList();
        emit(LaunchLoaded(launches));
      }
      else throw Exception("Failed to load posts");
    }
    catch (e){
      emit(LaunchError('Error: $e'));
    }
  }
}