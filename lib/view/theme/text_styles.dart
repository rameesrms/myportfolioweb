import 'package:flutter/material.dart';





 String fontFam = "Lalita";


   TextStyle get lstItemTxt => getstyle(weight:FontWeight.w400,size:12.0,color: Color(0xff474747) );
   // TextStyle get t400_12_2D2D2D => getstyle(weight:FontWeight.w400,size:12.0,color: Color(0xff2D2D2D) );
   // TextStyle get t400_14.copyWith(color: clr6B6B6B) => getstyle(weight:FontWeight.w400,size:14.0,color: Color(0xff6B6B6B) );
   // TextStyle get t400_14_ffffff => getstyle(weight:FontWeight.w400,size:14.0,color: Color(0xffffffff) );
   // TextStyle get t400_14_474747 => getstyle(weight:FontWeight.w400,size:14.0,color: Color(0xff474747) );
   TextStyle get t400_14 => getstyle(weight:FontWeight.w400,size:14.0,);

   TextStyle get t400_16 => getstyle(weight:FontWeight.w400,size:16.0 );
   TextStyle get t400_18 => getstyle(weight:FontWeight.w400,size:18.0 );
   TextStyle get t400_12 => getstyle(weight:FontWeight.w400,size:12.0 );
   TextStyle get t400_10 => getstyle(weight:FontWeight.w400,size:10.0 );
   TextStyle get t400_22 => getstyle(weight:FontWeight.w400,size:22.0 );
   TextStyle get t400_32 => getstyle(weight:FontWeight.w400,size:32.0 );

TextStyle get t500_14 => getstyle(weight:FontWeight.w500,size:14.0);
   TextStyle get t500_18 => getstyle(weight:FontWeight.w500,size:18.0,);
   TextStyle get t500_16 => getstyle(weight:FontWeight.w500,size:16.0,);
   TextStyle get t500_20 => getstyle(weight:FontWeight.w500,size:20.0,);
   TextStyle get t500_22 => getstyle(weight:FontWeight.w500,size:22.0,);
   TextStyle get t500_26 => getstyle(weight:FontWeight.w500,size:26.0,);

   // TextStyle get t500_18 => getstyle(weight:FontWeight.w500,size:18.0,color: Color(0xffffffff),
   //  fontFamily:"Product Sans Medium", );
   TextStyle get t700_19 => getstyle(weight:FontWeight.w700,size:19.0 );
   TextStyle get t700_18 => getstyle(weight:FontWeight.w700,size:18.0 );
   TextStyle get t700_16 => getstyle(weight:FontWeight.w700,size:16.0 );
   TextStyle get t700_14 => getstyle(weight:FontWeight.w700,size:14.0 );
   TextStyle get t700_20 => getstyle(weight:FontWeight.w700,size:20.0,);
   TextStyle get t700_24 => getstyle(weight:FontWeight.w700,size:24.0,);



   TextStyle get appBarTitle => getstyle(weight:FontWeight.w400,size:12.0,color: Color(0xff474747) );
   TextStyle get serachPlaceholder => getstyle(weight:FontWeight.w400,size:12.0,color: Color(0xff474747) );




getstyle({Color? color, required FontWeight weight,  String? fontFamily,required double size,double? height  }){
  return   TextStyle(
      color:  color ?? Color(0xffffffff),
      fontWeight: weight,
      fontFamily:fontFamily ?? fontFam,
      fontStyle:  FontStyle.normal,
      fontSize: size,
      height: height
  );
}


Color get clr2D2D2D => const Color(0xff2D2D2D);
Color get clr6B6B6B => const Color(0xff6B6B6B);
Color get clrffffff => const Color(0xffffffff);
Color get clr474747 => const Color(0xff474747);
Color get clr77838F => const Color(0xff77838F);
Color get clrED1C24 => const Color(0xffED1C24);
Color get clrC11815 => const Color(0xffC11815);
Color get clrF8F8F8 => const Color(0xfff8f8f8);
Color get clr46AE5F => const Color(0xff46AE5F);
Color get clr00A92D => const Color(0xff00A92D);
Color get clrEE2830 => const Color(0xffEE2830);


