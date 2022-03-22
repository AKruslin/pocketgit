import 'dart:convert';

import 'package:github_app/data/model/repository_model.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

abstract class SearchDatasource {
  Future<List<RepositoryModel>> searchForRepository(String query);
}

@LazySingleton(as: SearchDatasource)
class SearchDatasourceImpl implements SearchDatasource {
  SearchDatasourceImpl();

  @override
  Future<List<RepositoryModel>> searchForRepository(String query) async {
    try {
      var repoUri = Uri.parse(
          'https://api.github.com/search/repositories?$query&page=1&per_page=200');
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
}
