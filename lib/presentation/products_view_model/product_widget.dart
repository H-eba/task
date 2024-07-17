
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/utils/assets_manager.dart';
import 'package:task/core/utils/string_manager.dart';


import '../../domain/entites/products_entity/ProductEntity.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     width:239,
     height:220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              width: 2.w,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3))),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productEntity.thumbnail?? '',
                    width: 191.w,
                    height: 120.h,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 30.sp,
                    ),
                  ),
                ),

               SvgPicture.asset(
                  AssetsManager.whishSelected,
                  height: 30.h,
                  width: 30.w,
                )
              ],
            ),

                SizedBox(
                  height: 8.h,
                ),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  '${productEntity.title }\n\n '??'',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
               productEntity.price==null?
               Text(
                 'EGP ${productEntity.price}',
                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                     fontWeight: FontWeight.w400, fontSize: 14.sp),
               )
                   : Row(
                  children: [
                    Text(
                      'EGP ${productEntity.price}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14.sp),
                    ),
                    SizedBox(width: 13.w,),
                    Text(
                      '${productEntity.price} EGP',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.solid),

                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(width: 191.w,
                  child: Row(children: [
                    Text('${StringManager.review} (${productEntity.rating})',
                    style:Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp),),
                    SvgPicture.asset(
                      AssetsManager.starIcon,
                      height: 15.h,
                      width: 15.w,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      AssetsManager.plusIcon,
                      height: 30.h,
                      width: 30.w,
                    )



                  ],),
                ),



              ],
            ),
      )

    );
  }
}
