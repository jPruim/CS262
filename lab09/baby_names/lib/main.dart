import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final dummySnapshot = [
 {"name": "Filip", "votes": 15},
 {"name": "Abraham", "votes": 14},
 {"name": "Richard", "votes": 11},
 {"name": "Ike", "votes": 10},
 {"name": "Justin", "votes": 1},
];
Future<String> getLanguage(Record record) async{
  await Firestore.instance.collection('languages').document(record.language).get().then((docSnap) {
  return docSnap['region'];
  });
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Baby Names',
     home: MyHomePage(),
   );
 }
}

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
  Firestore db = Firestore.instance;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Baby Name Votes')),
     body: _buildBody(context),
   );
 }

 Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
   
   stream: Firestore.instance.collection('baby').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();

     return _buildList(context, snapshot.data.documents);
   },
 );
}

 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  String _text = "";
  final record = Record.fromSnapshot(data);
  
  _MyHomePageState(){
    getLanguage(record).then((val)=>setState((){
      _text = val;
    }));
  }
   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(record.name+": "+ record.language.toString()),
        
         subtitle:Text(_text),
        //  subtitle: region!=null ? Text(region) : Text("still null"),

        // title: Text(record.toString()),
         trailing: Text(record.votes.toString()),
         onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)})
       ),
     ),
   );
 }
}

// class Language {
//   String region;
//   Stream<QuerySnapshot> snapshots;

//   Language.fromMap(Map<String, dynamic> map) :
//      region = map['region'];
  

//   Language.fromSnapshot(Record record) :
//     this.fromMap(( Firestore.instance.collection('languages').document(record.language).get() ).data);
  

// }
// class Record {
//  final String name;
//  final int votes;
//  final DocumentReference reference;

//  Record.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['name'] != null),
//        assert(map['votes'] != null),
//        name = map['name'],
//        votes = map['votes'];

//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);

//  @override
//  String toString() => "Record<$name:$votes>";
// }
class Record {
  String name;
  int votes;
  String language;
  DocumentReference reference;
  String region;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['language'] != null),
       assert(map['name'] != null),
       assert(map['votes'] != null),
       this.language = map['language'],
       this.name = map['name'],
       this.votes = map['votes'];
       
  Future<String> getRegion() async{
    DocumentReference document = Firestore.instance.collection('languages').document(this.language.toString());
    document.get().then((datasnapshot) {
      this.region =  datasnapshot['region'].toString();
      // print(this.region);
    });
    return this.region;
  }
  void setRegion() async{
    this.region = await getRegion();
  }
 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name:$votes:$language:$region>";
}