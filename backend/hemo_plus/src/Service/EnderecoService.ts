import { Prisma } from "@prisma/client";
import { prisma } from "../prisma/Client";
import { EnderecoModel } from "../Model/EnderecoModel";

export class EnderecoService {
    async create(enderecoInput: EnderecoModel) {

        const enderecoCriado = await prisma.endereco.create({data:enderecoInput});

        return enderecoCriado;
    }
}