import 'package:clippy/src/common_widgets/avatar/display_image.dart';
import 'package:clippy/src/core_features/auth/application/bloc/auth_bloc.dart';
import 'package:clippy/src/core_features/auth/presentation/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    print(user);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
        actions: [
          IconButton(
              onPressed: () => context.read<AuthBloc>().add(SignOutRequested()),
              icon: Icon(Icons.logout_outlined)),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Clippy", style: TextStyle()),
      ),
      body: BlocListener<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignInScreen()),
              (route) => false,
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    child: DisplayImage(
                      imagePath: "${user.photoURL}",
                      onPressed: () {},
                    )),
                Text(
                  'Email: \n ${user.email}',
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                user.photoURL != null
                    ? Image.network("${user.photoURL}")
                    : Container(),
                user.displayName != null
                    ? Text("${user.displayName}")
                    : Container(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
