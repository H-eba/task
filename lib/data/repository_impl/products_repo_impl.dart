import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entites/products_entity/ProductEntity.dart';
import '../../domain/repository_contract/products_repo.dart';
import '../dao/data_source_contract/products_data_source.dart';
import '../model/products/ProductsResponse.dart';
@Injectable(as:ProductsRepo )
class ProductsRepoImpl implements ProductsRepo{
  ProductsDataSource apiDataSource;
  ProductsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts() async{

    var results=await apiDataSource.getProducts();
    return results.fold((response) {
      List<ProductModel>productModelList=response.data??[];
      List<ProductEntity>productEintityList=productModelList.map((productModel) => productModel.toProductEntity()).toList();
      return Left(productEintityList);
    }, (error)
    {
      return Right(error.toString());
    });
  }

}