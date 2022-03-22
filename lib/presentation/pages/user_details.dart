import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/widgets/custom_backbutton.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/presentation/cubit/user_cubit.dart';
import 'package:github_app/presentation/widgets/open_in_web.dart';
import 'package:github_app/presentation/widgets/user_image.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key, required this.owner}) : super(key: key);
  final String owner;
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late UserCubit userCubit;
  @override
  void initState() {
    userCubit = BlocProvider.of<UserCubit>(context);
    userCubit.getUserDetails(widget.owner);
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
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserDetailsFinished) {
                    UserDetails userDetails = state.userDetails;
                    Map<String, dynamic> userDetailsMap = userDetails.toMap();
                    var listOfKeys = userDetails.getListOfKeys();
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 45),
                          child: Text(
                            userDetails.userName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        Row(
                          children: [
                            UserImage(
                              imageUrl: userDetails.avatarUrl,
                              name: userDetails.userName,
                              isActive: false,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${userDetails.realName}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Type: ${userDetails.type}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            OpenInWebButton(url: userDetails.browserUrl),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: userDetailsMap.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('${listOfKeys[index]}:')),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${userDetailsMap[listOfKeys[index]]}',
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                      ],
                    );
                  }
                  if (state is UserDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserDetailsError) {
                    return const Center(
                      child: Text('Error while loading repo details.'),
                    );
                  }
                  return Container();
                },
              ),
              CustomBackButton(
                func: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
