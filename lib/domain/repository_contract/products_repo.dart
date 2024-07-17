
import 'package:dartz/dartz.dart';
import 'package:task/domain/entites/products_entity/ProductEntity.dart';
abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>>getProducts();
}