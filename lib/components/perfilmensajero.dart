import 'package:flutter/material.dart';
import '../Menu.dart';
import 'package:url_launcher/url_launcher.dart';

String _phoneNumber;


class Perfilmensajero extends StatelessWidget {

  final idperfil;
  final List<Post> perfil;
  Perfilmensajero({Key key, this.perfil, this.idperfil});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil del Mensajero'),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 460,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 2,
                        child: Image.network(perfil[idperfil].foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                perfil[idperfil].nombre,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(perfil[idperfil].moto),
                              SizedBox(
                                height: 20,
                              ),
                              FloatingActionButton(
                                onPressed: () =>{
                                  _phoneNumber=perfil[idperfil].telefono,
                                  launch('tel://$_phoneNumber')

                                },

                                child: Icon(Icons.call),
                                elevation: 50.0,
                                backgroundColor: Colors.green,
                              ),


                              Text('Llamar'),

                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Cumplimiento'),

                                      CircleAvatar(child: Text( perfil[idperfil].cumplimiento)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Responsabilidad'),
                                      CircleAvatar(child: Text(perfil[idperfil].responsabilidad)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Amabilidad'),
                                      CircleAvatar(child: Text(perfil[idperfil].amabilidad)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Descripcion:'),
                              Text('Mensajero las 24 Horas'),
                              SizedBox(height: 20),

                              Text('Verificar Placa'),

                              Container(
                                width: 100,
                                height: 50,
                                color: Colors.yellowAccent,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  perfil[idperfil].placa,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'))
        ]),
      ),
    );
  }
}
