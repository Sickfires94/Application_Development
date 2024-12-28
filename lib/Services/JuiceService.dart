import 'package:cloud_firestore/cloud_firestore.dart';

class JuiceService{
  static final CollectionReference _collectionRef = FirebaseFirestore.instance.collection('JuiceProduct');

  static Future<Juice?> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    print("Received Data");
    // Get data from docs and convert map to List
    List<Juice?> allData = querySnapshot.docs.map((doc) => Juice.fromJson(doc)).toList();
    print("***************** DATA *******************");
    print(allData[0]?.name);
    return allData[0];
  }
}

class Juice {
  String? name;
  String? Description;
  String? deliveryTime;
  String? imageURL;
  num? price;
  num? review;
  num? reviewCount;
  String? weight;

  Juice({
    required this.name,
    required this.Description,
    required this.deliveryTime,
    required this.imageURL,
    required this.price,
    required this.review,
    required this.reviewCount,
    required this.weight
  });

  Juice.fromJson(QueryDocumentSnapshot<Object?> json) {
    this.name = json['name'];
    this.Description = json['Description'];
    this.deliveryTime = json['deliveryTime'];
    this.imageURL = json['imageURL'];
    this.price = json['price'];
    this.review = json['review'];
    this.reviewCount = json['reviewCount'];
    this.weight = json['weight'];
  }
}