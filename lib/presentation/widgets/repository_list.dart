import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/presentation/cubit/repo_cubit.dart';
import 'package:github_app/presentation/pages/repo_details.dart';
import 'package:github_app/presentation/widgets/user_image.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    Key? key,
    required this.searchList,
  }) : super(key: key);

  final List<RepositoryModel> searchList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              RepositoryModel repositoryModel = searchList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => RepoCubit(),
                        child: RepoDetailsPage(
                          owner: repositoryModel.owner.userName,
                          repo: repositoryModel.name,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: index == 0 ? const EdgeInsets.only(top: 160) : null,
                  padding: const EdgeInsets.all(16),
                  color: index.isEven
                      ? AppColors.brandPrimaryLight
                      : AppColors.brandPrimaryDark,
                  child: Row(
                    children: [
                      UserImage(imageUrl: repositoryModel.owner.avatarUrl),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repo: ${repositoryModel.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Owner: ${repositoryModel.owner.userName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.fork_left,
                                size: 20,
                                color: AppColors.brandWhite,
                              ),
                              const SizedBox(width: 5),
                              Text('${repositoryModel.numberOfForks}'),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.bug_report_outlined,
                                size: 20,
                                color: AppColors.brandWhite,
                              ),
                              const SizedBox(width: 5),
                              Text('${repositoryModel.numberOfIssues}'),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: AppColors.brandWhite,
                              ),
                              const SizedBox(width: 5),
                              Text('${repositoryModel.numberOfStars}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
