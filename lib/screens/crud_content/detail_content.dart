import 'dart:io';
import 'package:app/Widgets/main_drawer.dart';
import 'package:app/screens/crud_content/add_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// String id='';
// String name='';
// String email='';


class DetailContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
class DetailContent extends StatefulWidget{
  static const route = '/Detail-Content';

  final String id;
  final String email;
  final String name;
  final String categoria;
  final String descripcion;

  DetailContent({required this.id,required this.email,required this.name,required this.categoria,required this.descripcion});

  _DetailContentState createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  late List data= [];
  Future<String> _getData() async {
    var datos= {"id_categoria_fk":widget.id};
    final response = await http.post(
        Uri.http("192.168.56.1", "/PPI_ANDROID/crud/gets/getSubcategoria.php"), body:json.encode(datos));


    // data = json.decode(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["nombre"]);

    return "Success!";
  }

  // @override
  // void initState() {
  //   super.initState();
  //   this._getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria),
      ),
      drawer: MainDrawer(email:widget.email,name: widget.name),
      body: Column(
        children: [ Row(children: [
          Text('Categoria: ',style: TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold
          ),),

          Text(widget.categoria, style: const TextStyle(fontSize: 22))
        ]),
          SizedBox(height: 5,),
          Container(
            child: Column(children: [
              Row(
                children:[ Text('Descripcion: ',style: TextStyle(
                    fontSize: 22,fontWeight: FontWeight.bold,
                ),),
                ]),
       Text(widget.descripcion, style: const TextStyle(fontSize: 22,),maxLines: null,softWrap: true,)
            ]),
          ),SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (){

          }, child: Text('Añadir subcategoria',style: TextStyle(
            fontSize: 20
          ),),
            )
        ]),
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
                // pickAndUploadFile();
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



