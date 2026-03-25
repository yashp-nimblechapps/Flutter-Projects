import 'package:flutter/material.dart';
import 'package:flutter_application_5/add_new_note.dart';
import 'package:flutter_application_5/data/local/db_helper.dart';
import 'package:flutter_application_5/db_provider.dart';
import 'package:flutter_application_5/settings_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //List<Map<String, dynamic>> allNotes = [];
  //DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    context.read<DBProvider>().getInitialNotes();
    /*dbRef = DBHelper.getInstance;
    getNotes();*/
  }

  /*void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          PopupMenuButton(itemBuilder: (_) {
            return [
              PopupMenuItem(child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 11,),
                  Text("Settings")
                ],
              ),onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              )
            ];
          })
        ],
        
      ),

      // all notes viewed here
      body: Consumer<DBProvider>(
        builder: (ctx, provider, __){

          List<Map<String, dynamic>> allNotes = provider.getNotes();

          return allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Text('${index+1}', style: TextStyle(fontSize: 16),),
                  title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
                  subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
                  trailing: SizedBox(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => 
                              AddNewNote(isUpdate: true, title: allNotes[index][DBHelper.COLUMN_NOTE_TITLE], 
                                          desc: allNotes[index][DBHelper.COLUMN_NOTE_DESC], 
                                          sno: allNotes[index][DBHelper.COLUMN_NOTE_SNO],)  
                                ));

                            /*showModalBottomSheet(
                              context: context, builder: (context){
                                titleController.text = allNotes[index][DBHelper.COLUMN_NOTE_TITLE];
                                descController.text = allNotes[index][DBHelper.COLUMN_NOTE_DESC];
                                return getBottomSheetView(isUpdate: true, sno: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                              });*/
                          },
                          child: Icon(Icons.edit)
                        ),
                        SizedBox(width: 7,),
                        InkWell(
                          onTap: () async {
                            context.read<DBProvider>().deleteNote(
                              allNotes[index][DBHelper.COLUMN_NOTE_SNO]
                            );

                            /*bool check = await dbRef!.deleteNote(sno: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                            if(check){
                              getNotes();
                            }*/

                          },
                          child: Icon(Icons.delete, color: Colors.red,))
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('No Notes yet'));
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // note to be added from here

          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewNote()));
          
          /*showModalBottomSheet(
            context: context,
            builder: (context) {
              titleController.clear();
              descController.clear();
              return getBottomSheetView();
            },
          ); */
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
 // Widget getBottomSheetView({bool isUpdate = false, int sno=0}) {
  //  return 