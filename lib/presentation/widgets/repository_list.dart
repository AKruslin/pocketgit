import 'package:flutter/material.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/presentation/widgets/repository_card.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    Key? key,
    required this.repositoryList,
  }) : super(key: key);

  final List<RepositoryModel> repositoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: repositoryList.length,
            itemBuilder: (context, index) {
              RepositoryModel repositoryModel = repositoryList[index];
              return RepositoryCard(
                repositoryItem: repositoryModel,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
