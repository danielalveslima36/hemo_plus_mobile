import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        //AREA DA LOGO
        Container(
          decoration: const BoxDecoration(color: Color(0xFFFF4040)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.3,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100)),
          ),
        ),
        //AREA DA LOGO
        //LOGO
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Logo.jpeg"),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
        //LOGO

            const SizedBox(height: 50,),

            //NOME DO APP
            const Text(
              "HEMO+",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: 'Sansation'),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 50)),
            //NOME DO APP

            //TEXTO LOGIN
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Sansation'),
            ),
            //TEXTO LOGIN
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //CPF FIELD
                  const TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'CPF',
                        border: OutlineInputBorder()),
                  ),
                  //CPF FIELD
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  //SENHA FIELD
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Senha',
                        border: OutlineInputBorder()),
                  ),
                  //SENHA FIELD
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  //BOTAO ENTRAR
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                          fontFamily: 'Sansation', fontWeight: FontWeight.bold),
                    ),
                  ),
                  //BOTAO ENTRAR
                  //BOTAO CADASTRAR
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () {
                      Get.toNamed('/cadastro/doador');
                    },
                    child: const Text(
                      'Cadastrar-se',
                      style: TextStyle(
                          fontFamily: 'Sansation', fontWeight: FontWeight.bold),
                    ),
                  )
                  //BOTAO CADASTRAR
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
