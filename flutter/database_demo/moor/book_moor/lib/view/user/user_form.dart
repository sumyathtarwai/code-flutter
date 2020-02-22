import 'package:book_moor/data/database.dart';
import 'package:book_moor/view/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  final User user;
  UserForm({Key key, this.user}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState(user: user);
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  User user;
  _UserFormState({this.user});
// controller
  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _addressController;
  TextEditingController _dobController;
  TextEditingController _phoneController;

  final _header = Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10.0),
    color: Colors.deepOrange.shade400,
    child: const Text(
      'User Registration',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  bool _isValid;
  AppDatabase _db;

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration.zero, () {
      _db = Provider.of<AppDatabase>(context, listen: false);
    });
    if (user != null) {
      _nameController = TextEditingController(text: user.userName);
      _addressController = TextEditingController(text: user.address);
      _passwordController = TextEditingController(text: 'dummy');
      _dobController = TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(user.dob));
      _phoneController = TextEditingController(text: user.phone);
      _isValid = user.valid;
    } else {
      _nameController = TextEditingController();
      _addressController = TextEditingController();
      _passwordController = TextEditingController();
      _dobController = TextEditingController();
      _phoneController = TextEditingController(text: "09");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final AppDatabase db = Provider.of<AppDatabase>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _header,
                  _buildInput(context, Icons.person_outline,
                      controller: _nameController,
                      label: 'User Name',
                      isRequired: true,
                      hint: 'Alice'),
                  _buildInput(context, Icons.lock_outline,
                      controller: _passwordController,
                      label: 'Password',
                      isRequired: true,
                      isPassword: true),
                  _buildDateInput(
                    context,
                    Icons.date_range,
                    controller: _dobController,
                    label: 'Birthday',
                    isRequired: true,
                  ),
                  _buildInput(context, Icons.directions,
                      controller: _addressController,
                      label: 'Address',
                      isRequired: true,
                      hint: 'Yangon'),
                  _buildPhoneInput(context, Icons.phone_iphone,
                      controller: _phoneController,
                      label: 'Phone',
                      hint: '12344555'),
                  _buildValidInput(
                      icon: Icons.verified_user, label: 'Validity'),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(30.0),
                    child: FlatButton(
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          // Process data
                          _formKey.currentState.save();
                          User current = User(
                              id: null,
                              userName: _nameController.text,
                              password: _passwordController.text,
                              address: _addressController.text,
                              dob: DateFormat.yMd().parse(_dobController.text),
                              phone: _phoneController.text,
                              valid: _isValid,
                              role: 'user');

                          if (user != null && user.id != null) {
                            _db.userDao
                                .updateUser(current.copyWith(id: user.id));
                          } else {
                            _db.userDao.insertUser(current);
                          }
                          _reset();
                          // _formKey.currentState.reset();
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _buildValidInput({IconData icon, String label}) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(
              icon,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.only(right: 25.0),
            child: Text(label),
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text('Yes'),
            value: true,
            groupValue: _isValid,
            onChanged: (value) {
              setState(
                () {
                  _isValid = value;
                },
              );
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text('No'),
            value: false,
            groupValue: _isValid,
            onChanged: (value) {
              setState(
                () {
                  _isValid = value;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInput(BuildContext context, IconData icon,
      {TextEditingController controller,
      String label,
      bool isRequired,
      String hint,
      int line = 1,
      bool isPassword = false}) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.deepOrangeAccent,
                  ),
                  RichText(
                    text: TextSpan(
                      text: label,
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: isRequired ?? isRequired == true ? '*' : '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: Container(
                height: 45.0,
                child: TextFormField(
                  obscureText: isPassword,
                  controller: controller,
                  // validator: (val) => val.isEmpty ? '$label is required' : null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15.0),
                    hintText: hint,
                    border: OutlineInputBorder(),
                    //  disabledBorder: OutlineInputBorder(),
                  ),
                  maxLines: line,
                  onSaved: (val) {
                    // print(val);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateInput(
    BuildContext context,
    IconData icon, {
    TextEditingController controller,
    String label,
    bool isRequired,
    String hint,
  }) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.deepOrangeAccent,
                  ),
                  RichText(
                    text: TextSpan(
                      text: label,
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: isRequired ?? isRequired == true ? '*' : '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 0,
              child: Container(
                width: 190.0,
                height: 45.0,
                child: TextFormField(
                  controller: controller,
                  enabled: false,
                  // validator: (val) => val.isEmpty ? '$label is required' : null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15.0),
                    hintText: hint,
                    border: OutlineInputBorder(),
                    //  disabledBorder: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                  onSaved: (val) => '',
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () => _pickDate(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput(
    BuildContext context,
    IconData icon, {
    TextEditingController controller,
    String label,
    bool isRequired,
    String hint,
  }) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.deepOrangeAccent,
                ),
                RichText(
                  text: TextSpan(
                    text: label,
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: isRequired ?? isRequired == true ? '*' : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Container(
              height: 45.0,
              child: TextFormField(
                controller: controller,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                maxLines: 1,
                validator: (value) {
                  RegExp exp = RegExp(r'^[0-9]+$');
                  if (!exp.hasMatch(value) || value.length < 6) {
                    return "Phone format invalid";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15.0),
                  hintText: hint,
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => '',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime(2000),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    print(date);
    if (date != null)
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(date);
      });
  }

  void _reset() {
    print('object');
    setState(() {
      _nameController.text = '';
      _passwordController.text = '';
      _dobController.text = '';
      _addressController.text = '';
      _phoneController.text = '09';
      _isValid = null;
      user = null;
    });
  }
}
