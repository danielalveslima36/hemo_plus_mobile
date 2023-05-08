enum TipoSanguineo{
  A_POSITIVO,
  A_NEGATIVO,
  B_POSITIVO,
  B_NEGATIVO,
  AB_POSITIVO,
  AB_NEGATIVO,
  O_POSITIVO,
  O_NEGATIVO,
}


extension TipoSanguineoDescricao on TipoSanguineo{
  
  String get descricao{
      switch(this){
        case TipoSanguineo.A_POSITIVO:
          return "A+";
        case TipoSanguineo.A_NEGATIVO:
          return "A-";
        case TipoSanguineo.B_POSITIVO:
          return "B+";
        case TipoSanguineo.B_NEGATIVO:
          return "B-";
        case TipoSanguineo.AB_POSITIVO:
          return "AB+";
        case TipoSanguineo.AB_NEGATIVO:
          return "AB-";
        case TipoSanguineo.O_POSITIVO:
          return "O+";
        case TipoSanguineo.O_NEGATIVO:
          return "O-";
      }
    
  }
}
