import 'package:flutter/material.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/common/c.dart';
import 'package:github_app/presentation/bloc/search_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    required this.searchBloc,
  }) : super(key: key);

  final SearchBloc searchBloc;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textEditingController = TextEditingController();
  SortTypes sortType = SortTypes.none;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.background,
              AppColors.background.withOpacity(0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.8, 1]),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          const Text('Welcome to pocket-github'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: textEditingController,
                ),
              ),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      child: Text('None'),
                      value: SortTypes.none,
                    ),
                    DropdownMenuItem(
                      child: Text('Most stars'),
                      value: SortTypes.mostStars,
                    ),
                    DropdownMenuItem(
                      child: Text('Most forks'),
                      value: SortTypes.mostForks,
                    ),
                    DropdownMenuItem(
                      child: Text('Latest updated'),
                      value: SortTypes.mostUpdated,
                    ),
                  ],
                  onChanged: (newSortValue) {
                    setState(() {
                      sortType = newSortValue as SortTypes;
                    });
                  },
                  value: sortType,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton(
              onPressed: () async {
                widget.searchBloc.add(SearchForRepository(
                  name: textEditingController.text,
                  sort: sortType,
                ));
              },
              child: const Text('Search')),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
