import { Cor, EstadoCivil, Genero, TipoSanguineo } from "@prisma/client"
import { EnderecoModel } from "./EnderecoModel"

export interface DoadorModel {
    nome: string
    data_nascimento: Date
    genero: Genero
    estado_civil: EstadoCivil
    cor: Cor
    cartao_sus: string
    cpf: string
    senha: string
    tipo_sanguineo: TipoSanguineo
    peso: number
    altura: number
    telefone: string
    endereco: EnderecoModel
}