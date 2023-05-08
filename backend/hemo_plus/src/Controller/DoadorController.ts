import { Request, Response } from "express";
import { DoadorService } from "../Service/DoadorService";
import { DoadorModel } from "../Model/DoadorModel";
import { Prisma } from "@prisma/client";
import { EnderecoModel } from "../Model/EnderecoModel";
import { EnderecoService } from "../Service/EnderecoService";

export class DoadorController {
    async create(req: Request, res: Response) {

        const doador:DoadorModel = req.body.doador
        const endereco:EnderecoModel = req.body.endereco

        const doadorService = new DoadorService();
        const enderecoService = new EnderecoService();

        const novoDoador = await doadorService.create(doador);
        
        endereco.doadorId = novoDoador.id;
        const novoEndereco = await enderecoService.create(endereco);

        return res.status(201).json({DoadorId:novoDoador.id});
    }
}