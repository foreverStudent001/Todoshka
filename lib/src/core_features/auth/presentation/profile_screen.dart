import 'package:clippy/src/common_widgets/avatar/display_image.dart';
import 'package:clippy/src/common_widgets/buttons/simple_button.dart';
import 'package:clippy/src/common_widgets/fields/simple_textfield.dart';
import 'package:clippy/src/common_widgets/home.dart';
import 'package:clippy/src/core_features/auth/application/bloc/auth_bloc.dart';
import 'package:clippy/src/core_features/auth/presentation/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    final TextEditingController emailController =
        TextEditingController(text: '${user.email}');
    final TextEditingController photoController = TextEditingController(
        text: user.photoURL != null ? '${user.photoURL}' : '');
    final TextEditingController nameController = TextEditingController(
        text: user.displayName != null ? '${user.displayName}' : '');

    print(user);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            )
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
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthStates>(
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
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 800,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, top: 30),
                                        child: Text(
                                          'Image Url:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SimpleField(
                                        controller: photoController,
                                        hintText: 'Url',
                                        obscureText: false,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: DisplayImage(
                      imagePath: '${user.photoURL}',
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Name:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SimpleField(
                        controller: nameController,
                        hintText: 'Name',
                        obscureText: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Email:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SimpleField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SimpleButton(
                    label: 'Save',
                    onTap: () => {
                      user.updateDisplayName(nameController.text),
                      user.updateEmail(emailController.text),
                      user.updatePhotoURL(photoController.text)
                    },
                    icon: Icons.save,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
