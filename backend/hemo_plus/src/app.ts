import express from "express";
import cors from "cors";
import "express-async-errors"; 
import { doadorRouter } from "./routes/DoadorRouter";
import bodyParser from "body-parser";

const app = express();
app.use(express.json());
app.use(cors());
app.use(doadorRouter)

export {app}


