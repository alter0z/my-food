import 'package:get/get.dart';
import 'package:my_food/models/cart_model.dart';
import 'package:my_food/models/product_model.dart';
import '../data/repositories/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int,CartModel> _items = {};
  Map<int,CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) => CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExit: true,
          time: DateTime.now().toString()
      ));
    } else {
      _items.putIfAbsent(product.id!, () => CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExit: true,
          time: DateTime.now().toString()
      ));
    }
  }
}