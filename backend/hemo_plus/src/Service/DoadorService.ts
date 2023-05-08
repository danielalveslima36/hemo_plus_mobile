import { Prisma } from "@prisma/client";
import { prisma } from "../prisma/Client";
import { DoadorModel } from "../Model/DoadorModel";

export class DoadorService {
    async create(doadorInput: DoadorModel) {

        const doadorAlreadyExists = await prisma.doador.findUnique({
            where:{
                cpf: doadorInput.cpf
            }
        });

        if (doadorAlreadyExists) {
            //throw new AppError("Doador ja existe")
        }

        doadorInput.data_nascimento = new Date(doadorInput.data_nascimento);
        const doadorCriado = await prisma.doador.create({data: doadorInput});

        return doadorCriado;
    }
}