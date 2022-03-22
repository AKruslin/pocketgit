import 'package:flutter/material.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/presentation/pages/repo_details.dart';
import 'package:github_app/presentation/pages/user_details_page.dart';

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
                          builder: (context) => const RepoDetailsPage()));
                },
                child: Container(
                  margin: index == 0 ? const EdgeInsets.only(top: 160) : null,
                  padding: const EdgeInsets.all(16),
                  color: index.isEven
                      ? AppColors.brandPrimaryLight
                      : AppColors.brandPrimaryDark,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserDetailsPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2.5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.brandWhite,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              repositoryModel.owner.avatarUrl,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repo: ${repositoryModel.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
