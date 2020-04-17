import 'package:flutter/material.dart';
import 'package:mvvmTest/member_index.dart';

import './base_mvp/mvp.dart';

class LoginModel extends IModel<LoginModel> {
  @override
  void onBefore() {
    // TODO: implement onBefore
  }

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onDataError() {
    // TODO: implement onDataError
  }

  @override
  void onFailure(String msg) {
      // TODO: implement onFailure
    }
  
  @override
  void onNetError() {
    // TODO: implement onNetError
  }

  @override
  void onSuccess(LoginModel data) {
    // TODO: implement onSuccess
  }
  
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _psdController = TextEditingController();
  bool _secureText = false;

  @override
  void initState() {
    _nameController.addListener(() { });
    _psdController.addListener(() { });

    MemberIndexTest().shared();
    super.initState();
  }

  bool _isValidLogin() {
    return !(_nameController.text.isEmpty || _psdController.text.isEmpty);
  }

  void changePsdSecureText() {
    setState(() {
      this._secureText = !this._secureText;
    });
  }


  void loginAction() async {
    // String name = _nameController.text;
    // String password = _psdController.text;

    MemberIndexTest()..request();
  }

  Widget _buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top:20),
      child: InkWell(
        child: Center(child: Text("登录")),
        onTap: loginAction ,
      ),
    );
  }

  TextFormField _buildNameTextField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: "账号",
        hintText: "请输入",
        suffixIcon: GestureDetector(
          child: Icon(_nameController.text.isEmpty?null:Icons.clear),
          onTap: () => _nameController.clear(),
        )
      ),
    );
  }

  TextFormField _buildPsdTextField() {
    return TextFormField(
      obscureText: this._secureText,
      controller: _psdController,
      decoration: InputDecoration(
        labelText: "密码",
        hintText: "请输入",
        suffixIcon: GestureDetector(
          child: Icon(this._secureText?Icons.visibility_off:Icons.visibility),
          onTap: this.changePsdSecureText,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:20),
            child: _buildNameTextField(),
          ),
          Container(
            margin: EdgeInsets.only(top:20),
            child: _buildPsdTextField(),
          ),
          _buildLoginButton()
        ],
      ),
    );
  }
}