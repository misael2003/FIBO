import express from "express";
import db from "./config/conexion.js";
import dotenv from "dotenv";

import router from "./routers/inicioRouter.js";


dotenv.config();
try {
    await db.authenticate();
    console.log("Conexion exitosa a la base de datos");
} catch (error) {console.log("Errror de conexion a la BD",error);}

const app = express();

// Configurar motor de plantillas

    app.set("view engine", "pug");
    app.set("views", "./views");
    app.use(express.static("public"));

// configuramos los enrutadores

    app.use("/",router);

// Definimos el puerto

    const PORT = process.env.PORT || 2800;
    app.listen(PORT, () => {
        console.log(`Servidor ejecutándose en el puerto ${PORT}`);
    });