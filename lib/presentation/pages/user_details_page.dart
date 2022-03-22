import 'package:flutter/material.dart';
import 'package:github_app/common/widgets/custom_backbutton.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
          child: Stack(
            children: [
              const Center(child: Text('User details')),
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
