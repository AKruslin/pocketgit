import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/presentation/bloc/search_bloc.dart';
import 'package:github_app/presentation/widgets/repository_list.dart';
import 'package:github_app/presentation/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchFinished) {
                  return state.searchList.isEmpty
                      ? const Center(
                          child: Text('NO RESULTS !'),
                        )
                      : Column(
                          children: [
                            const SizedBox(
                              height: 160,
                            ),
                            Expanded(
                              child: RepositoryList(
                                repositoryList: state.searchList,
                              ),
                            ),
                          ],
                        );
                }
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
            SearchWidget(
              searchBloc: searchBloc,
            ),
          ],
        ),
      ),
    );
  }
}
