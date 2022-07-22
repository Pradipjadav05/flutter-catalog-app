import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModels catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
