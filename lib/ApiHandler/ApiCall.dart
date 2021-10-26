import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ApiCall{

 static String baseUrl = 'https://tecmyer.com.au/projects/marked/Api/';

 static Future<http.Response> login(String email, String password) async {
    var response = await http.post(Uri.parse(baseUrl + "signin"),
        body: ({"email": email, "password": password}));
    print("login "+response.toString());
    return response;
  }

  static Future<http.Response> newUserSignup(String fname,String lname,String email,String pass) async {
    var response = await http.post(Uri.parse(baseUrl + "signup"),
        body: ({
          "f_name": fname,
          "l_name":lname,
          "email": email,
          // "phone": phone,
          // "address":address,
          "pass": pass,
        }));

    print("signup "+response.body.toString());
    return response;

  }

  static Future<http.Response> editProfile(String fname,String lname,String email,String bio) async {
    var response = await http.post(Uri.parse(baseUrl + "edit_profile"),
        body: ({
          "userid": MyConstants.id,
          "bio": bio,
          "f_name": fname,
          "l_name":lname,
          "email": email,
        }));

    print("edit_profile "+response.body.toString());
    return response;

  }

 static Future<http.Response> getMyList() async {
   var response = await http.post(Uri.parse(baseUrl + "mylistbyuser"),
       body: ({"userid": MyConstants.id}));
   print("mylistbyuser "+response.toString());
   return response;
 }

 static Future<http.Response> getPeopleToFollow() async {
   var response = await http.post(Uri.parse(baseUrl + "suggested_persons_for_follow"),
       body: ({"userid": MyConstants.id}));
   print("suggested_persons_for_follow "+response.toString());
   return response;
 }

 static Future<http.Response> getMyProfileData() async {
   var response = await http.post(Uri.parse(baseUrl + "userData"),
       body: ({"userid": MyConstants.id}));
   print("userData "+response.toString());
   return response;
 }

 static Future<http.Response> getArticles() async {
   var response = await http.post(Uri.parse(baseUrl + "articles"),
       body: ({"userid": MyConstants.id}));
   print("articles "+response.toString());
   return response;
 }

 static Future<http.Response> followThisPerson(String id) async {
   var response = await http.post(Uri.parse(baseUrl + "follow_single_person"),
       body: ({
         "userid": MyConstants.id,
         "following_person_id": id,
       }));
   print("follow_single_person "+response.toString());
   return response;
 }

 static Future<http.Response> followAll(String ids) async {
   var response = await http.post(Uri.parse(baseUrl + "follow_all"),
       body: ({
         "userid": MyConstants.id,
         "alluser": ids,
       }));
   print("follow_all "+response.toString());
   return response;
 }

 static Future<http.Response> getMyFavourites() async {
   var response = await http.post(Uri.parse(baseUrl + "favourites"),
       body: ({"userid": MyConstants.id}));
   print("favourites "+response.toString());
   return response;
 }

 static Future<http.Response> getHighlights() async {
   var response = await http.post(Uri.parse(baseUrl + "highlight"),
       body: ({"userid": MyConstants.id}));
   print("highlight "+response.toString());
   return response;
 }

 static Future<http.Response> getVideos() async {
   var response = await http.post(Uri.parse(baseUrl + "allvideosList"),
       body: ({"userid": MyConstants.id}));
   print("allvideosList "+response.toString());
   return response;
 }

 static Future<http.Response> getNonHighlights() async {
   var response = await http.post(Uri.parse(baseUrl + "non_highlight"),
       body: ({"userid": MyConstants.id}));
   print("non_highlight "+response.toString());
   return response;
 }

 static Future<http.Response> getAllData() async {
   var response = await http.post(Uri.parse(baseUrl + "allDataList"),
       body: ({"userid": MyConstants.id}));
   print("allDataList "+response.toString());
   return response;
 }

 static Future<http.Response> addThisArticle(String id) async {
   var response = await http.post(Uri.parse(baseUrl + "Add_in_highlight"),
       body: ({"userid": MyConstants.id,"data_row_id":id}));
   print("Add_in_highlight "+response.toString());
   return response;
 }

 static Future<http.Response> deleteThisArticle(String id) async {
   var response = await http.post(Uri.parse(baseUrl + "delete_item"),
       body: ({"userid": MyConstants.id,"id":id}));
   print("delete_item "+response.toString());
   return response;
 }

 static Future<http.Response> getArchiveDataList() async {
   var response = await http.post(Uri.parse(baseUrl + "archiveDataList"),
       body: ({"userid": MyConstants.id}));
   print("archiveDataList "+response.toString());
   return response;
 }

 static Future<http.Response> getTagedDataList() async {
   var response = await http.post(Uri.parse(baseUrl + "tagedDataList"),
       body: ({"userid": MyConstants.id}));
   print("tagedDataList "+response.toString());
   return response;
 }

 static Future<http.Response> getNonTagedDataList() async {
   var response = await http.post(Uri.parse(baseUrl + "nontagedDataList"),
       body: ({"userid": MyConstants.id}));
   print("nontagedDataList "+response.toString());
   return response;
 }

 static Future<http.Response> getAllTags() async {
   var response = await http.post(Uri.parse(baseUrl + "get_all_tags"),
       body: ({"userid": MyConstants.id}));
   print("get_all_tags "+response.toString());
   return response;
 }

 static Future<http.Response> getBeautyList() async {
   var response = await http.post(Uri.parse(baseUrl + "beautyList"),
       body: ({"userid": MyConstants.id}));
   print("beautyList "+response.toString());
   return response;
 }

 static Future<http.Response> getTrendList() async {
   var response = await http.post(Uri.parse(baseUrl + "trendList"),
       body: ({"userid": MyConstants.id}));
   print("trendList "+response.toString());
   return response;
 }
 static Future<http.Response> getAllDataOfApp() async {
   var response = await http.post(Uri.parse(baseUrl + "allitem_list"));
   print("allitem_list "+response.toString());
   return response;
 }

 static Future<http.Response> getNotifications() async {
   var response = await http.post(Uri.parse(baseUrl + "follow_notification"),
       body: ({"userid": MyConstants.id}));
   print("follow_notification "+response.toString());
   return response;
 }

 static Future<http.Response> changePassword(String password, String newPassword) async {
   var response = await http.post(Uri.parse(baseUrl + "changepass"),
       body: ({
         "userid": MyConstants.id,
         "old_pass": password,
         "new_pass": newPassword,
       }));
   print("changepass "+response.toString());
   return response;
 }

 static Future<http.Response> addTagsToThis(String id,String tags) async {
   var response = await http.post(Uri.parse(baseUrl + "add_tags"),
       body: ({
         "userid": MyConstants.id,
         "data_row_id": id,
         "tags": tags,
       }));
   print("add_tags "+response.toString());
   return response;
 }

 static Future<http.Response> addInFavourite(String id) async {
   var response = await http.post(Uri.parse(baseUrl + "Add_in_fav"),
       body: ({
         "userid": MyConstants.id,
         "data_row_id": id,
       }));
   print("Add_in_fav "+response.toString());
   return response;
 }

 static Future<http.Response> refreshItem(String id) async {
   var response = await http.post(Uri.parse(baseUrl + "allDataofsinglerow"),
       body: ({
         "userid": MyConstants.id,
         "data_row_id": id,
       }));
   print("allDataofsinglerow "+response.toString());
   return response;
 }


//  static Future<http.Response> updateUserProfile(String fname,String lname,String email,String phone,String language,String password) async {
//    var response = await http.post(baseUrl + "update_profile",
//        body: ({
//          "userid": MyConstants.id,
//          "fname": fname,
//          "lname": lname,
//          "email": email,
//          "phone": phone,
//          "language": language,
//          "password": password,
//        }));
//    print('update_profile '+response.body.toString());
//    return response;
//  }

  static Future<http.Response> fbLogin(String id,String fname,String lname,String email,String image) async {
    var response = await http.post(Uri.parse(baseUrl + "login_withfb"),
        body: ({
          "oauthid": id,
          "f_name": fname,
          "l_name": lname,
          "email": email,
          "picture": image,
        }));
    print('fb_login '+response.body.toString());
    return response;
  }

//  static Future<http.Response> getUserProfile() async {
//    var response = await http.post(baseUrl + "profile",
//        body: ({
//          "userid": MyConstants.id,
//        }));
//    print('profile '+response.body.toString());
//    return response;
//  }


  static Future<String> uploadProfilePicture(Asset file) async {

    MultipartFile image;
    var uri = Uri.parse(baseUrl + "update_picture");

    var request = new http.MultipartRequest("POST", uri);

    ByteData byteData = await file.getByteData();
    List<int> imageData = await testComporessList(byteData.buffer.asUint8List());

    MultipartFile multipartFile = MultipartFile.fromBytes(
      'picture',
      imageData,
      filename: file.name,
      contentType: MediaType("image", "png"),
    );

    image=multipartFile;

    request.fields['userid'] = MyConstants.id;
    request.files.add(image);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("update_picture: " + responseString);
      // DioResponse detail = DioResponse.fromJson(jsonDecode(responseString));
      return responseString;
    }else{
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("update_picture: " + responseString);
      return responseString;
    }

  }

}

Future<Uint8List> testComporessList(Uint8List list) async {
  var result = await FlutterImageCompress.compressWithList(
    list,
    quality: 20,
  );
  print(list.length);
  print(result.length);
  return result;
}
