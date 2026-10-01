-- ============================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS
-- Sistema de Préstamos y Casilleros UTT
-- ============================================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS sistema_prestamos;
CREATE DATABASE IF NOT EXISTS sistema_prestamos
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistema_prestamos;

-- ------------------------------------------------------------
-- 1. TABLAS CATÁLOGO BASE (LLAVES VARCHAR)
-- ------------------------------------------------------------
CREATE TABLE ADMINISTRADOR (

) ENGINE = INNODB



CREATE TABLE ROL (
    codigo VARCHAR(20) NOT NULL ,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;


CREATE TABLE CARRERAS (
    num VARCHAR(20) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    siglas VARCHAR(10) NOT NULL,
    PRIMARY KEY (num)
) ENGINE=InnoDB; 

CREATE TABLE ESTADO ( -- Cambiar name
    codigo VARCHAR(20) NOT NULL, 
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE TIPO_EQUIPO (
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE ESTADO_EQUIPO (
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE MARCA (
    clave VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (clave)
) ENGINE=InnoDB;

CREATE TABLE MODELO (
    clave INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    PRIMARY KEY (clave),
    CONSTRAINT fk_modelo_marca FOREIGN KEY (marca) 
        REFERENCES MARCA (clave) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE TIPO_PERIODO (
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE ESTADO_CASILLERO (
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE TIPO_MOVIMIENTO (
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 2. TABLAS PRINCIPALES (LLAVES NUM INT / FOREIGN KEYS VARCHAR)
-- ------------------------------------------------------------

CREATE TABLE USUARIOS (
    codigo INT AUTO_INCREMENT NOT NULL,
    identificacion VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NULL,
    email VARCHAR(150) NULL UNIQUE,
    estatus VARCHAR(50) NOT NULL DEFAULT 'Activo',
    codigo_barras VARCHAR(100) NULL UNIQUE,
    rol VARCHAR(20) NOT NULL,
    carreras VARCHAR(20) NULL, 
    PRIMARY KEY (codigo),
    CONSTRAINT fk_usuarios_rol FOREIGN KEY (rol) 
        REFERENCES ROL (codigo) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE EQUIPO (
    codigo INT AUTO_INCREMENT NOT NULL,
    codigo_barras VARCHAR(100) NULL UNIQUE,
    numero_serie VARCHAR(100) NULL,
    nombre VARCHAR(150) NOT NULL,
    num_inter VARCHAR(50) NULL,
    ubicacion VARCHAR(150) NULL,
    costo DECIMAL(10,2) NULL,
    num_utt VARCHAR(50) NULL,
    rf_resguardo VARCHAR(50) NULL,
    resguardante VARCHAR(50) NULL,
    resguardo VARCHAR(100) NULL,
    tipo_equipo VARCHAR(20) NOT NULL,
    estado_equipo VARCHAR(20) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_equipo_tipo FOREIGN KEY (tipo_equipo) 
        REFERENCES TIPO_EQUIPO (codigo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_equipo_estado FOREIGN KEY (estado_equipo) 
        REFERENCES ESTADO_EQUIPO (codigo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_equipo_marca FOREIGN KEY (marca) 
        REFERENCES MARCA (clave) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE CASILLERO (
    codigo INT AUTO_INCREMENT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    descripcion TEXT NULL,
    estado_casillero VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_casillero_estado FOREIGN KEY (estado_casillero) 
        REFERENCES ESTADO_CASILLERO (codigo) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE PERIODO_ESCOLAR (
    num INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    descripcion TEXT NULL,
    tipo_periodo VARCHAR(20) NOT NULL,
    PRIMARY KEY (num),
    CONSTRAINT fk_periodo_tipo FOREIGN KEY (tipo_periodo) 
        REFERENCES TIPO_PERIODO (codigo) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 3. TABLAS TRANSACCIONALES Y MENSAJERÍA
-- ------------------------------------------------------------

CREATE TABLE PRESTAMO (
    num INT AUTO_INCREMENT NOT NULL,
    folio VARCHAR(50) NOT NULL UNIQUE,
    credencial BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NULL,
    comentarios TEXT NULL,
    usuarios INT NOT NULL,
    estatus VARCHAR(20) NOT NULL,
    sanciones INT NULL DEFAULT 0,
    PRIMARY KEY (num),
    CONSTRAINT fk_prestamo_usuarios FOREIGN KEY (usuarios) 
        REFERENCES USUARIOS (codigo) ON DELETE CASCADE,
    CONSTRAINT fk_prestamo_estado FOREIGN KEY (estado) 
        REFERENCES ESTATUS (codigo) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ASIGNACION_CASILLERO (
    num INT AUTO_INCREMENT NOT NULL,
    folio VARCHAR(50) NOT NULL UNIQUE,
    llave BOOLEAN NULL,
    estatus VARCHAR(50) NOT NULL DEFAULT 'Activo',
    descripcion TEXT NULL,
    usuarios INT NOT NULL,
    casillero INT NOT NULL,
    tipo_movimiento VARCHAR(20) NOT NULL,
    periodo_escolar INT NOT NULL,
    PRIMARY KEY (num),
    CONSTRAINT fk_asig_usuarios FOREIGN KEY (usuarios) 
        REFERENCES USUARIOS (codigo) ON DELETE CASCADE,
    CONSTRAINT fk_asig_casillero FOREIGN KEY (casillero) 
        REFERENCES CASILLERO (codigo) ON DELETE CASCADE,
    CONSTRAINT fk_asig_movimiento FOREIGN KEY (tipo_movimiento) 
        REFERENCES TIPO_MOVIMIENTO (codigo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_asig_periodo FOREIGN KEY (periodo_escolar) 
        REFERENCES PERIODO_ESCOLAR (num) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE MENSAJES (
    codigo INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    prestamo INT NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_mensajes_prestamo FOREIGN KEY (prestamo) 
        REFERENCES PRESTAMO (num) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 4. TABLAS INTERMEDIAS (RELACIONES M:N)
-- ------------------------------------------------------------

CREATE TABLE EQUIPO_PRESTAMO (
    prestamo INT NOT NULL,
    equipo INT NOT NULL,
    PRIMARY KEY (prestamo, equipo),
    CONSTRAINT fk_ep_prestamo FOREIGN KEY (prestamo) 
        REFERENCES PRESTAMO (num) ON DELETE CASCADE,
    CONSTRAINT fk_ep_equipo FOREIGN KEY (equipo) 
        REFERENCES EQUIPO (codigo) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE USUARIOS_MENSAJES (
    usuarios INT NOT NULL,
    mensajes INT NOT NULL,
    PRIMARY KEY (usuarios, mensajes),
    CONSTRAINT fk_um_usuarios FOREIGN KEY (usuarios) 
        REFERENCES USUARIOS (codigo) ON DELETE CASCADE,
    CONSTRAINT fk_um_mensajes FOREIGN KEY (mensajes) 
        REFERENCES MENSAJES (codigo) ON DELETE CASCADE
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;

-- ------------------------------------------------------------
-- 5. DATOS INICIALES 
-- ------------------------------------------------------------

INSERT INTO ROL (codigo, nombre, descripcion) VALUES
('ALUM', 'Alumno', 'Estudiante activo de la UTT'),
('DOC', 'Docente', 'Profesor de asignatura'),
('ADMIN', 'Administrador', 'Personal encargado de inventario y préstamos');

INSERT INTO TIPO_MOVIMIENTO (codigo, nombre, descripcion) VALUES
('PRIMERA', 'Primera Vez', 'Primera asignación del casillero'),
('RENOV', 'Renovación', 'Extensión del préstamo de casillero'),
('CAMBIO', 'Cambio', 'Reasignación de casillero'),
('LIBER', 'Liberación', 'Devolución de casillero o cancelación');

INSERT INTO ESTADO_CASILLERO (codigo, nombre, descripcion) VALUES
('DISP', 'Disponible', 'Casillero libre para ser asignado'),
('OCUP', 'Ocupado', 'Casillero asignado actualmente'),
('MANT', 'Mantenimiento', 'Casillero fuera de servicio');

INSERT INTO ESTADO_EQUIPO (codigo, nombre, descripcion) VALUES
('DISP', 'Disponible', 'Equipo listo para préstamo'),
('PREST', 'En Préstamo', 'Equipo entregado a un usuario'),
('MANT', 'Mantenimiento', 'Equipo en revisión o reparación'),
('BAJA', 'Fuera de servicio', 'Equipo dado de baja');


INSERT INTO ESTADO (codigo, nombre, descripcion) VALUES
('ACT', 'Activo', 'Préstamo vigente'),
('CONC', 'Concluido', 'Equipo devuelto correctamente'),
('VENC', 'Vencido', 'Préstamo entregado fuera de tiempo');


-- CONSULTA PARA SACAR DATOS UTT 

SELECT 
    e.num_utt AS 'Num. de Inventario',
    e.nombre AS 'Descripcion del bien',
    e.costo AS 'Costo',
    m.nombre AS 'Marca',
    mo.nombre AS 'Modelo',
    e.numero_serie AS 'Numero de serie',
    e.resguardo AS Resguardo,
    e.rf_resguardo AS 'Referencia de Resguardo',
    e.resguardante AS Resguardante,
    e.ubicacion AS Ubicacion
FROM equipo AS e
INNER JOIN marca AS m ON m.clave = e.marca
LEFT JOIN modelo AS mo ON mo.marca = m.clave;  
