import 'package:dartz/dartz.dart';

import '../../model/products/ProductsResponse.dart';

abstract class ProductsDataSource{
  Future<Either<ProductsResponse,String>>getProducts();
}