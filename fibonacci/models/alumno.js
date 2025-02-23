import db from "../config/conexion.js";

const ALUMNO = db.define(
    'alumno',
    {},
    {},
);

export default ALUMNO;