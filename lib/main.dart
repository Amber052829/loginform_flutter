import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData.dark(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/bg.jpg"),
            fit: BoxFit.fitHeight,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(hintText: "Enter E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      decoration:
                          new InputDecoration(hintText: "Enter Password"),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 40.0)),
                    new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("Login"),
                      onPressed: () => {},
                      splashColor: Colors.black87,
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
