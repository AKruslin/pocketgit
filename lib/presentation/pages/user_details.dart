import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/widgets/custom_backbutton.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/presentation/cubit/user_cubit.dart';
import 'package:github_app/presentation/widgets/repository_card.dart';
import 'package:github_app/presentation/widgets/user_details_description.dart';
import 'package:github_app/presentation/widgets/user_details_header.dart';

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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserDetailsFinished) {
                    UserDetails userDetails = state.userDetails;
                    Map<String, dynamic> userDetailsMap = userDetails.toMap();
                    int index = -1;
                    var listOfKeys = userDetails.getListOfKeys();
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 20, left: 45),
                              child: Text(
                                userDetails.userName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                            UserHeader(userDetails: userDetails),
                            const SizedBox(height: 20),
                            UserDetailsDescription(
                                userDetailsMap: userDetailsMap,
                                listOfKeys: listOfKeys),
                            Column(
                              children: [
                                ...state.listOfUserRepositories
                                    .map((repository) {
                                  index++;
                                  return RepositoryCard(
                                      repositoryItem: repository, index: index);
                                }),
                                const SizedBox(height: 50),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  if (state is UserDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserDetailsError) {
                    return const Center(
                      child: Text('Error while loading user details.'),
                    );
                  }
                  return Container();
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
                child: CustomBackButton(
                  func: () =>
                      Navigator.popUntil(context, ModalRoute.withName('/')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
