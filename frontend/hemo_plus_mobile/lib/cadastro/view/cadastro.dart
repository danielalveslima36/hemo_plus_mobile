import 'package:flutter/material.dart';
import 'package:hemo_plus_mobile/enums/estadoCivil.dart';
import 'package:hemo_plus_mobile/enums/genero.dart';
import 'package:hemo_plus_mobile/enums/tipo_sanguineo.dart';
import 'package:hemo_plus_mobile/widget/customDropDown.dart';

import '../../enums/cor.dart';
    
class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  int currentStep = 0;
  final _nome = TextEditingController();
  final _cartaoSus = TextEditingController();
  final _cpf = TextEditingController();
  final _peso = TextEditingController();
  final _altura = TextEditingController();
  final _telefone = TextEditingController();
  final _cep = TextEditingController();
  final _rua = TextEditingController();
  final _bairro = TextEditingController();
  final _numero = TextEditingController();
  final _complemento = TextEditingController();
  final _cidade = TextEditingController();
  final _senha = TextEditingController();
  final _confirmacaoSenha = TextEditingController();
  EstadoCivil? _estadoCivilValue;
  Genero? _generoValue;
  Cor? _corValue;
  TipoSanguineo? _tipoSanguineo;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      
      body: Stepper(

        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () => {
          setState(() => currentStep += 1),
        },
        onStepCancel: () => {
          currentStep == 0 ? null : setState(() => currentStep -= 1)
        },

      )
    );
  }

  List<Step> getSteps() => [
    //////////////////// STEP 1 ////////////////////
      Step(
        isActive: currentStep >= 0,
        title: const Text('Pessoais'), 
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //////////////////// NAME FIELD ////////////////////
            TextFormField(
              controller: _nome,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            //////////////////// NAME FIELD ////////////////////
            const SizedBox(height: 40,),

            /////////////////////// ALTURA FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _altura,
              decoration: const InputDecoration(labelText: 'Altura'),
            ),
            /////////////////////// ALTURA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            ////////////////////////// PESO FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _peso,
              decoration: const InputDecoration(labelText: 'Peso'),
            ),
            /////////////////////// PESO FIELD ///////////////////////
            
            const SizedBox(height: 40,),

            ///////////////////////////// TELEFONE FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _telefone,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            /////////////////////// TELEFONE FIELD ///////////////////////
            const SizedBox(height: 40,),
            //////////////////// GENERO FIELD ////////////////////
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Gênero'),
            ),
            
            CustomDropDown<Genero>(
              hint: "Selecione seu gênero",
              dropValue: _generoValue, 
              values: Genero.values, 
              onChanged: (value) => setState(() {
                _generoValue = value;
              })
            ),
            //////////////////// GENERO FIELD ////////////////////
            ///
            const SizedBox(height: 40,),

            //////////////////// ESTADO CIVIL FIELD ////////////////////
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Estado Civil'),
            ),
            
            CustomDropDown<EstadoCivil>(
              hint: "Selecione seu estado civil",
              dropValue: _estadoCivilValue, 
              values: EstadoCivil.values, 
              onChanged: (value) => setState(() {
                _estadoCivilValue = value;
              })
            ),
            //////////////////// ESTADO CIVIL FIELD ////////////////////
            
            const SizedBox(height: 40,),
            
            //////////////////// COR FIELD ////////////////////
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Cor'),
            ),
            
            CustomDropDown<Cor>(
              hint: "Selecione sua cor",
              dropValue: _corValue, 
              values: Cor.values, 
              onChanged: (value) => setState(() {
                _corValue = value;
              })
            ),
            //////////////////// COR FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// TIPO SANGUINEO FIELD ////////////////////
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Tipo Sanguíneo'),
            ),
            
            DropdownButton(
                isExpanded: true,
                value: _tipoSanguineo,
                onChanged: (value) {
                  setState(() {
                    _tipoSanguineo = value;
                  });
                },
                items: TipoSanguineo.values.map((tipo) {
                  return DropdownMenuItem(
                    child: Text(tipo.descricao),
                    value: tipo,
                  );
                }).toList(),
              ),
            //////////////////// TIPO SANGUINEO FIELD ////////////////////
            
            const SizedBox(height: 20,),

            //////////////////// CARTAO SUS FIELD ////////////////////
            TextFormField(
              controller: _cartaoSus,
              decoration: const InputDecoration(labelText: 'Cartão  do SUS'),
            ),
            //////////////////// CARTAO SUS FIELD ////////////////////
            
            const SizedBox(height: 40,),

            /////////////////////// CPF FIELD ////////////////////
            TextFormField(
              controller: _cpf,
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            //////////////////// CPF FIELD ////////////////////
            
          
          ],
        )
      ),
      //////////////////// STEP 1 ////////////////////
      
      Step(
        isActive: currentStep >= 1,
        title: Text('Endereço'), 
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //////////////////// CEP FIELD ////////////////////
            TextFormField(
              controller: _cep,
              decoration: const InputDecoration(labelText: 'Cep'),
            ),
            //////////////////// CEP FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// RUA FIELD ////////////////////
            TextFormField(
              controller: _rua,
              decoration: const InputDecoration(labelText: 'Rua'),
            ),
            //////////////////// RUA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// BAIRRO FIELD ////////////////////
            TextFormField(
              controller: _bairro,
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
            //////////////////// BAIRRO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// NUMERO FIELD ////////////////////
            TextFormField(
              controller: _numero,
              decoration: const InputDecoration(labelText: 'Número'),
            ),
            //////////////////// NUMERO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// COMPLEMENTO FIELD ////////////////////
            TextFormField(
              controller: _complemento,
              decoration: const InputDecoration(labelText: 'Complemento'),
            ),
            //////////////////// COMPLEMENTO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// CIDADE FIELD ////////////////////
            TextFormField(
              controller: _cidade,
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
            //////////////////// CIDADE FIELD ////////////////////
        ],)
      ),
      Step(
        isActive: currentStep >= 2,
        title: Text('Senha'), 
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //////////////////// SENHA FIELD ////////////////////
            TextFormField(
              controller: _senha,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            //////////////////// SENHA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// CONFIRMACAO SENHA FIELD ////////////////////
            TextFormField(
              controller: _confirmacaoSenha,
              decoration: const InputDecoration(labelText: 'Confirme sua senha'),
            ),
            //////////////////// CONFIRMACAO SENHA FIELD ////////////////////
            
            const SizedBox(height: 40,),
          ],
        )
      ),
    ];
}