-- ============================================
-- DATOS DE PRUEBA
-- Sistema Escolar Automatizado
-- ============================================

INSERT INTO escuelas (nombre, clave_cct, turno, direccion)
VALUES ('Escuela Primaria Demo', '09DPR0000X', 'Matutino', 'Ciudad de México');

INSERT INTO grados (numero_grado, nivel)
VALUES 
(1, 'Primaria'),
(2, 'Primaria'),
(3, 'Primaria');

INSERT INTO grupos (id_escuela, id_grado, nombre_grupo, ciclo_escolar)
VALUES 
(1, 1, 'A', '2025-2026'),
(1, 2, 'A', '2025-2026');

INSERT INTO alumnos (
    id_grupo, curp, nombre, apellido_paterno, apellido_materno,
    fecha_nacimiento, tutor_nombre, tutor_telefono, estatus
)
VALUES
(1, 'DEMO010101HDFXXX01', 'Juan', 'Pérez', 'López', '2018-01-01', 'María López', '5512345678', 'activo'),
(1, 'DEMO020202MDFXXX02', 'Ana', 'García', 'Ramírez', '2018-02-02', 'Carlos García', '5598765432', 'activo'),
(2, 'DEMO030303HDFXXX03', 'Luis', 'Martínez', 'Soto', '2017-03-03', 'Laura Soto', '5555555555', 'activo');

INSERT INTO docentes (
    nombre, apellido_paterno, apellido_materno, correo, telefono, estatus
)
VALUES
('Martha', 'Hernández', 'Ruiz', 'martha.demo@escuela.mx', '5511111111', 'activo'),
('Pedro', 'Sánchez', 'Morales', 'pedro.demo@escuela.mx', '5522222222', 'activo');

INSERT INTO materias (nombre, descripcion)
VALUES
('Matemáticas', 'Materia de razonamiento lógico y operaciones básicas'),
('Español', 'Materia de lectura, escritura y comprensión'),
('Ciencias Naturales', 'Materia de ciencias básicas');

INSERT INTO grupo_materia (id_grupo, id_materia, id_docente, ciclo_escolar)
VALUES
(1, 1, 1, '2025-2026'),
(1, 2, 1, '2025-2026'),
(2, 1, 2, '2025-2026');

INSERT INTO periodos (nombre, fecha_inicio, fecha_fin, ciclo_escolar)
VALUES
('Primer trimestre', '2025-08-26', '2025-11-29', '2025-2026'),
('Segundo trimestre', '2025-12-02', '2026-03-14', '2025-2026'),
('Tercer trimestre', '2026-03-17', '2026-07-16', '2025-2026');

INSERT INTO asistencias (id_alumno, id_grupo_materia, fecha, estado, observaciones)
VALUES
(1, 1, '2025-09-01', 'presente', NULL),
(2, 1, '2025-09-01', 'falta', 'No asistió'),
(3, 3, '2025-09-01', 'presente', NULL);

INSERT INTO calificaciones (id_alumno, id_grupo_materia, id_periodo, calificacion, observaciones)
VALUES
(1, 1, 1, 9.50, 'Buen desempeño'),
(2, 1, 1, 8.20, 'Puede mejorar participación'),
(3, 3, 1, 9.00, 'Constante en clase');

INSERT INTO reportes_tutoria (
    id_alumno, id_docente, fecha, tipo_reporte, observaciones, acciones_recomendadas
)
VALUES
(2, 1, '2025-09-05', 'Académico', 'Presenta algunas faltas recientes', 'Hablar con tutor y dar seguimiento');
