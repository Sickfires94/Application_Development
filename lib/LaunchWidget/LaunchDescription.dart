import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LaunchDescriptionBloc.dart';

class LaunchDescription extends StatelessWidget{

  final String description;
  LaunchDescription({required this.description});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => LaunchDescriptionBloc(description)..add(ShowLess()),
        child: Description()
    );

      // if (!_show) {
      //   return Column(children: [
      //     Text(widget.description, overflow:TextOverflow.ellipsis),
      //     Row(
      //       textDirection: TextDirection.rtl,
      //       children: [TextButton(
      //         onPressed: () => {
      //         setState(() {
      //           _show = true;
      //         })},
      //
      //         style: ButtonStyle(
      //             backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade200),
      //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //                 RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(50.0),
      //                     //side: BorderSide(color: Colors.red),
      //
      //                 )
      //             )
      //         ),
      //
      //         child: Row(
      //           textDirection: TextDirection.rtl,
      //           children:[
      //             Icon(Icons.arrow_downward, size: 30.0,color: Colors.blue),
      //             Text("More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      //           ],),
      //     )]),
      //   ]);
      // }
      // return Column(children: [
      //   Text(widget.description),
      //   Row(
      //   textDirection: TextDirection.rtl,
      //   children: [
      //   TextButton(onPressed: () => {
      //     setState(() {
      //       _show = false;
      //     })
      //
      //   },
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade200),
      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //             RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(50.0),
      //               //side: BorderSide(color: Colors.red),
      //
      //             )
      //         )
      //     ),
      //     child: Row(
      //       textDirection: TextDirection.rtl,
      //       children:[
      //         Icon(Icons.arrow_upward, size: 30.0, color: Colors.blue),
      //         Text("Less"),
      //       ],),
      //   )]),
      // ]);
    }
}

class Description extends StatelessWidget{

  Widget build(BuildContext context) {
    return BlocBuilder<LaunchDescriptionBloc, DescriptionState>(
        builder: (context, state) {
          if (state is DescriptionTrimmed) {
            return Column(children: [
              Text(state.description, overflow: TextOverflow.ellipsis),
              Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    TextButton(
                      onPressed: () =>
                          context.read<LaunchDescriptionBloc>().add(ShowMore()),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.grey.shade200),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                //side: BorderSide(color: Colors.red),

                              )
                          )
                      ),

                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(Icons.arrow_downward, size: 30.0,
                              color: Colors.blue),
                          Text("More", style: TextStyle(color: Colors.blue,
                              fontWeight: FontWeight.bold),),
                        ],),
                    )
                  ]),
            ]);
          } else if (state is DescriptionShowed) {
            return Column(children: [
              Text(state.description),
              Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    TextButton(
                      onPressed: () =>
                          context.read<LaunchDescriptionBloc>().add(ShowLess()),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.grey.shade200),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                //side: BorderSide(color: Colors.red),

                              )
                          )
                      ),

                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(Icons.arrow_upward, size: 30.0,
                              color: Colors.blue),
                          Text("More", style: TextStyle(color: Colors.blue,
                              fontWeight: FontWeight.bold),),
                        ],),
                    )
                  ]),
            ]);
            return const Center(child: Text("Press button to fetch Products"));
          }
          return Text("Error");
        }
    );
  }

}