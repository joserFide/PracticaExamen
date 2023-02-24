import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailLogin widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for ContraseaLogin widget.
  TextEditingController? contraseaLoginController;
  late bool contraseaLoginVisibility;
  String? Function(BuildContext, String?)? contraseaLoginControllerValidator;
  // State field(s) for emailRegistro widget.
  TextEditingController? emailRegistroController;
  String? Function(BuildContext, String?)? emailRegistroControllerValidator;
  // State field(s) for PasswordRegistro widget.
  TextEditingController? passwordRegistroController;
  late bool passwordRegistroVisibility;
  String? Function(BuildContext, String?)? passwordRegistroControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contraseaLoginVisibility = false;
    passwordRegistroVisibility = false;
  }

  void dispose() {
    emailLoginController?.dispose();
    contraseaLoginController?.dispose();
    emailRegistroController?.dispose();
    passwordRegistroController?.dispose();
  }

  /// Additional helper methods are added here.

}
