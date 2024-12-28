import 'package:first_app/Services/JuiceService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/JuiceBloc.dart';
import 'JuiceCard.dart';

class homeScreenWidget extends StatelessWidget{

  Widget build(BuildContext context) {
    return BlocBuilder<JuiceBloc, JuiceState>(builder: (context, state) {
      if(state is JuiceInitial){
        context.read<JuiceBloc>().add(fetchJuice());
      }
        if (state is JuiceLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        if (state is JuiceLoaded) {
          return JuiceCard(juice: state.juice);
        }
        return Center(child: CircularProgressIndicator(),);
    });
  }

}