import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/data/model/repository_model.dart';
import 'package:github_app/presentation/cubit/repo_cubit.dart';
import 'package:github_app/presentation/pages/repo_details.dart';
import 'package:github_app/presentation/widgets/user_image.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard(
      {Key? key, required this.repositoryItem, required this.index})
      : super(key: key);

  final RepositoryModel repositoryItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => RepoCubit(),
              child: RepoDetailsPage(
                owner: repositoryItem.owner.userName,
                repo: repositoryItem.name,
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: index.isEven
            ? AppColors.brandPrimaryLight
            : AppColors.brandPrimaryDark,
        child: Row(
          children: [
            UserImage(
              imageUrl: repositoryItem.owner.avatarUrl,
              name: repositoryItem.owner.userName,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repo: ${repositoryItem.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Owner: ${repositoryItem.owner.userName}',
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
                    Text('${repositoryItem.numberOfForks}'),
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
                    Text('${repositoryItem.numberOfIssues}'),
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
                    Text('${repositoryItem.numberOfStars}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
