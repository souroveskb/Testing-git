import 'dart:js';

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
	final _formKey = GlobalKey<FormState>();
	LoginView({Key ? key, required this.title}):super(key: key);

	final String title;

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
				title: title,
				home: Scaffold(
					body: _loginform(context),
				),
		);
	}

	Widget _loginform(BuildContext context){
		return Form(
			key: _formKey,
			child: Padding(
				padding: EdgeInsets.symmetric(horizontal: 30),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						_usernameField(),
						_passwordField(),
						_loginButton(context),
					],
				),
			),
		);
	}

	Widget _usernameField(){
		return TextFormField(
			decoration: const InputDecoration(
				icon: Icon(Icons.person),
				hintText: "Enter username",
				labelText: "Username",
			),
			validator: (value)=>null,
		);
	}

	Widget _passwordField(){
		return TextFormField(
			obscureText: true,
			decoration: const InputDecoration(
				icon: Icon(Icons.security),
				hintText: "Password",
				labelText: "Password",
			),
			validator: (value)=>null,
		);
	}

	Widget _loginButton(BuildContext context){
		return ElevatedButton(
				onPressed: () {
					Navigator.pushNamed(context, '/counter');
				},
				child: const Text('Login')
		);
	}
}
