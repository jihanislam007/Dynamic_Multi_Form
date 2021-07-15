import 'package:dynamic_multi_form/user.dart';
import 'package:flutter/material.dart';

typedef OnDelete();
typedef OnAddForm();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;
  final OnAddForm onAddForm;

  UserForm({Key? key, required this.user,required this.onAddForm, required this.onDelete}) : super(key: key);
  //UserForm(this.user, this.onDelete);

  @override
  _UserFormState createState() => state;

  bool isvalid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
            child: Card(
              child: Form(
                key: form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      leading: Icon(Icons.add_moderator),
                      title: Text("Article Information"),
                      actions: [
                        IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete)
                        ),
                        IconButton(onPressed: widget.onAddForm, icon: Icon(Icons.add_circle_outline))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextFormField(
                        initialValue: widget.user.author_name,
                        onSaved: (val) => widget.user.author_name = val!,
                        validator: (val) =>
                        val!.length > 3 ? null : 'Full name is invalid',
                        decoration: InputDecoration(
                          labelText: 'Author name',
                          hintText: 'Enter your Author name',
                          icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextFormField(
                        initialValue: widget.user.article_title,
                        onSaved: (val) => widget.user.article_title = val!,
                        validator: (val) =>
                        val!.length > 1 ? null : 'article title is invalid',
                        decoration: InputDecoration(
                          labelText: 'Article Title',
                          hintText: 'Enter your Article Title',
                          icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),

                    SizedBox(height: 24,)

                  ],
                ),
              ),
            ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
