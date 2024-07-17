import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entites/products_entity/ProductEntity.dart';
import '../repository_contract/products_repo.dart';
@injectable
class ProductsUseCase{
  ProductsRepo productsRepo;
  @factoryMethod
  ProductsUseCase(this.productsRepo);
  Future<Either<List<ProductEntity>,String>> call()=>productsRepo.getProducts();
}