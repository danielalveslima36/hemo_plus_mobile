import 'package:flutter/material.dart';
import 'package:hemo_plus_mobile/Doador/model/doadorModel.dart';
import 'package:hemo_plus_mobile/Doador/service/DoadorService.dart';
import 'package:hemo_plus_mobile/enums/estadoCivil.dart';
import 'package:hemo_plus_mobile/enums/genero.dart';
import 'package:hemo_plus_mobile/enums/tipo_sanguineo.dart';
import 'package:hemo_plus_mobile/widget/customDropDown.dart';
import 'package:validatorless/validatorless.dart';

import '../../enums/cor.dart';

List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  int _currentStep = 0;
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
  late DoadorModel doador;
  late DoadorService doadorService;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      
      body: Stepper(
        type: StepperType.vertical,
        steps: getSteps(),
        currentStep: _currentStep,
        onStepContinue: () => {
          setState(() {
            if (formKeys[_currentStep].currentState!.validate()) {
              if (_currentStep < getSteps().length - 1 ) {
                _currentStep +=  1;
              }
              else{
                doador = CriarDoador();
                doadorService = DoadorService();
                print(doadorService.post(doador));
              }
            }
        
          } ),
        },
        onStepCancel: () => {
          _currentStep == 0 ? null : setState(() => _currentStep -= 1)
        },

      )
    );
  }

  List<Step> getSteps() => [
    //////////////////// STEP 1 ////////////////////
      Step(
        isActive: _currentStep >= 0,
        title: const Text('Pessoal'), 
        content: Form(
          key: formKeys[0],
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //////////////////// NAME FIELD ////////////////////
            TextFormField(
              controller: _nome,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: Validatorless.required("Nome obrigatorio"),
            ),
            //////////////////// NAME FIELD ////////////////////
            const SizedBox(height: 40,),

            /////////////////////// ALTURA FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _altura,
              decoration: const InputDecoration(labelText: 'Altura'),
              validator: Validatorless.required("Altura obrigatorio"),
            ),
            /////////////////////// ALTURA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            ////////////////////////// PESO FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _peso,
              decoration: const InputDecoration(labelText: 'Peso'),
              validator: Validatorless.required("Peso obrigatorio"),
            ),
            /////////////////////// PESO FIELD ///////////////////////
            
            const SizedBox(height: 40,),

            ///////////////////////////// TELEFONE FIELD ////////////////////
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _telefone,
              decoration: const InputDecoration(labelText: 'Telefone'),
              validator: Validatorless.required("Telefone obrigatorio"),
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
              validate: "Genero Obrigatorio",
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
              validate: "Estado Civil Obrigatorio",
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
              validate: "Cor Obrigatorio",
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
            
            DropdownButtonFormField(
                isExpanded: true,
                value: _tipoSanguineo,
                onChanged: (value) {
                  setState(() {
                    _tipoSanguineo = value!;
                  });
                },
                validator: (dropValue) => dropValue == null ? 'Tipo Sanguineo Obrigatorio' : null, 
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
              validator: Validatorless.required("Cartao do SUS obrigatorio"),

            ),
            //////////////////// CARTAO SUS FIELD ////////////////////
            
            const SizedBox(height: 40,),

            /////////////////////// CPF FIELD ////////////////////
            TextFormField(
              controller: _cpf,
              decoration: const InputDecoration(labelText: 'CPF'),
              validator: Validatorless.required("CPF obrigatorio"),
            ),
            //////////////////// CPF FIELD ////////////////////
          
          ],
        )
        )
      ),
      //////////////////// STEP 1 ////////////////////
      
      Step(
        isActive: _currentStep >= 1,
        title: Text('Endereço'), 
        content: Form(
          key: formKeys[1],
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //////////////////// CEP FIELD ////////////////////
            TextFormField(
              controller: _cep,
              decoration: const InputDecoration(labelText: 'Cep'),
              validator: Validatorless.required("Cep obrigatorio"),
            ),
            //////////////////// CEP FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// RUA FIELD ////////////////////
            TextFormField(
              controller: _rua,
              decoration: const InputDecoration(labelText: 'Rua'),
              validator: Validatorless.required("Rua obrigatorio"),
            ),
            //////////////////// RUA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// BAIRRO FIELD ////////////////////
            TextFormField(
              controller: _bairro,
              decoration: const InputDecoration(labelText: 'Bairro'),
              validator: Validatorless.required("Bairro obrigatorio"),
            ),
            //////////////////// BAIRRO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// NUMERO FIELD ////////////////////
            TextFormField(
              controller: _numero,
              decoration: const InputDecoration(labelText: 'Número'),
              validator: Validatorless.required("Numero obrigatorio"),
            ),
            //////////////////// NUMERO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// COMPLEMENTO FIELD ////////////////////
            TextFormField(
              controller: _complemento,
              decoration: const InputDecoration(labelText: 'Complemento'),
              validator: Validatorless.required("Complemento obrigatorio"),
            ),
            //////////////////// COMPLEMENTO FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// CIDADE FIELD ////////////////////
            TextFormField(
              controller: _cidade,
              decoration: const InputDecoration(labelText: 'Cidade'),
              validator: Validatorless.required("Cidade obrigatorio"),
            ),
            //////////////////// CIDADE FIELD ////////////////////
        ],),
        )
      ),
      Step(
        isActive: _currentStep >= 2,
        title: Text('Senha'), 
        content: Form(
          key: formKeys[2],
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //////////////////// SENHA FIELD ////////////////////
            TextFormField(
              controller: _senha,
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: Validatorless.required("Cidade obrigatorio"),

            ),
            //////////////////// SENHA FIELD ////////////////////
            
            const SizedBox(height: 40,),

            //////////////////// CONFIRMACAO SENHA FIELD ////////////////////
            TextFormField(
              controller: _confirmacaoSenha,
              decoration: const InputDecoration(labelText: 'Confirme sua senha'),
              //TODO: FAZER A PARTE DE COMPARACAO E VALIDACAO DE SENHA
            ),
            //////////////////// CONFIRMACAO SENHA FIELD ////////////////////
            
            const SizedBox(height: 40,),
          ],
        ),
        )
      ),
    ];
    
      DoadorModel CriarDoador() {
        return DoadorModel(nome: _nome.text,
         dataNascimento: DateTime(1999,7,2),
         genero: _generoValue!, estadoCivil: _estadoCivilValue!,
         cor: _corValue!, cartaoSus: _cartaoSus.text, cpf: _cpf.text,
         senha: _senha.text, tipoSanguineo: _tipoSanguineo!, peso: double.parse(_peso.text),
          altura: double.parse(_altura.text), telefone: _telefone.text);
      }
} 