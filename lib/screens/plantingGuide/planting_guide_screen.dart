import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:togetherv2/flutter_flow/flutter_flow_theme.dart';
import 'package:togetherv2/screens/plantingGuide/flowers_screen.dart';
import 'package:togetherv2/screens/plantingGuide/leaves_screen.dart';
import 'package:togetherv2/screens/plantingGuide/my_garden_screen.dart';
import 'package:togetherv2/widgets/planting_guide_card.dart';
import '../../main.dart';

class plantingGuideScreen extends StatefulWidget {
  const plantingGuideScreen({super.key});

  @override
  State<plantingGuideScreen> createState() => _plantingGuideScreenState();
}

class _plantingGuideScreenState extends State<plantingGuideScreen> {
  final User? user = auth.currentUser;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 64, 34, 100),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
          child: Text(
            'Planting Guide',
            style: FlutterFlowTheme
                .of(context)
                .title2
                .override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: MyGardenPage(userId: user!.uid),
                                    type: PageTransitionType.bottomToTop));
                          },
                          child: PlantingGuideCard(
                            size: size * 2.5,
                            plantName: 'My Garden\n',
                            sub: 'See your Plants',
                            image: 'assets/images/garden.png',)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 135, top: 10, bottom: 10),
                          child: Text(
                            "Identify your plant ?",
                            style: FlutterFlowTheme
                                .of(context)
                                .title2
                                .override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: flowers(),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: PlantingGuideCard(
                              size: size * 2.5,
                              plantName: 'Flowers\n',
                              sub: 'Just scan your flowers !',
                              image: 'assets/images/img_flower.png',)
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const leaves(),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: PlantingGuideCard(
                              size: size * 2.5,
                              plantName: 'Leaves\n',
                              sub: 'Identify your plants from its leaves !',
                              image: 'assets/images/img_leave.png',)
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 60, top: 10, bottom: 10),
                        //   child: Text(
                        //     "Is it a Seedling or a Weed? ",
                        //     style: FlutterFlowTheme
                        //         .of(context)
                        //         .title2
                        //         .override(
                        //       fontFamily: 'Poppins',
                        //       color: Colors.black,
                        //       fontSize: 22,
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //     onTap: () {
                        //       Navigator.pushReplacement(
                        //           context,
                        //           PageTransition(
                        //               child: const seedlings(),
                        //               type: PageTransitionType.bottomToTop));
                        //     },
                        //     child: PlantingGuideCard(size: size * 2.5,
                        //       plantName: 'Seedlings\n',
                        //       sub: 'Identify your suspicious seedlings !',
                        //       image: 'assets/images/img_seed.png',)
                        // ),
                      ],
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