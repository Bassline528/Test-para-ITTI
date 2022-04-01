import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/pages/home.dart';
import 'package:test_itti/services/db_provider.dart';
import 'package:test_itti/services/users_list.dart';



class FormUserPage extends StatefulWidget {

  static String routeName = 'form';

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  var sexs = ["Masculino", 'Femenino'];

    final nameCtrl = TextEditingController();

    final dateCtrl = TextEditingController();

  String sex = 'Masculino';

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: _buildBoxDecoration(),
            width: double.infinity,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: nameCtrl,
                    validator: (value) {
                      if(value == null || value.length <1 ){
                        return ' El nombre es obligatorio';
                      }
                        return null;
                    },
                    decoration: inputDecoration(
                      hintText: 'Nombre del usuario',
                      labelText: 'Nombre'
                    )
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: dateCtrl,
                    validator: (value) {
                      if(value == null || value.length <1 ){
                        return ' La fecha es obligatoria';
                      }
                        return null;
                    },
                    decoration: inputDecoration(
                      hintText: 'Fecha de nacimiento del usuario',
                      labelText: 'Fecha de nacimiento'
                    )
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    validator: (value) {
                      if(value == null ){
                        return ' El sexo es obligatoria';
                      }
                        return null;
                    },
                    value: sex,
                    items: sexs.map((e) => DropdownMenuItem(
                      child: Text(e), 
                      value: e,)).toList(), 
                      onChanged: (value){
                        setState(() {
                          print(value.toString());
                          sex = value.toString();
                        });
                      },
                      hint: Text('Sexo'),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    child: Text('Confirmar', style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        print(nameCtrl.text);
                        print(dateCtrl.text);
                        print(sex);
                        mostrarAlerta();
                      }
                        
                    }
                    )
                ],
              ),

            ),
          ),
        ),
      ),
   );
  }

  confirmarEnvio(){
    final usersListProvider = Provider.of<UsersListProvider>(context, listen: false);
    usersListProvider.newUser(nameCtrl.text, dateCtrl.text, sex);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (Route<dynamic> route) => false,
    );
  }

  mostrarAlerta() {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text("¿Confirmar envío?"),
        actions: [
          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
              confirmarEnvio();
            },
            child: Text("Ok"),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancelar"),
          )
        ],
      ));
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0,5),
          blurRadius: 5
        )
      ]
    );
  }

  InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2
        )
      ),
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(
        color: Colors.grey
      ),
      prefixIcon: prefixIcon != null 
        ? Icon(prefixIcon, color: Colors.blue)
        : null 
    );
  }
}