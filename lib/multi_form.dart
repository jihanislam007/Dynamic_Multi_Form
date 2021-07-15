import 'package:dynamic_multi_form/form.dart';
import 'package:dynamic_multi_form/user.dart';
import 'package:flutter/material.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          elevation: .0,
          leading: Icon(
            Icons.wb_cloudy,
          ),
          title: Text("Article Information"),
          actions: [
            IconButton(onPressed: onAddForm, icon: Icon(Icons.add_circle_outline))
          ],
        ),*/
        body:  Wrap(
          children: [
            new Expanded(
              //flex: 1,
              child: new Container(
                height: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(16),
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.green, spreadRadius: 3),
                  ],
                ),*/
                child: users.length <= 0
                      ? Center(
                 //   child: UserForm(user: User(), onDelete: () {  }, onAddForm: () {  },),
                          /*child: EmptyState(
                            title: 'Oops',
                            message: 'Add form by tapping add button below',
                          ),*/
                        )
                      : ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: users.length,
                          itemBuilder: (_, i) => UserForm(
                            user: users[i],
                            onAddForm: ()=> onAddForm(),
                            onDelete: () => onDelete(i),

                          ),
                        ),
              ),

            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: onAddForm,
                    child: Text('Add Row',style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            )
          ],
        ),

        /*Row(

        ),*/

        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: onAddForm,
          foregroundColor: Colors.white,
        ),*/
      //);
        ),
      //),
    );
  }
//}

  ///on form user deleted
  void onDelete(int index) {
    setState(() {
      users.removeAt(index);
    });

    /*setState(() {
    var find = users.firstWhere(
          (it) => it.user == _user,
      orElse: () => null,
    );
    if (find != null) users.removeAt(users.indexOf(find));
  });*/
  }

  ///on add form
  void onAddForm() {
    setState(() {
      users.add(User());
    });
  }

  /*///on save forms
  void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Users'),
              ),
              body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(data[i].fullName.substring(0, 1)),
                  ),
                  title: Text(data[i].fullName),
                  subtitle: Text(data[i].email),
                ),
              ),
            ),
          ),
        );
      }
    }
  }*/
}
