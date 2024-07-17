import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/api_manager/end_point/end_point.dart';

import '../../../core/api_manager/api_manager.dart';
import '../../model/products/ProductsResponse.dart';
import '../data_source_contract/products_data_source.dart';
@Injectable(as:ProductsDataSource )
class ProductsDataSourceImpl implements ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDataSourceImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProducts() async{
    try{
      var response=await apiManager.getRequest(endPoint:EndPoints.productsEndPoint,

      );
      return Left(ProductsResponse.fromJson(response.data));

    }catch(error){
      return Right(error.toString());
    }

  }

}