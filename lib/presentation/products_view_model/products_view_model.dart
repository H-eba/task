import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/domain/use_case/product_use_case.dart';

import '../../domain/entites/products_entity/ProductEntity.dart';
@injectable
class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  static ProductsTabViewModel get(context) => BlocProvider.of(context);
  @factoryMethod
  ProductsTabViewModel(this.productsUseCase) : super(ProductsTabInitialState());
  ProductsUseCase productsUseCase;




  getProducts()async{
    if(!isClosed){
      emit(ProductsLoadingState());
    }

    var result=await productsUseCase.call();
    result.fold((products) {
      if(!isClosed){
        emit(ProductsSuccessState(products));
      }

    }
        , (error) {
          if(!isClosed){
            emit(ProductsErorrState(error));
          }

        });
  }
}

abstract class ProductsTabStates {}
class ProductsTabInitialState extends ProductsTabStates{}
class ProductsLoadingState extends ProductsTabStates {}
class ProductsSuccessState extends ProductsTabStates {
  List<ProductEntity>products;
  ProductsSuccessState(this.products);
}
class ProductsErorrState extends ProductsTabStates {
  String error;
  ProductsErorrState(this.error);
}

