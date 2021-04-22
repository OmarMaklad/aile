// import 'package:flutter/material.dart';
//
//
// class ResendSubmit extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<ResendCubit,ResendState>(
//       listener: (_,state){
//         if(state is ResendErrorState )
//           Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14
//             ),)));
//         if(state is ResendSuccessState ){
//
//         }
//       },
//       builder: (context,state){
//         final cubit = ResendCubit.get(context);
//         return state is ResendLoadingState ? Center(
//           child: SpinKitChasingDots(
//             size: 40,
//             color: kPrimaryColor,
//           ),
//         ) :   SmallButton(
//           onPressed: (){
//             cubit.resend();
//           }, title: LocaleKeys.resend.tr(),);
//
//       },
//     );
//   }
// }
