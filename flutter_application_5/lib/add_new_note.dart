import 'package:flutter/material.dart';
import 'package:flutter_application_5/db_provider.dart';
import 'package:flutter_application_5/theme_provider.dart';
import 'package:provider/provider.dart';

class AddNewNote extends StatelessWidget{

  bool isUpdate ; 
  String title;
  String desc;
  int sno;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //DBHelper? dbRef = DBHelper.getInstance;

  AddNewNote({super.key, this.isUpdate = false, this.sno = 0, this.title = "", this.desc = ""});

  @override
  Widget build(BuildContext context) {

    if(isUpdate){
      titleController.text = title;
      descController.text = desc;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'Update Note' : 'Add Note'),
        actions: [
          Consumer<ThemeProvider>(builder: (_,provider, __) {
            return Switch.adaptive(
              value: provider.getThemeValue(), 
              onChanged: (newValue){
                provider.updateTheme(value: newValue);
              });
          })
        ],
      ),
      body: Container( 
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: 21),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter title here',
              label: Text('Title *'),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          SizedBox(height: 21),
          TextField(
            controller: descController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Enter Description here',
              label: Text('Description *'),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  onPressed: () async {
                    var title = titleController.text;
                    var desc = descController.text;

                    if (title.isNotEmpty && desc.isNotEmpty) {
                      if(isUpdate){
                        context.read<DBProvider>().updateNote(title, desc, sno);
                      } else {
                        context.read<DBProvider>().addNote(title, desc);
                      }
                      Navigator.pop(context);

                    /*
                      bool check = isUpdate 
                        ? await dbRef!.updateNote(mTitle: title, mDesc: desc, sno: sno) 
                        : await dbRef!.addNote(mTitle: title, mDesc: desc,);

                      if (check) {
                        Navigator.pop(context);
                      }
                    } */

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the required blanks'),),);
                    }
                    titleController.clear();
                    descController.clear();

                  },
                  child: Text(isUpdate ? 'Update Note' : 'Add Note'),
                ),
              ),

              SizedBox(width: 11),
              
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}
