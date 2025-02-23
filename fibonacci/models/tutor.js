import { DataTypes } from "sequelize";
import db from "../config/conexion.js";

const TUTOR = db.define(
    'tutor',
    // atributos del modelo
    {
        nombre_tutor:{
            type: DataTypes.STRING(40),
            allowNull:false,
        },
        apellidos_tutor:{
            type:DataTypes.STRING(40),
            allowNull: false,
        },
        telefono_tutor:{
            type:DataTypes.STRING(10),
            primaryKey:true,
        }
    },
    // configuraciones basicas del modelo
    {
        tableName:'tutor',
        timestamps:false,
    }
);

export default TUTOR;