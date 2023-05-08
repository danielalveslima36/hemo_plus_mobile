import { Router } from "express";
import { DoadorController } from "../Controller/DoadorController";

const doadorController = new DoadorController();
const doadorRouter = Router();

doadorRouter.post("/doador", doadorController.create)

export {doadorRouter}