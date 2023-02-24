import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_product_model.dart';
export 'details_product_model.dart';

class DetailsProductWidget extends StatefulWidget {
  const DetailsProductWidget({
    Key? key,
    this.nombre,
    this.precio,
    this.imagen,
  }) : super(key: key);

  final String? nombre;
  final double? precio;
  final String? imagen;

  @override
  _DetailsProductWidgetState createState() => _DetailsProductWidgetState();
}

class _DetailsProductWidgetState extends State<DetailsProductWidget> {
  late DetailsProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () async {
            context.pop();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Atras',
                icon: Icon(
                  Icons.chevron_left,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        widget.imagen!,
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                    child: Text(
                      widget.nombre!,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Text(
                      formatNumber(
                        widget.precio,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.automatic,
                        currency: '₡',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await launchURL(
                          'https://wa.me/50688195365?text=Quiero%20informaci%C3%B3n');
                    },
                    text: 'Consultar',
                    icon: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
