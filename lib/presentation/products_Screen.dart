import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/presentation/products_view_model/product_widget.dart';
import 'package:task/presentation/products_view_model/products_view_model.dart';

import '../core/DI/di.dart';
import '../core/utils/assets_manager.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt.get<ProductsTabViewModel>()..getProducts(),
      child: Scaffold(
        appBar: AppBar(

title: SvgPicture.asset(
  AssetsManager.logo,
  height: 30.h,
  width: 30.w,
),

        ),
        body: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 5.h),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xFF004182)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xFF004182)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF06004E),
                    ),
                    hintText: 'what do you search for?',
                    hintStyle: TextStyle(
                      color: Color(0x9906004E),
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    )),
              ),
              SizedBox(width: 15.w,),
              SizedBox(height: 30,),
              BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
                buildWhen: (previous, current) {
                  if(current is ProductsErorrState || current is ProductsLoadingState
                      ||current is ProductsSuccessState){
                    return true;
                  }return false;
                },
                builder: (context, state) {
                  if (state is ProductsSuccessState){
                    return Expanded(
                        child:  GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                            childAspectRatio: 2/2.5
                          ),
                          itemBuilder: (context, index) =>

                              InkWell(

                                  child: ProductWidget(productEntity:state.products[index] )),
                          itemCount: state.products.length,)
                    );
                  }if(state is ProductsErorrState){
                    return Center(child: Text(state.error),);
                  }return Center(child: CircularProgressIndicator(),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
