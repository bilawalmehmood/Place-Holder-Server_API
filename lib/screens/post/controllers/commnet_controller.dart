import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/enum/snack_bar_message.dart';
import 'package:rest_api_flutter/helper/rest_api.dart';
import 'package:rest_api_flutter/models/post_model.dart';
import 'package:rest_api_flutter/widgets/globel_widgets.dart';

class CommnetController extends GetxController {
  RxList<dynamic> comments = RxList<dynamic>([]);

  void fetchComments(PostModel post) async {
    final List<dynamic> commentList =
        await ApiServices.getAPi(endPointUrl: "comments");
    if (commentList.isEmpty) {
      showSnackbar(SnackbarMessage.missing,
          "comments are not loaded due to url not working");
    } else {
      for (var element in commentList) {
        if (element['postId'] == post.id) {
          commentList.add(element);
        }
      }
      comments.value = commentList;
    }
  }
}
