import 'package:Veris/data/models/user.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrialWidget extends StatefulWidget {
  final String trialId;
  final String setId;
  final String userId;
  final String trialTitle;
  const TrialWidget({Key? key, required this.trialId, required this.userId, required this.trialTitle, required this.setId})
      : super(key: key);

  @override
  State<TrialWidget> createState() => _TrialWidgetState();
}

class _TrialWidgetState extends State<TrialWidget> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

body:      FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.userId).collection('sets').doc(widget.setId).collection('trials').doc(widget.trialId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          List<double> instantBPMs =
                         List.from(data['instantBPMs']);
          return Container(
                      margin: const EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 20),
                      width: double.infinity,
                      
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 222, 223, 156),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Text( widget.trialTitle, style: TextStyle(fontSize: 25),),
                        SizedBox(height: 20,),
                        
                        for (var beat in instantBPMs) Text(beat.toString())
                      ],
                                            
                      // print(element.toString());
                    
                        
                      ),
                    );
        }

        return Text("loading");
      },
    )


      // body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //     stream: users
      //         .doc(widget.userId)
      //         .collection('sets')
      //         .doc(widget.setId)
      //         .collection('trials')
      //         .snapshots(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else {
      //         // print(snapshot.data);
      //         // return Container();
    
      //         return ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: ((context, index) {
      //               DocumentSnapshot document = snapshot.data!.docs[index];
      //               List<double> instantBPMs =
      //                   List.from(document.get('instantBPMs'));
     
    
                    
      //               // var result = snapshot.data.documents[index][];
      //             }));
    

      //       }
      //     }),
    );
  }
}
