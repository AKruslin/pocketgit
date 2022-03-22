import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/widgets/custom_backbutton.dart';
import 'package:github_app/data/model/repository_details.dart';
import 'package:github_app/presentation/cubit/repo_cubit.dart';
import 'package:github_app/presentation/widgets/open_in_web.dart';
import 'package:github_app/presentation/widgets/user_image.dart';

class RepoDetailsPage extends StatefulWidget {
  const RepoDetailsPage({Key? key, required this.owner, required this.repo})
      : super(key: key);
  final String owner;
  final String repo;
  @override
  State<RepoDetailsPage> createState() => _RepoDetailsPageState();
}

class _RepoDetailsPageState extends State<RepoDetailsPage> {
  late RepoCubit repoCubit;
  @override
  void initState() {
    repoCubit = BlocProvider.of<RepoCubit>(context);
    repoCubit.getRepoDetails(widget.owner, widget.repo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
          child: Stack(
            children: [
              BlocBuilder<RepoCubit, RepoState>(
                builder: (context, state) {
                  if (state is RepoDetailsFinished) {
                    RepositoryDetails repoDetails = state.repositoryDetails;
                    Map<String, dynamic> repoDetailsMap = repoDetails.toMap();
                    var listOfKeys = repoDetails.getListOfKeys();
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 45),
                          child: Text(
                            repoDetails.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        Row(
                          children: [
                            UserImage(imageUrl: repoDetails.owner.avatarUrl),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Owner: ${repoDetails.owner.userName}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Type: ${repoDetails.owner.type}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                            OpenInWebButton(url: repoDetails.browserUrl),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: repoDetailsMap.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Text('${listOfKeys[index]}:'),
                                    const Spacer(),
                                    Text(
                                        '${repoDetailsMap[listOfKeys[index]]}'),
                                  ],
                                ),
                              );
                            })
                      ],
                    );
                  }
                  if (state is RepoDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is RepoDetailsError) {
                    return const Center(
                      child: Text('Error while loading repo details.'),
                    );
                  }
                  return Container();
                },
              ),
              Row(
                children: [
                  CustomBackButton(
                    func: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
