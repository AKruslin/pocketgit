import 'dart:convert';

import 'package:github_app/data/model/repository_details.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

abstract class SearchDatasource {
  Future<List<RepositoryModel>> searchForRepository(String query);
  Future<RepositoryDetails> getRepositoryDetails(String query);
  Future<UserDetails> getUserDetails(String query);
}

@LazySingleton(as: SearchDatasource)
class SearchDatasourceImpl implements SearchDatasource {
  SearchDatasourceImpl();

  @override
  Future<List<RepositoryModel>> searchForRepository(String query) async {
    try {
      var repoUri = Uri.parse(
          'https://api.github.com/search/repositories?$query&page=1&per_page=100');
      var response = await http.get(repoUri);
      var decoded = jsonDecode(response.body);
      List<RepositoryModel> listOfRepositories = [];
      for (var rawRepo in decoded['items']) {
        listOfRepositories.add(RepositoryModel.fromJson(rawRepo));
      }
      return listOfRepositories;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<RepositoryDetails> getRepositoryDetails(String query) async {
    try {
      var repoUri = Uri.parse('https://api.github.com/repos/$query');
      var response = await http.get(repoUri);
      var decoded = jsonDecode(response.body);
      RepositoryDetails repoDetails = RepositoryDetails.fromJson(decoded);
      return repoDetails;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<UserDetails> getUserDetails(String query) async {
    try {
      var repoUri = Uri.parse('https://api.github.com/users/$query');
      var response = await http.get(repoUri);
      var decoded = jsonDecode(response.body);
      UserDetails userDetails = UserDetails.fromJson(decoded);
      return userDetails;
    } catch (e) {
      throw Exception();
    }
  }
}
