import 'package:app/screens/access_code.dart';
import 'package:flutter/material.dart';
import 'package:app/Widgets/main_drawer.dart';
import 'package:app/Widgets/fab_button.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import './details_screen.dart';
import './login_student_screen.dart';
// import './ExpandableFab.dart';

class HomeScreenStudent extends StatelessWidget{

  static const route = '/HomeScreen-Student';

  // final String nombre;
  final String id;
  final String email;
  final String name;

// Receiving Email using Constructor.
  HomeScreenStudent({required this.id,required this.email,required this.name});

// User Logout Function.
  logout(BuildContext context){

    Navigator.pop(context);

  }
  // HomeScreen({this.username});
  // final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 30,
              ),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:DecorationImage(
                            image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                            ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Text(name,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Text(email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',
                style: TextStyle(fontSize: 18
                ),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                style: TextStyle(fontSize: 18
                ),
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(DetailsScreen.route);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('logout',
                style: TextStyle(fontSize: 18
                ),

              ),
              onTap: (){
                // Navigator.pushNamed(context, LoginScreen.routeName);
                logout(context);
              },
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Categorias',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,

                ),
              ),
              onTap: null,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Tecnologia',
                style: TextStyle(fontSize: 18
                ),

              ),
              onTap: null,
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Tecnica',
                style: TextStyle(fontSize: 18
                ),

              ),
              onTap: null,
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Criterios de evaluacion TyT',
                style: TextStyle(fontSize: 18
                ),

              ),
              onTap: null,
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Otros documentos de apoyo',
                style: TextStyle(fontSize: 18
                ),

              ),
              onTap: null,
            ),
            ListTile(
              // leading: Icon(Icons.arrow_back),
              title: Text('Preguntas frecuentes',
                style: TextStyle(fontSize: 18
                ),
              ),
              onTap: null,
            ),


          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text('Parece que no tienes acceso, accede un codigo para empezar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22,),
              ),
            ),
            // RaisedButton(
            //     child: Text('Detalle s'),
            //     onPressed: (){
            //       Navigator.of(context).pushNamed(DetailsScreen.route);
            //     }
            // ),
            // RaisedButton(
            //     child: Text('Login'),
            //     onPressed: (){
            //       Navigator.of(context).pushNamed(LoginScreen.routeName);
            //     }
            // ),
          ],
        ),


      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccessCode(id:this.id,email : this.email,name: this.name))
          );
        },
      ),
    );
  }
}