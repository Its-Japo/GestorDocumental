CREATE USER IF NOT EXISTS postgres
WITH
    PASSWORD 'root';

GRANT ALL PRIVILEGES ON DATABASE gestor_documental TO postgres;

CREATE TABLE
    DOCUMENTO (
        documentoId SERIAL PRIMARY KEY,
        expedienteId INT NOT NULL,
        nombre VARCHAR(255) NOT NULL,
        tipoDocumento VARCHAR(255) NOT NULL,
        FOREIGN KEY (expedienteId) REFERENCES EXPEDIENTE (expedienteId)
    );

CREATE TABLE
    EXPEDIENTE (expedienteId INT PRIMARY KEY NOT NULL);

CREATE TABLE
    PROYECTO (
        proyectoId SERIAL PRIMARY KEY NOT NULL,
        nombre VARCHAR(255) NOT NULL,
        plantilla VARCHAR(255) NOT NULL
    );

CREATE TABLE
    TIPO_DATO (
        tipoDatoId SERIAL PRIMARY KEY NOT NULL,
        nombre VARCHAR(255) NOT NULL
    );

CREATE TABLE
    CAMPO (
        campoId SERIAL PRIMARY KEY NOT NULL,
        nombre VARCHAR(255) NOT NULL
    );

CREATE TABLE
    VALOR (
        correlativo INT NOT NULL,
        proyectoId INT NOT NULL,
        expedienteId INT NOT NULL,
        valor VARCHAR(255) NOT NULL,
        PRIMARY KEY (correlativo, proyectoId),
        FOREIGN KEY (correlativo) REFERENCES INDICE (correlativo),
        FOREIGN KEY (proyectoId) REFERENCES INDICE (proyectoId),
        FOREIGN KEY (expedienteId) REFERENCES EXPEDIENTE (expedienteId)
    );

CREATE TABLE
    INDICE (
        correlativo INT NOT NULL,
        proyectoId INT NOT NULL,
        nombre INT NOT NULL,
        tipoDato INT NOT NULL,
        requerido BOOLEAN NOT NULL,
        PRIMARY KEY (correlativo, proyectoId),
        FOREIGN KEY (tipoDato) REFERENCES TIPO_DATO (tipoDatoId),
        FOREIGN KEY (nombre) REFERENCES CAMPO (campoId),
        FOREIGN KEY (proyectoId) REFERENCES PROYECTO (proyectoId)
    );

-- Tabla usuario
CREATE TABLE
    usuario (
        userid SERIAL PRIMARY KEY,
        username VARCHAR(50) UNIQUE NOT NULL,
        passwordHash CHAR(64) NOT NULL,
        correo VARCHAR(100)
    );

-- Tabla rol
CREATE TABLE
    rol (
        roleid SERIAL PRIMARY KEY,
        nombre VARCHAR(50) UNIQUE NOT NULL,
        descripcion TEXT
    );

-- Tabla de roles asigandos (muchos a muchos)
CREATE TABLE
    rol_asignado (
        userid INT NOT NULL,
        roleid INT NOT NULL,
        PRIMARY KEY (userid, roleid),
        FOREIGN KEY (userid) REFERENCES usuario (userid) ON DELETE CASCADE,
        FOREIGN KEY (roleid) REFERENCES rol (roleid) ON DELETE CASCADE
    );

-- Tabla permiso
CREATE TABLE
    permiso (
        permisoid SERIAL PRIMARY KEY,
        nombre VARCHAR(50) UNIQUE NOT NULL,
        descripcion TEXT
    );

-- Tabla de los permisos asociados (muchos a muchos)
CREATE TABLE
    permiso_asociado (
        permisoid INT NOT NULL,
        roleid INT NOT NULL,
        PRIMARY KEY (permisoid, roleid),
        FOREIGN KEY (permisoid) REFERENCES permiso (permisoid) ON DELETE CASCADE,
        FOREIGN KEY (roleid) REFERENCES rol (roleid) ON DELETE CASCADE
    );

-- Tabla de logs
CREATE TABLE
    log_sesion (idLog SERIAL PRIMARY KEY);

-- Tabla de los detalles de un log
CREATE TABLE
    detalle_log (
        userid INT NOT NULL,
        idLog INT NOT NULL,
        fecha DATE NOT NULL,
        hora TIME NOT NULL,
        accion TEXT,
        token UUID, --hay que platicar si este tipo de dato esá bien--
        FOREIGN KEY (userid) REFERENCES usuario (userid) ON DELETE CASCADE,
        FOREIGN KEY (idLog) REFERENCES log_sesion (idLog) ON DELETE CASCADE
    );