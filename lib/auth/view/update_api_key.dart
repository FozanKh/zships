import 'package:zships/auth/controller/auth_controller.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/constants/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateApiKey extends StatefulWidget {
  static const String route = 'UpdateApiKey';
  final bool onSignUp;

  const UpdateApiKey({Key key, this.onSignUp = false}) : super(key: key);
  @override
  _UpdateApiKey createState() => _UpdateApiKey();
}

class _UpdateApiKey extends State<UpdateApiKey> {
  User user;
  AuthController controller;

  @override
  void initState() {
    controller = AuthController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        iconTheme: IconThemeData(color: kFontsColor),
        elevation: 0,
        automaticallyImplyLeading: !widget.onSignUp,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ShowUp(
                  delay: 200,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(getText(context, 'Start Your ships!'),
                            style: kTitleTS.copyWith(fontSize: 25, color: kFontsColor), textAlign: TextAlign.center),
                        SizedBox(height: 20),
                        RoundedTextField(
                          title: getText(context, 'API Key'),
                          hint: user?.apiKey ?? getText(context, 'Write you API Key'),
                          hintStyle: kHintTS.copyWith(color: user?.name != null ? kFontsColor.withOpacity(0.5) : null),
                          fillColor: Colors.grey.shade200,
                          onChanged: (value) => setState(() => controller.apiKeyChange(value)),
                        ),
                        // if (!controller.validApiKey && controller.apiKey.isNotEmpty)
                        //   ShowUp(
                        //     delay: 200,
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //       child: Text(
                        //         getText(context, 'Please enter a valid API key'),
                        //         style: TextStyle(color: Colors.redAccent, fontSize: 12),
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: (controller.validApiKey),
                child: InkWell(
                  onTap: controller.updateUserInfo,
                  child: Container(
                    height: MediaQuery.of(context).padding.bottom + 80,
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    color: kFontsColor,
                    child: Text(getText(context, 'Continue'), style: kTFTextStyle.copyWith(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
