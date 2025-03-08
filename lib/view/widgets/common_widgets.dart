
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/text_styles.dart';



class SmallWidgets  {




  menuText(title){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,style: t400_14,),
    );

  }



  Widget cachedImg(String img,{String? placeholderImage,BoxFit? fit}) {
    return CachedNetworkImage(fit:fit?? BoxFit.cover,
        // fit: widget.fit,
        imageUrl:StringConstants.imgBaseUrl+img,
        placeholder: (context, url) =>
            Opacity(opacity:0.5,child: Image.asset(placeholderImage??"assets/images/no-image-placeholder.png",)),
        errorWidget: (context, url, error) =>
            Image.asset(placeholderImage ?? "assets/images/no-image-placeholder.png",fit: BoxFit.cover,)
    );
  }


  Widget appBtn({required String btnText,required Function onTap, bool? isSmall}) {

    TextStyle fontStyle = isSmall==true? t400_16 : t500_18;


    return GestureDetector(onTap: (){
      onTap();
    },
      child: Container(height:isSmall==true?40: 50,margin: EdgeInsets.all(isSmall==true?0:4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(isSmall==true?10:12),
            boxShadow: [boxShadowUnSelected],
            color: Colours.primaryRed
        ),
        child: Center(child: Text(btnText,style:
        fontStyle.copyWith(color: clrffffff)

          ,)),),
    )
    ;
  }

  Widget appBtn2({required String btnText,required Function onTap,bool? isSmall}) {
    TextStyle fontStyle=isSmall==true? t400_16 : t500_18;

    return GestureDetector(onTap: (){
      onTap();
    },
      child: Container(height: isSmall==true?40:50,margin: EdgeInsets.all(isSmall==true?0:4),
        decoration: BoxDecoration(

            border: Border.all(color: Colours.primaryRed),
            borderRadius: BorderRadius.circular(isSmall==true?10:12),
            boxShadow: [boxShadowUnSelected],
            color: Colors.white
        ),
        child: Center(child: Text(btnText,style: fontStyle.copyWith(color: clrED1C24),)),),
    )
    ;
  }



}




verticalSpace(double size) {
  return SizedBox(height: size);
}

horizontalSpace(double size) {
  return SizedBox(width: size);
}


