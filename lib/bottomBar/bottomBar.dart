import 'package:first_app/bottomBar/bottomBarBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(color: Colors.purple, size: 35),
      selectedItemColor: Colors.purple,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),

      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
      showUnselectedLabels: false,
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 14.0),

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.0,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30,),
          label: 'Resume',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined, size: 30,),
          label: 'Settings',
        ),
      ],
      currentIndex: _getSelectedIndex(context),
      //New
      onTap: (int index){
        if(index == 0){
          print("0 pressed");
          context.read<bottomBarBloc>().add(homeSwitch());
        }
        else if(index == 1){
          print("1 pressed");
          context.read<bottomBarBloc>().add(screen2Switch());
        }
        else{
          print("2 pressed");
          context.read<bottomBarBloc>().add(screen3Switch());
        }
      },

      );
  }

  int _getSelectedIndex(BuildContext context){
    bottomBarState state = context.watch<bottomBarBloc>().state;
    if(state is homeScreen){
      print("returning 0");
      return 0;
    }
    if (state is screen2){
      print("returning 1");
      return 1;
    }
    if (state is screen3){
      print("returning 2");
      return 2;
    }
    print("returning default");
    return 0;
  }

}
