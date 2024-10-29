import 'package:first_app/ProductBloc.dart';
import 'package:first_app/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc()..add(FetchProducts()),
        child: ProductScreen()
      )
      //home: ProductsList(),
    );
  }
}

class ProductScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state){
            if (state is ProductLoading){
              return Center(child: CircularProgressIndicator(),);
             // return const SkeletonList extends statelessWidget();
            } else if (state is ProductLoaded){
              List<Product> products = state.products;
              return ProductList(products: products);
            } else if (state is ProductError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text("Press button to fetch Products"));
          })
    );
  }
}


class ProductList extends StatelessWidget{
  final List<Product> products;
  ProductList({required this.products});

  Widget build(BuildContext context){
    return ListView.builder(
      // the number of items in the list
        itemCount: products.length,

        // display each item of the product list
        itemBuilder: (context, index) {
          return Card(
            // In many cases, the key isn't mandatory
            key: ValueKey(products[index]),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      products[index].thumbnail),
                ),
                title: Text(products[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text((products[index].description), overflow: TextOverflow.ellipsis,),
                  Text((products[index].price.toString()), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold), ),
                ],)
            ),
          );
        });
  }
}

