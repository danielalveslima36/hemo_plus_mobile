import 'package:flutter/material.dart';
import 'package:hemo_plus_mobile/enums/cor.dart';
import 'package:hemo_plus_mobile/enums/estadoCivil.dart';
import 'package:hemo_plus_mobile/enums/genero.dart';
import 'package:hemo_plus_mobile/enums/tipo_sanguineo.dart';

class DoadorModel{
  String nome;
  DateTime dataNascimento;
  Genero genero;
  EstadoCivil estadoCivil;
  Cor cor;
  String cartaoSus;
  String cpf;
  String senha;
  TipoSanguineo tipoSanguineo;
  double peso;
  double altura;
  String telefone;

  DoadorModel({required this.nome,
   required this.dataNascimento, required this.genero,
   required this.estadoCivil, required this.cor,
   required this.cartaoSus, required this.cpf, required this.senha,
   required this.tipoSanguineo, required this.peso,
   required this.altura, required this.telefone});

   factory DoadorModel.fromJson(Map<String, dynamic> json) => DoadorModel(
      nome: json['nome'],
      dataNascimento: json['data_nascimento'],
      genero: json['genero'],
      estadoCivil: json['estado_civil'],
      cor: json['cor'],
      cartaoSus: json['cartao_sus'],
      cpf: json['cpf'],
      senha: json['senha'],
      tipoSanguineo: json['tipo_sanguineo'],
      peso: json['peso'],
      altura: json['altura'],
      telefone: json['telefone'],
   );

   Map<String, dynamic> toJson() => {
    "nome": nome,
    "data_nascimento": dataNascimento,
    "genero": genero,
    "estado_civil": estadoCivil,
    "cor": cor,
    "cartao_sus": cartaoSus,
    "cpf": cpf,
    "senha": senha,
    "tipo_sanguineo": tipoSanguineo,
    "peso": peso,
    "altura": altura,
    "telefone": telefone,
   };
}