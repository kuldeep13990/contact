import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import '../../validator.dart';

class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      // keyboardBarColor: AppColors.sideMenuBGColor,
      // keyboardSeparatorColor: AppColors.sideMenuBGColor,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText2,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText3,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText4,
        ),
      ],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  clearTextInputs() {
    fullNameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }

  void _submitContactRequest() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState.validate()) {
      print("FORM IS NOT VALIDATE");
      return;
    }

    _formKey.currentState.save();
  }

  InputDecoration setTextFieldDecoration(String hintText) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF585858)));
  }

  @override
  Widget build(BuildContext context) {
    final spaceBetweenLabelText = SizedBox(
      height: 6,
    );

    print("CONTACT FORM WIDGET REBUILD");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFF6F5F9),
      ),
      child: Form(
        key: _formKey,
        child: KeyboardActions(
          config: _buildConfig(context),
          overscroll: 50,
          disableScroll: true,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Full name",
                      textAlign: TextAlign.left,
                    ),
                    spaceBetweenLabelText,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        focusNode: _nodeText1,
                        controller: fullNameController,
                        cursorColor: Colors.black,
                        decoration: setTextFieldDecoration("Enter full name"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Please enter full name.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    spaceBetweenLabelText,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        focusNode: _nodeText2,
                        controller: emailController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: setTextFieldDecoration("Enter email"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Please enter email.";
                          } else if (!value.isValidEmail()) {
                            return "Please enter valid email.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Subject",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    spaceBetweenLabelText,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        focusNode: _nodeText3,
                        controller: subjectController,
                        cursorColor: Colors.black,
                        decoration: setTextFieldDecoration("Enter subject"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Please enter subject.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Message",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    spaceBetweenLabelText,
                    Container(
                      // height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        focusNode: _nodeText4,
                        controller: messageController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        // expands: true,
                        cursorColor: Colors.black,
                        decoration: setTextFieldDecoration("Enter message"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Please enter message.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 35, bottom: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4B368A),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: _submitContactRequest,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
