import 'package:Veris/data/models/user.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrialWidget extends StatefulWidget {
  final String docId;
  final String userId;
  final String trialTitle;
  const TrialWidget({Key? key, required this.docId, required this.userId, required this.trialTitle})
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: users
              .doc(widget.userId)
              .collection('trials')
              .doc(widget.docId)
              .collection('baseline')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // print(snapshot.data);
              // return Container();
    
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    List<double> instantBPMs =
                        List.from(document.get('instantBPMs'));
     
    
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
                    // var result = snapshot.data.documents[index][];
                  }));
    
              // return ListView(
              //   children: snapshot.data!.docs.map((doc) {
              //     return Card(
              //         child: ListTile(
              //       title: Text(doc.data().toString()),
              //     ));
              //   }).toList(),
              // );
            }
          }),
    );
  }
}
