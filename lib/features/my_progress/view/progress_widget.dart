import 'package:Veris/features/my_progress/view/partials/progress_tile_widget.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // _bannerUrl != "" ? Image.network(_bannerUrl) : Container(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SvgPicture.asset(
                'assets/images/grey_circles.svg',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      'My progress',
                      style: TextStyle(
                          fontFamily: FontConstants.interFontFamily,
                          fontSize: FontConstants.fontSize20,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.textSecondaryColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 65),
                      child: Text(
                        '6/25',
                        style: TextStyle(
                            fontFamily: FontConstants.interFontFamily,
                            fontSize: FontConstants.fontSize32,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.textSecondaryColor),
                      ),
                    ),
                    Text(
                      'Tests completed in total',
                      style: TextStyle(
                          fontFamily: FontConstants.interFontFamily,
                          fontSize: FontConstants.fontSize17,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.textSecondaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 330.0),
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const ProgressTileWidget(messages: {
                  'green': 'Completed',
                  'pink': 'Every 3 days'
                },);
              }),
        ),
      ],
    );
  }

  // final CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');
  // late UserModel user;
  // String studyId = "";

  // String _formatDate(DateTime time) {
  //   final DateFormat format = DateFormat('yyyy-MM-dd – kk:mm');

  //   final String formatDate = format.format(time);
  //   return formatDate;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   user = context.select((AuthBloc bloc) => bloc.state.user);

  //   // Iterable<CollectionReference> collections = users.doc(user.id)
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: users.doc(user.id).collection('studies').snapshots(),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }

  //         return ListView.builder(
  //             itemCount: snapshot.data!.docs.length,
  //             itemBuilder: ((context, index) {
  //               DocumentSnapshot setDocument = snapshot.data!.docs[index];
  //               final String date =
  //                   _formatDate(setDocument.get('datetime').toDate());

  //               const name = 'test1';
  //               final moduleName = setDocument.get("moduleName");
  //               return ExpansionTile(
  //                   title: Text('Module: $moduleName'),
  //                   subtitle: Text(setDocument.get("type")),
  //                   trailing: Text(date),
  //                   children: [
  //                     Text('values'),
  //                     // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  //                     //     stream: users
  //                     //         .doc(user.id)
  //                     //         .collection('studies')
  //                     //         // .doc(id)
  //                     //         // .collection('modules')
  //                     //         // .orderBy('startTrial', descending: true)
  //                     //         .snapshots(),
  //                     //     builder: (context, snapshot) {
  //                     //       if (!snapshot.hasData) {
  //                     //         return const Center(
  //                     //           child: CircularProgressIndicator(),
  //                     //         );
  //                     //       } else {
  //                     //         List<Widget> columnTrails = [];
  //                     //         for (var doc in snapshot.data!.docs) {
  //                     //           // final String dateTrial =
  //                     //           //     _formatDate(doc['startTrial'].toDate());
  //                     //           columnTrails.add(
  //                     //             Container(
  //                     //               margin: const EdgeInsets.only(
  //                     //                   left: 20,
  //                     //                   top: 20,
  //                     //                   bottom: 20,
  //                     //                   right: 20),
  //                     //               width: double.infinity,
  //                     //               height: 100,
  //                     //               decoration: BoxDecoration(
  //                     //                 color: const Color.fromARGB(
  //                     //                     255, 222, 223, 156),
  //                     //                 borderRadius: const BorderRadius.only(
  //                     //                     topLeft: Radius.circular(10),
  //                     //                     topRight: Radius.circular(10),
  //                     //                     bottomLeft: Radius.circular(10),
  //                     //                     bottomRight: Radius.circular(10)),
  //                     //                 boxShadow: [
  //                     //                   BoxShadow(
  //                     //                     color: Colors.grey.withOpacity(0.5),
  //                     //                     spreadRadius: 5,
  //                     //                     blurRadius: 7,
  //                     //                     offset: const Offset(0,
  //                     //                         3), // changes position of shadow
  //                     //                   ),
  //                     //                 ],
  //                     //               ),
  //                     //               child: ListTile(
  //                     //                 onTap: () {
  //                     //                   // Navigator.push(
  //                     //                   //   context,
  //                     //                   //   MaterialPageRoute(
  //                     //                   //     builder: (context) => TrialWidget(
  //                     //                   //       setId: id,
  //                     //                   //       trialId: doc.id,
  //                     //                   //       userId: user.id,
  //                     //                   //       trialTitle: dateTrial,
  //                     //                   //     ),
  //                     //                   //   ),
  //                     //                   // );
  //                     //                 },
  //                     //                 title: Text(doc.get('values').toString()),
  //                     //               ),
  //                     //             ),
  //                     //           );
  //                     //         }

  //                     //         return Column(children: columnTrails);
  //                     //       }
  //                     //     }),
  //                   ]);
  //               // var result = snapshot.data.documents[index][];
  //             }));
  //       });
  // }
}
