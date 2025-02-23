import express from "express";
import { inicioAdmin } from "../../controllers/administrador/administradorController.js";

const routerAdmin = express.Router();
routerAdmin.get("/admin",inicioAdmin);

export default routerAdmin;