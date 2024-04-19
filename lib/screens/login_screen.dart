import 'package:flutter/material.dart';
import 'package:music_player_app1/commom/custome_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            //Color(0xfff39060),
            // Color(0xffffb56b),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: Image.asset('assets/main/music.jpg', fit: BoxFit.cover),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }, widget: const Text('Login')),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  height: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {},
                  widget: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.g_mobiledata_outlined,
                        size: 50,
                        color: Colors.red,
                      ),
                      Text('Sign in with Google')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onPressed: () {},
                  widget: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 30,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Sign with Email'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const Text(
                        'Register your app',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
