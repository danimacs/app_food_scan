import 'package:app_food_scan/data/product_dao.dart';

import '../mvc/models/product_model.dart';

class ProductService {
  final ProductDAO productDAO;

  ProductService(this.productDAO);

  Future<List<ProductModel>> index() async {
    final List<Map<String, dynamic>> maps = await productDAO.read();
    return List.generate(maps.length, (index) => ProductModel(idProduct: maps[index][ProductModel.idProductColumn]));
  }

  Future<ProductModel> create(ProductModel product) async {
    await productDAO.create(product);
    return product;
  }
}
