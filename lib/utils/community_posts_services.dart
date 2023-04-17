import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/post_model.dart';

import '../routes.dart';

class CommunityPostsServices {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://hershield-backend-production.up.railway.app/api/posts',
  ));

  Future<bool> updatePost({
    required String userId,
    required String postId,
    required String updatedText,
  }) async {
    try {
      final response = await dio.post(
        '/updatepost/$userId/$postId',
        data: updatedText,
      );
      print(response.data);
      return response.data['result'] as bool;
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
      return false;
    }
  }

  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await dio.get(
        '/allposts',
      );
      print(response.data);
      final List<PostModel> postList = [];
      for (var element in (response.data['post'] as List)) {
        final model = PostModel(
          postId: element['_id'],
          userId: element['userId'],
          postTitle: element['title'],
          postData: element['caption'],
          likesCount: 0,
          commentCount: 0,
        );
        postList.add(model);
      }
      return postList;
    } on DioError catch (e) {
      AppNavigator.showSnackBar(
        snackBar: SnackBar(
          content: Text(
            e.message.toString(),
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              AppNavigator.scaffoldMessengerKey.currentState
                  ?.removeCurrentSnackBar();
            },
          ),
        ),
      );
      return [];
    }
  }
}
