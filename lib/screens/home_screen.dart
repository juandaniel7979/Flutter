import 'dart:io';
import 'package:app/Widgets/main_drawer.dart';
import 'package:app/screens/access_code.dart';
import 'package:app/screens/crud_content/add_category.dart';
import 'package:app/screens/crud_content/detail_content.dart';
import 'package:app/screens/details_screen.dart';
import 'package:app/services/drive_service.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:googleapis/adsense/v2.dart';
import 'package:googleapis/analytics/v3.dart';
import 'package:googleapis/logging/v2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// String id='';
// String name='';
// String email='';
class HomeScreen extends StatefulWidget{
  static const route = '/HomeScreen-teacher';

  final String id;
  final String email;
  final String name;

  HomeScreen({required this.id,required this.email,required this.name});

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List data= [];
  Future<String> _getData() async {
    var datos= {"id_profesor_fk": 1};
    final response = await http.post(
    Uri.http("192.168.56.1", "/PPI_ANDROID/crud/gets/getCategoria.php"), body:json.encode(datos));


    // data = json.decode(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });
    // print(data[1]["nombre"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this._getData();
  }


  pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      await DriveService().upload(file);
    } else {
       AlertDialog(
        title: new Text('No funciona'),
        actions: <Widget>[
          FlatButton(
            child: new Text("OK"),
            onPressed: () {
            },
          ),
        ],
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        drawer: MainDrawer(email:widget.email,name: widget.name),
        body: new ListView.builder(
            itemCount: data ==null ? 0 :data.length,
            itemBuilder: (BuildContext context,int index){
              return new GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailContent(id:widget.id,email: widget.email,name: widget.name,categoria: data[index]['nombre'],descripcion:data[index]['descripcion'] ,)));
                },
                  child: Card(
                    margin:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    color: Colors.white,
                    elevation: 5.0,
                    child: Center(
                        child: Text('id: '+data[index]['id_categoria']+'\nCategoria: '+data[index]['nombre']+'\nDescripcion: '+data[index]['descripcion'])
                    ),
                ),
              );

            }, 
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.green,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                onTap: (){
                  _getData();
                },
                child: Icon(Icons.video_collection),
                label: 'Copiar'
            ),
            SpeedDialChild(
              onTap: (){
                pickAndUploadFile();
              },
                child: Icon(Icons.upload),
                label: 'Subir contenido'
            ),
            SpeedDialChild(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCategory(id:widget.id))
                );
              },
                child: Icon(Icons.add),
                label: 'Add category'
            )
          ],

        ),
    );
  }
}



