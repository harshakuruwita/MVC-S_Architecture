import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/commands/auth_command.dart';
import 'package:owwn_coding_challenge/models/auth_model.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 32, left: 22),
                        child: Text(
                          'Auth',
                          style: TextStyle(
                              fontSize: 38,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                            TextField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email_rounded),
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 48, bottom: 56),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                minimumSize: const Size(
                                    0, 48) // put the width and height you want
                                ),
                            onPressed: () {
                              final String email = _emailController.text;
                              AuthCommand().runRequestToken(
                                  'flutter-challenge@owwn.com');
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
