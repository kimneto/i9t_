import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i9trafego/src/component/custom_input_field.dart';
import 'package:i9trafego/src/feature/home/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 50,
              width: 50,
            ),
            Center(
              child: Text(
                "Create a password",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Column(
              children: [
                CustomInputField(
                  label: 'label',
                  hint: 'hint',
                  hasIcon: false,
                  icon: Icon(Icons.ac_unit),
                ),
                SizedBox(
                  height: 21,
                ),
                CustomInputField(
                  label: 'label',
                  hint: 'hint',
                  hasIcon: false,
                  icon: Icon(Icons.ac_unit),
                ),
              ],
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Enable Touch ID at login",
                      style: Theme.of(context).textTheme.subtitle1),
                  CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                    value: switchValue,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
