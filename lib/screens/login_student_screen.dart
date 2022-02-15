import 'package:app/screens/home_screen.dart';
import 'package:app/screens/home_screen_student.dart';
import 'package:app/screens/signup_student_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';


String username= '';
String password = '';

class LoginScreenStudent extends StatelessWidget {
  static const routeName = '/login-student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class LoginPageStudent extends StatefulWidget{
  _LoginPageStudentState createState() => _LoginPageStudentState();
}

class _LoginPageStudentState extends State<LoginPageStudent> {
  final _keyForm = GlobalKey<FormState>();
  bool visible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // TextEditingController controllerUser = new TextEditingController();
  // TextEditingController controllerPass = new TextEditingController();
  
  String msg = '';
  // String url = "http://192.168.56.1/tienda/login.php";

  Future _login() async {

    setState(() {
      visible = true ;
    });

    String email = emailController.text;
    String password = passwordController.text;

    var data = {'correo': email, 'contrasena' : password};
    
    
    final response = await http.post(
        Uri.http("192.168.56.1", "/PPI_ANDROID/user/login_student.php"), body:json.encode(data));

    // var msg = json.decode(response.body);
    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(msg),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }else{
      setState(() {
        visible = false;
      });
        // Navigator.pushReplacementNamed(context, HomeScreen.route);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenStudent(id: datauser[0]['id_estudiante'] ,email : emailController.text,name: datauser[0]['nombre']+' '+datauser[0]['nombre_2']+' '+datauser[0]['apellido']+' '+datauser[0]['apellido_2'],))
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child:Text('Login'),
        ),
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Form(
          key: _keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Image.network(
              //   'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              //   height: 180,
              // ),
              Image.asset("assets/images/login.png",
                height: 180
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                controller: emailController,
                validator: (email)=> email != null && !EmailValidator.validate(email)
                    ?'Ingresa un email válido'
                    :null,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Contrasena',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                onPressed: () {
                  if(_keyForm.currentState!.validate()){
                    print("validacion exitosa");
                    _login();
                  }else{
                    print("validacion fallida");
                  }

                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SignupScreenStudent.routeName);
                },
              ),
              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }

}

class ProfileScreen extends StatelessWidget {

// Creating String Var to Hold sent Email.
  final String email;

// Receiving Email using Constructor.
  ProfileScreen({Key? key, required this.email}) : super(key: key);

// User Logout Function.
  logout(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(children: <Widget>[

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Email = ' + '\n' + email,
                          style: TextStyle(fontSize: 20))
                  ),

                  ElevatedButton(
                    onPressed: () {
                      logout(context);
                    },
                    child: Text('Click Here To Logout'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,

                    ),

                  ),

                ],)
            )
        )
    );
  }
}

