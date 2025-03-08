
import 'dart:ffi';


import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/constants.dart';
import '../theme/text_styles.dart';
import '../widgets/common_widgets.dart';



class SuccessScreen extends StatelessWidget {

  SuccessScreen();

  // Route NavigateHome() {
  @override
  Widget build(BuildContext context) {





    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.light,
        // statusBarColor: Colors.primaryblue,
        statusBarIconBrightness: Brightness.dark// Status bar color
    ));

    return LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;
          return SafeArea(
            child: Scaffold(
              // extendBody: true,
              backgroundColor:Colors.white,
//               appBar: sW.appBarWidget(title: "", height: h10p, width: w10p, fn: (){
// Navigator.pop(context);
//               }),
              body:  Padding(
                padding: EdgeInsets.symmetric(horizontal: w1p*4),
                child: Center(
                  child: Entry(yOffset: 10,
                    // scale: 20,
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    verticalSpace(8),
                        Entry(scale: 1.5,opacity: 0.9,
                          // scale: 20,
                          delay: const Duration(milliseconds: 10),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          child: SizedBox(
                              width: 150,
                              child: Image.asset('assets/images/success-icon.png')),
                        ),
                        verticalSpace(8),

                        Entry(yOffset: 120,
                          // scale: 1.1,opacity: 0.9,
                          // scale: 20,
                          delay: const Duration(milliseconds: 10),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          child: Column(
                            children: [
                              Text("Sales Updated\nSuccessfully",style: t700_24.copyWith(color: clrED1C24,height: 1.1),
                                textAlign: TextAlign.center,),
                              verticalSpace(8),

                              Entry(yOffset: -1,
                                // scale: 1.1,
                                opacity: 0.0,
                                // scale: 20,
                                delay: const Duration(milliseconds: 2500),
                                duration: const Duration(milliseconds: 2000),
                                curve: Curves.easeIn,
                                child: Column(
                                  children: [
                                    Text("now",style: t400_14.copyWith(color: clr474747),
                                      textAlign: TextAlign.center,),
                                    verticalSpace(12),

                                    Container(
                                      width: maxWidth,
                                      margin:EdgeInsets.symmetric(horizontal: w1p*2,vertical: 0),
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                                      child:
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          verticalSpace(8),

                                        ],),
                                    ),
                                    verticalSpace(18),
                                    verticalSpace(38),

                                    GestureDetector(onTap: (){
                                      Navigator.pop(context);

                                    },
                                      child: Container(decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [boxShadowUnSelected]
                                          ,color: Colors.white
                                      ),child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                                        child: Text("Close",style:t400_16.copyWith(color: clr77838F)),
                                      ),),
                                    ),
                                  ],
                                ),
                              ),





                              verticalSpace(8),


                            ],
                          ),
                        ),





                          //
                          // sW.appBtn(btnText: "Close Sale",onTap: (){
                          //   Navigator.push(context, MaterialPageRoute(builder: (_)=>SuccessScreen()));
                          //
                          // }),
                          // verticalSpace(8),


                      ],
                    ),
                  ),
                ),
              ),




            ),
          );

        }
    );
  }
}




