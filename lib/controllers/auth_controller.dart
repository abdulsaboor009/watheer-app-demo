// import 'dart:math';

// import 'package:get/get.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:watheer/models/auth/verify_otp_response.dart';
// import 'package:watheer/services/network_services.dart';
// import 'package:watheer/utils/local_storage.dart';
// import 'package:watheer/utils/server_end_points.dart';
// import 'package:http/http.dart' as http;
// import 'package:watheer_demo/models/auth/verify_otp_response.dart';
// import 'package:watheer_demo/services/network_services.dart';
// import 'package:watheer_demo/utils/local_storage.dart';
// import 'package:watheer_demo/utils/server_end_points.dart';
// import 'package:watheer_demo/utils/smart_loader.dart';

// class AuthController extends GetxController {
//   Future<Map<String, dynamic>> loginUser(
//       {required String countryCode, required String phone}) async {
//     loaderDialogNormal();

//     await Future.delayed(const Duration(seconds: 1));

//     try {
//       http.Response response = await NetworkServices.post(
//         url: '${ServerEndPoints.baseUrl}/${ServerEndPoints.login}',
//         body: {"phone": phone, "country_code": countryCode},
//         header: {},
//       );

//       var decodedJson = NetworkServices.decodeResponse(response);

//       return decodedJson;
//     } catch (_, stack) {
//       print("Error is $_");
//       print("Stack Trace is $stack");
//     } finally {
//       closeLoading();
//     }

//     return {};
//   }

//   late VerifyOTPModel verifyOTPResult;

//   verifyOTP({required String userId, required String otp}) async {
//     loaderDialogNormal();

//     await Future.delayed(const Duration(seconds: 1));

//     try {
//       http.Response response = await NetworkServices.post(
//         url: '${ServerEndPoints.baseUrl}/${ServerEndPoints.verifyOtp}',
//         body: {
//           "user_id": userId,
//           "otp": otp,
//         },
//         header: {},
//       );

//       var decodedJson = NetworkServices.decodeResponse(response);

//       verifyOTPResult = VerifyOTPModel.fromJson(decodedJson);

//       try {
//         String name = verifyOTPResult.data?.name ?? "";
//         if (name.isNotEmpty) LocalStorage.storeKeyValue('name', name);

//         String email = verifyOTPResult.data?.email ?? "";
//         if (email.isNotEmpty) LocalStorage.storeKeyValue('email', email);

//         bool? needIdCard = verifyOTPResult.data?.needIdCard;
//         LocalStorage.storeKeyValue('needIdCard', needIdCard);


//         bool? needRegistration = verifyOTPResult.data?.needRegistration;
//         LocalStorage.storeKeyValue('needRegistration', needRegistration);


//         String token = verifyOTPResult.data?.token ?? "";
//         if (token.isNotEmpty) LocalStorage.storeBearerToken(token);
//       } catch (_) {}

//       try{
//         String exId  = verifyOTPResult.data?.user_external_id??"";
//         OneSignal.login(exId);
//       }catch(_){}

//       return decodedJson;
//     } catch (_, stack) {
//       print("Error is $_");
//       print("Stack Trace is $stack");
//     } finally {
//       closeLoading();
//     }

//     return {};
//   }

//   registerUser(
//       {required String name, required String email, required String id,required String nationality}) async {
//     loaderDialogNormal();

//     await Future.delayed(const Duration(seconds: 1));


//     var random = Random();

//     var externalUserId = random.nextInt(9999999);

//     try {
//       http.Response response = await NetworkServices.post(
//         url: '${ServerEndPoints.baseUrl}/${ServerEndPoints.userRegister}',
//         body: {
//           "id_number": id,
//           "email": email,
//           "name": name,
//           "nationality": nationality,
//           "user_external_id": externalUserId.toString()
//         },
//         header: {},
//       );

//       var decodedJson = NetworkServices.decodeResponse(response);


//       if(response.statusCode == 200){
//         try{
//           OneSignal.login(externalUserId.toString());
//         }catch(_){}


//         try {
//           LocalStorage.storeKeyValue('name', name);

//           LocalStorage.storeKeyValue('email', email);

//           LocalStorage.storeKeyValue('needIdCard', decodedJson['data']['need_id_card']);

//           LocalStorage.storeKeyValue('needRegistration', false);

//         } catch (_) {}
//       }



//       return decodedJson;
//     } catch (_, stack) {
//       print("Error is $_");
//       print("Stack Trace is $stack");
//     } finally {
//       closeLoading();
//     }

//     return {};
//   }
// }
