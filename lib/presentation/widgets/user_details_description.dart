import 'package:flutter/material.dart';

class UserDetailsDescription extends StatelessWidget {
  const UserDetailsDescription({
    Key? key,
    required this.userDetailsMap,
    required this.listOfKeys,
  }) : super(key: key);

  final Map<String, dynamic> userDetailsMap;
  final List<String> listOfKeys;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: userDetailsMap.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                bottom: 10, left: 16, right: 16),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child:
                        Text('${listOfKeys[index]}:')),
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
        });
  }
}