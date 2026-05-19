-- ============================================
-- SISTEMA ESCOLAR AUTOMATIZADO
-- Esquema inicial de base de datos
-- PostgreSQL
-- ============================================

CREATE TABLE escuelas (
    id_escuela SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    clave_cct VARCHAR(20) UNIQUE,
    turno VARCHAR(50),
    direccion TEXT
);

CREATE TABLE grados (
    id_grado SERIAL PRIMARY KEY,
    numero_grado INT NOT NULL,
    nivel VARCHAR(50) NOT NULL
);

CREATE TABLE grupos (
    id_grupo SERIAL PRIMARY KEY,
    id_escuela INT NOT NULL,
    id_grado INT NOT NULL,
    nombre_grupo VARCHAR(10) NOT NULL,
    ciclo_escolar VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_escuela) REFERENCES escuelas(id_escuela),
    FOREIGN KEY (id_grado) REFERENCES grados(id_grado)
);

CREATE TABLE alumnos (
    id_alumno SERIAL PRIMARY KEY,
    id_grupo INT NOT NULL,
    curp VARCHAR(18) UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100),
    fecha_nacimiento DATE,
    tutor_nombre VARCHAR(150),
    tutor_telefono VARCHAR(20),
    estatus VARCHAR(30) DEFAULT 'activo',

    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);

CREATE TABLE docentes (
    id_docente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100),
    correo VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    estatus VARCHAR(30) DEFAULT 'activo'
);

CREATE TABLE materias (
    id_materia SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE grupo_materia (
    id_grupo_materia SERIAL PRIMARY KEY,
    id_grupo INT NOT NULL,
    id_materia INT NOT NULL,
    id_docente INT NOT NULL,
    ciclo_escolar VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia),
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente)
);

CREATE TABLE periodos (
    id_periodo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    ciclo_escolar VARCHAR(20) NOT NULL
);

CREATE TABLE asistencias (
    id_asistencia SERIAL PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_grupo_materia INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    observaciones TEXT,

    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo_materia) REFERENCES grupo_materia(id_grupo_materia)
);

CREATE TABLE calificaciones (
    id_calificacion SERIAL PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_grupo_materia INT NOT NULL,
    id_periodo INT NOT NULL,
    calificacion NUMERIC(5,2) NOT NULL,
    observaciones TEXT,

    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo_materia) REFERENCES grupo_materia(id_grupo_materia),
    FOREIGN KEY (id_periodo) REFERENCES periodos(id_periodo)
);

CREATE TABLE reportes_tutoria (
    id_reporte SERIAL PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_docente INT NOT NULL,
    fecha DATE NOT NULL,
    tipo_reporte VARCHAR(100),
    observaciones TEXT,
    acciones_recomendadas TEXT,

    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente)
);
