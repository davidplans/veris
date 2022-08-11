import 'package:Veris/data/models/user.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/widgets/trial_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  late User user;

  @override
  void initState() {
    super.initState();
    // _playBeep(_currentValue);
  }

  String _formatDate(DateTime time) {
    final DateFormat format = DateFormat('yyyy-MM-dd – kk:mm');
    // var date = DateTime.fromMillisecondsSinceEpoch(time);

    final String formatDate = format.format(time);
    return formatDate;
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);

    // Iterable<CollectionReference> collections = users.doc(user.id)
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: users
            .doc(user.id)
            .collection('sets')
            .orderBy('startSet', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot setDocument = snapshot.data!.docs[index];
                  final String dateSet =
                      _formatDate(setDocument.get('startSet').toDate());
                  final id = setDocument.id;
                  return ExpansionTile(
                      title: Text('Test # $id, Start $dateSet'),
                      children: [
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: users
                                .doc(user.id)
                                .collection('sets')
                                .doc(setDocument.id)
                                .collection('trials')
                                .orderBy('startTrial', descending: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                               List<Widget> columnTrails = [];
                                for (var doc in snapshot.data!.docs) {
                                  final String dateTrial =
                                      _formatDate(doc['startTrial'].toDate());
                                  // print(doc['startTrial']);
                                  columnTrails.add(
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          top: 20,
                                          bottom: 20,
                                          right: 20),
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 222, 223, 156),
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
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => TrialWidget(
                                                setId: id,
                                                trialId: doc.id,
                                                userId: user.id,
                                                trialTitle: dateTrial,
                                              ),
                                            ),
                                          );
                                        },
                                        title: Text(dateTrial),
                                      ),
                                    ),
                                  );
                                }

                                return Column(children: columnTrails);
                              }
                            }),
                      ]);
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
        });
  }
}
