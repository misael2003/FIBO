SET NAMES 'latin1';
DROP DATABASE IF EXISTS fibonacci;
CREATE DATABASE IF NOT EXISTS fibonacci;
USE fibonacci;

/*Tablas en relacion a los trabajadores de la academia*/

    CREATE TABLE sueldo(
        id_sueldo INTEGER NOT NULL,
        horas INT NOT NULL,
        precio_hora DOUBLE NOT NULL,
        sueldo_total DOUBLE NOT NULL,
        PRIMARY KEY(id_sueldo)
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE trabajador(

        id_trabajador VARCHAR(10) NOT NULL,
        nombre_trabajador VARCHAR(40) NOT NULL,
        apellidos_trabajador VARCHAR(40) NOT NULL,
        correo_trabajador VARCHAR(40) NOT NULL UNIQUE,
        numero_trabajador VARCHAR(10) NOT NULL UNIQUE,
        ocupacion VARCHAR(40) NOT NULL,
        CURP VARCHAR(18) NOT NULL UNIQUE,
        RFC VARCHAR(13) NOT NULL UNIQUE,
        id_sueldo INTEGER NOT NULL,

        PRIMARY KEY(id_trabajador),
        CONSTRAINT FK_ID_SUELDO_NO_EXISTE FOREIGN KEY(id_sueldo) REFERENCES sueldo(id_sueldo) 

    )DEFAULT CHARACTER SET utf8;

/*Tablas en relacion a los maestros*/

    CREATE TABLE maestro(
        id_maestro INT NOT NULL AUTO_INCREMENT,
        id_trabajador VARCHAR(10),
        PRIMARY KEY(id_maestro),
        CONSTRAINT FK_ID_TRABAJADOR_YA_EXISTE UNIQUE(id_trabajador),
        CONSTRAINT FK_ID_TRABAJADOR_NO_EXISTE FOREIGN KEY(id_trabajador) REFERENCES trabajador(id_trabajador) 
    )DEFAULT CHARACTER SET utf8;

    /* Relacion a grupos, paquetes y materias*/

        CREATE TABLE paquete(
            id_paquete INT NOT NULL AUTO_INCREMENT,
            nombre_paquete VARCHAR(40) NOT NULL UNIQUE,
            costo_paquete DOUBLE NOT NULL,
            PRIMARY KEY(id_paquete)
        )DEFAULT CHARACTER SET utf8;

        CREATE TABLE materia(
            id_materia INT NOT NULL AUTO_INCREMENT,
            nombre_materia VARCHAR(40) NOT NULL UNIQUE,
            PRIMARY KEY(id_materia)
        )DEFAULT CHARACTER SET utf8;

        CREATE TABLE salon(
            nombre_salon VARCHAR(20) NOT NULL,
            cupo_salon int NOT NULL,
            PRIMARY KEY(nombre_salon)
        ) DEFAULT CHARACTER SET utf8;

        CREATE TABLE grupo(
            id_grupo INT NOT NULL AUTO_INCREMENT,
            nombre_grupo VARCHAR(40) NOT NULL,

            nombre_salon VARCHAR(20) NOT NULL,
            id_maestro INT NOT NULL,
            id_paquete INT NOT NULL,

            PRIMARY KEY(id_grupo),
            CONSTRAINT FK_ID_SALON_NO_EXISTE FOREIGN KEY(nombre_salon) REFERENCES salon(nombre_salon),
            
            CONSTRAINT FK_ID_PAQUETE__ FOREIGN KEY(id_paquete) REFERENCES paquete(id_paquete)
        ) DEFAULT CHARACTER SET utf8;

        CREATE TABLE maestro_materia(
            id_maestro INT NOT NULL,
            id_materia INT NOT NULL,
            CONSTRAINT FK_ID_MAESTRO FOREIGN KEY(id_maestro) REFERENCES maestro(id_maestro),
            CONSTRAINT FK_ID_MATERIA FOREIGN KEY(id_materia) REFERENCES materia(id_materia)
        )DEFAULT CHARACTER SET utf8;

        CREATE TABLE paquete_materia(
            id_paquete INT NOT NULL, 
            id_materia INT NOT NULL,
            CONSTRAINT FK_ID_PAQUETE FOREIGN KEY(id_paquete) REFERENCES paquete(id_paquete),
            CONSTRAINT FK_ID_MATERIA__ FOREIGN KEY(id_materia) REFERENCES materia(id_materia)
        )DEFAULT CHARACTER SET utf8;

/*Tablas en relacion a los alumnos*/

    CREATE TABLE escuela(
        nombre_escuela VARCHAR(100) NOT NULL UNIQUE,
        tipo_escuela VARCHAR(30) NOT NULL,
        PRIMARY KEY(nombre_escuela)
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE tutor(
        nombre_tutor VARCHAR(40) NOT NULL,
        apellidos_tutor VARCHAR(40) NOT NULL,
        telefono_tutor VARCHAR(10) UNIQUE NOT NULL,
        PRIMARY KEY(telefono_tutor)
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE alumno(

        id_alumno VARCHAR(10) NOT NULL,
        nombre_alumno VARCHAR(40) NOT NULL,
        apellidos_alumno VARCHAR(40) NOT NULL,
        edad_alumno INT NOT NULL,
        domicilio_alumno VARCHAR(200) NOT NULL,
        telefono_alumno VARCHAR(10),

        nombre_escuela VARCHAR(100),
        telefono_tutor VARCHAR(10),
        id_grupo INT NOT NULL,
        
        PRIMARY KEY(id_alumno),
        CONSTRAINT FK_ID_ESCUELA_NO_EXISTE FOREIGN KEY(nombre_escuela) REFERENCES escuela(nombre_escuela),
        CONSTRAINT FK_ID_TUTOR_NO_EXISTE FOREIGN KEY(telefono_tutor) REFERENCES tutor(telefono_tutor),
        CONSTRAINT FK_ID_GRUPO____ FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE usuarioPlataforma(
        id_alumno VARCHAR(10) NOT NULL,
        nombre_usuario VARCHAR(10) NOT NULL,
        contrasena_usuario VARCHAR(8) NOT NULL UNIQUE,
        CONSTRAINT FK_ID_ALUMNO_YA_EXISTE UNIQUE(id_alumno),
        CONSTRAINT FK_ID_ALUMNO_NO_EXISTE FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno) 
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE pago(
        folio_pago VARCHAR(10) NOT NULL,
        id_paquete INT NOT NULL,
        descuento DOUBLE NOT NULL,
        costo_pago DOUBLE NOT NULL,
        id_alumno VARCHAR(10) NOT NULL,

        PRIMARY KEY(folio_pago),
        CONSTRAINT FK_ID_alumno____ FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno),
        CONSTRAINT FK_ID_paquete____ FOREIGN KEY(id_paquete) REFERENCES paquete(id_paquete) 
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE reporte(
        tipo_reporte VARCHAR(100) NOT NULL,
        descripccion_reporte TEXT NOT NULL,
        PRIMARY KEY(tipo_reporte)
    )DEFAULT CHARACTER SET utf8;

    CREATE TABLE reporte_alumno(
        tipo_reporte VARCHAR(100) NOT NULL,
        id_alumno VARCHAR(10) NOT NULL,

        CONSTRAINT FK_ID_ALUMNO_____ FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno),
        CONSTRAINT FK_ID_REPORTE____ FOREIGN KEY(tipo_reporte) REFERENCES reporte(tipo_reporte) 
    )DEFAULT CHARACTER SET utf8;