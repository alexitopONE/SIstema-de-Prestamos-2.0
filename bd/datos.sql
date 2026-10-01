USE sistema_prestamos;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 1. TABLAS CATÁLOGO BASE
-- ============================================================

INSERT INTO ROL (codigo, nombre, descripcion) VALUES
('ALUM', 'Alumno', 'Estudiante activo de la UTT'),
('DOC', 'Docente', 'Profesor de asignatura'),
('ADMIN', 'Administrador', 'Personal encargado de inventario y préstamos'),
('LAB', 'Encargado de Laboratorio', 'Personal técnico responsable de talleres y laboratorios'),
('MANT', 'Personal de Mantenimiento', 'Personal encargado de la reparación de casilleros y equipos'),
('VIS', 'Visitante / Externo', 'Personal externo con permiso especial de préstamo'),
('COORD', 'Coordinador Académico', 'Supervisión académica de uso de instalaciones');

INSERT INTO ESTADO (codigo, nombre, descripcion) VALUES
('ACT', 'Activo', 'Préstamo vigente'),
('CONC', 'Concluido', 'Equipo devuelto correctamente'),
('VENC', 'Vencido', 'Préstamo entregado fuera de tiempo'),
('CANC', 'Cancelado', 'Préstamo cancelado antes de entrega'),
('PARC', 'Parcial', 'Devolución parcial del equipo');

INSERT INTO TIPO_EQUIPO (codigo, nombre, descripcion) VALUES
('LAP', 'Laptop / Portátil', 'Equipos de cómputo portátiles'),
('PROY', 'Proyector', 'Proyectores de video e iluminación'),
('HERR', 'Herramienta Mecánica', 'Kits y herramientas de taller'),
('MULT', 'Multímetro / Medidor', 'Instrumentos de medición eléctrica'),
('TABLET', 'Tableta Digitalizadora', 'Dispositivos táctiles para diseño'),
('CAM', 'Cámara Fotográfica', 'Equipos fotográficos y de video'),
('RED', 'Kit de Redes', 'Switches, ponchadoras y probadores de cable');

INSERT INTO ESTADO_EQUIPO (codigo, nombre, descripcion) VALUES
('DISP', 'Disponible', 'Equipo listo para préstamo'),
('PREST', 'En Préstamo', 'Equipo entregado a un usuario'),
('MANT', 'Mantenimiento', 'Equipo en revisión o reparación'),
('BAJA', 'Fuera de servicio', 'Equipo dado de baja');

INSERT INTO MARCA (clave, nombre) VALUES
('DELL', 'Dell Technologies'),
('HP', 'Hewlett-Packard'),
('LEN', 'Lenovo'),
('EPSON', 'Epson'),
('FLUKE', 'Fluke Corporation'),
('TRUPER', 'Truper'),
('CANON', 'Canon'),
('CISCO', 'Cisco Systems');

INSERT INTO MODELO (clave, nombre, marca) VALUES
(1, 'Latitude 3420', 'DELL'),
(2, 'ThinkPad L14', 'LEN'),
(3, 'PowerLite E20', 'EPSON'),
(4, 'Multímetro Digital 117', 'FLUKE'),
(5, 'ProBook 450 G8', 'HP'),
(6, 'Juego de Desarmadores PRO', 'TRUPER'),
(7, 'EOS Rebel T7', 'CANON'),
(8, 'Switch Catalyst 2960', 'CISCO');

INSERT INTO TIPO_PERIODO (codigo, nombre, descripcion) VALUES
('ENE-ABR', 'Enero - Abril', 'Primer cuatrimestre del año'),
('MAY-AGO', 'Mayo - Agosto', 'Segundo cuatrimestre del año'),
('SEP-DIC', 'Septiembre - Diciembre', 'Tercer cuatrimestre del año'),
('VERANO', 'Cursos de Verano', 'Periodo intensivo de verano'),
('ANUAL', 'Anualidades', 'Periodo de proyectos anuales'),
('EXTEM', 'Extemporáneo', 'Periodos de regularización o especial'),
('EVAL', 'Evaluación', 'Semanas de evaluación e inventario');

INSERT INTO ESTADO_CASILLERO (codigo, nombre, descripcion) VALUES
('DISP', 'Disponible', 'Casillero libre para ser asignado'),
('OCUP', 'Ocupado', 'Casillero asignado actualmente'),
('MANT', 'Mantenimiento', 'Casillero fuera de servicio');

INSERT INTO TIPO_MOVIMIENTO (codigo, nombre, descripcion) VALUES
('PRIMERA', 'Primera Vez', 'Primera asignación del casillero'),
('RENOV', 'Renovación', 'Extensión del préstamo de casillero'),
('CAMBIO', 'Cambio', 'Reasignación de casillero'),
('LIBER', 'Liberación', 'Devolución de casillero o cancelación');


-- ============================================================
-- 2. TABLAS PRINCIPALES
-- ============================================================

INSERT INTO USUARIOS (identificacion, nombre, apellido_paterno, apellido_materno, email, estatus, codigo_barras, sanciones, rol) VALUES
('UTT2024001', 'Carlos', 'Gómez', 'Hernández', 'carlos.gomez@utt.edu.mx', 'Activo', 'BAR-001', 0, 'ALUM'),
('UTT2024002', 'María', 'López', 'Pérez', 'maria.lopez@utt.edu.mx', 'Activo', 'BAR-002', 0, 'ALUM'),
('UTT2024003', 'Juan', 'Martínez', 'Sánchez', 'juan.martinez@utt.edu.mx', 'Activo', 'BAR-003', 1, 'ALUM'),
('UTT2024004', 'Ana', 'Rodríguez', 'Torres', 'ana.rodriguez@utt.edu.mx', 'Activo', 'BAR-004', 0, 'DOC'),
('UTT2024005', 'Roberto', 'Soto', 'Ramírez', 'roberto.soto@utt.edu.mx', 'Activo', 'BAR-005', 0, 'DOC'),
('UTT2024006', 'Laura', 'Fernández', 'Castillo', 'laura.fernandez@utt.edu.mx', 'Activo', 'BAR-006', 0, 'ADMIN'),
('UTT2024007', 'Diego', 'Morales', 'Vásquez', 'diego.morales@utt.edu.mx', 'Activo', 'BAR-007', 2, 'ALUM'),
('UTT2024008', 'Sofia', 'Mendoza', 'Ibarra', 'sofia.mendoza@utt.edu.mx', 'Inactivo', 'BAR-008', 0, 'ALUM');

INSERT INTO EQUIPO (codigo_barras, numero_serie, nombre, num_inter, ubicacion, costo, num_utt, rf_resguardo, resguardante, resguardo, tipo_equipo, estado_equipo, marca) VALUES
('EQ-001', 'SN-DELL-9001', 'Laptop Dell Latitude 3420', 'INT-01', 'Edificio A - Lab 1', 18500.00, 'UTT-INV-001', 'RF-101', 'Ing. Laura Fernández', 'Doc. Firma 2024-A', 'LAP', 'DISP', 'DELL'),
('EQ-002', 'SN-LEN-8821', 'Laptop Lenovo ThinkPad L14', 'INT-02', 'Edificio A - Lab 1', 19200.00, 'UTT-INV-002', 'RF-102', 'Ing. Laura Fernández', 'Doc. Firma 2024-A', 'LAP', 'PREST', 'LEN'),
('EQ-003', 'SN-EPS-3312', 'Proyector Epson PowerLite E20', 'INT-03', 'Almacén Central', 12300.00, 'UTT-INV-003', 'RF-103', 'Lic. Roberto Soto', 'Doc. Firma 2024-B', 'PROY', 'DISP', 'EPSON'),
('EQ-004', 'SN-FLK-4490', 'Multímetro Digital Fluke 117', 'INT-04', 'Edificio B - Lab Electrónica', 6500.00, 'UTT-INV-004', 'RF-104', 'Dra. Ana Rodríguez', 'Doc. Firma 2024-C', 'MULT', 'DISP', 'FLUKE'),
('EQ-005', 'SN-HP-7711', 'Laptop HP ProBook 450 G8', 'INT-05', 'Edificio A - Lab 2', 17800.00, 'UTT-INV-005', 'RF-105', 'Ing. Laura Fernández', 'Doc. Firma 2024-A', 'LAP', 'MANT', 'HP'),
('EQ-006', 'SN-TRU-0012', 'Juego de Desarmadores Profesional', 'INT-06', 'Taller de Mecatrónica', 1450.00, 'UTT-INV-006', 'RF-106', 'Dra. Ana Rodríguez', 'Doc. Firma 2024-C', 'HERR', 'DISP', 'TRUPER'),
('EQ-007', 'SN-CAN-5541', 'Cámara Fotográfica EOS Rebel T7', 'INT-07', 'Laboratorio de Audiovisuales', 14200.00, 'UTT-INV-007', 'RF-107', 'Lic. Roberto Soto', 'Doc. Firma 2024-B', 'CAM', 'PREST', 'CANON'),
('EQ-008', 'SN-CIS-9901', 'Switch Cisco Catalyst 2960', 'INT-08', 'Laboratorio de Redes', 22000.00, 'UTT-INV-008', 'RF-108', 'Ing. Laura Fernández', 'Doc. Firma 2024-A', 'RED', 'DISP', 'CISCO'),
-- Equipos adicionales con campos NULL opcionales
(NULL, NULL, 'Kit de Cables de Red Cat6', NULL, 'Almacén Central', 450.00, NULL, NULL, NULL, NULL, 'RED', 'DISP', 'CISCO'),
('EQ-010', NULL, 'Proyector Portátil Epson', 'INT-10', NULL, NULL, 'UTT-INV-010', NULL, 'Lic. Roberto Soto', NULL, 'PROY', 'DISP', 'EPSON'),
(NULL, 'SN-DELL-9988', 'Laptop Dell de Inspección', NULL, 'Edificio B - Taller', 15000.00, NULL, 'RF-110', NULL, 'Doc. Interno', 'LAP', 'MANT', 'DELL'),
(NULL, NULL, 'Multímetro Básico de Gancho', NULL, NULL, 1200.00, NULL, NULL, NULL, NULL, 'MULT', 'DISP', 'FLUKE');

INSERT INTO CASILLERO (numero, descripcion, estado_casillero) VALUES
('CAS-01', 'Casillero Edificio A - Planta Baja', 'OCUP'),
('CAS-02', 'Casillero Edificio A - Planta Baja', 'DISP'),
('CAS-03', 'Casillero Edificio A - Planta Baja', 'DISP'),
('CAS-04', 'Casillero Edificio B - Primer Piso', 'OCUP'),
('CAS-05', 'Casillero Edificio B - Primer Piso', 'MANT'),
('CAS-06', 'Casillero Edificio B - Primer Piso', 'DISP'),
('CAS-07', 'Casillero Edificio C - Taller', 'OCUP'),
('CAS-08', 'Casillero Edificio C - Taller', 'DISP');

INSERT INTO PERIODO_ESCOLAR (nombre, fecha_inicio, fecha_final, descripcion, tipo_periodo) VALUES
('Enero - Abril 2025', '2025-01-08', '2025-04-25', 'Periodo Ordinario Ene-Abr 2025', 'ENE-ABR'),
('Mayo - Agosto 2025', '2025-05-06', '2025-08-22', 'Periodo Ordinario May-Ago 2025', 'MAY-AGO'),
('Septiembre - Diciembre 2025', '2025-09-01', '2025-12-18', 'Periodo Ordinario Sep-Dic 2025', 'SEP-DIC'),
('Enero - Abril 2026', '2026-01-07', '2026-04-24', 'Periodo Ordinario Ene-Abr 2026', 'ENE-ABR'),
('Mayo - Agosto 2026', '2026-05-05', '2026-08-21', 'Periodo Ordinario May-Ago 2026', 'MAY-AGO'),
('Verano Intensivo 2026', '2026-06-15', '2026-07-31', 'Cursos intensivos de verano 2026', 'VERANO'),
('Septiembre - Diciembre 2026', '2026-09-01', '2026-12-18', 'Periodo Ordinario Sep-Dic 2026', 'SEP-DIC');


-- ============================================================
-- 3. TABLAS TRANSACCIONALES Y MENSAJERÍA
-- ============================================================

-- PRESTAMO (Actualizado con valores BOOLEAN TRUE/FALSE para el campo credencial)
INSERT INTO PRESTAMO (folio, credencial, fecha_inicio, fecha_final, comentarios, usuarios, estado) VALUES
('FOL-2026-001', TRUE,  '2026-09-10 09:00:00', '2026-09-10 13:00:00', 'Devuelto a tiempo y sin daños', 1, 'CONC'),
('FOL-2026-002', TRUE,  '2026-09-15 10:30:00', '2026-09-15 16:00:00', 'Préstamo para clase de programación', 2, 'ACT'),
('FOL-2026-003', FALSE, '2026-09-12 11:00:00', '2026-09-12 14:00:00', 'Entrega con 2 horas de retraso', 3, 'VENC'),
('FOL-2026-004', TRUE,  '2026-09-16 08:00:00', '2026-09-16 12:00:00', 'Uso en laboratorio de clase', 4, 'CONC'),
('FOL-2026-005', TRUE,  '2026-09-17 09:15:00', '2026-09-17 15:00:00', 'Cámara para proyecto escolar', 7, 'ACT'),
('FOL-2026-006', FALSE, '2026-09-14 14:00:00', '2026-09-14 18:00:00', 'Proyector para conferencia', 5, 'CONC'),
('FOL-2026-007', TRUE,  '2026-09-17 08:00:00', '2026-09-17 11:00:00', 'Multímetro para práctica', 1, 'ACT');

INSERT INTO ASIGNACION_CASILLERO (folio, llave, estatus, descripcion, usuarios, casillero, tipo_movimiento, periodo_escolar) VALUES
('ASIG-2026-01', 'LLAVE-A01', 'Activo', 'Asignación inicio de cuatrimestre', 1, 1, 'PRIMERA', 4),
('ASIG-2026-02', 'LLAVE-B04', 'Activo', 'Asignación cuatrimestral', 2, 4, 'PRIMERA', 4),
('ASIG-2026-03', 'LLAVE-C07', 'Activo', 'Renovación de casillero', 3, 7, 'RENOV', 4),
('ASIG-2026-04', 'LLAVE-A02', 'Inactivo', 'Liberado por término de clases', 7, 2, 'LIBER', 3),
('ASIG-2026-05', 'LLAVE-B05', 'Inactivo', 'Enviado a mantenimiento por falla en cerradura', 8, 5, 'CAMBIO', 3),
('ASIG-2026-06', 'LLAVE-A03', 'Inactivo', 'Liberación voluntaria', 4, 3, 'LIBER', 3),
('ASIG-2026-07', 'LLAVE-C08', 'Inactivo', 'Cancelación por baja de alumno', 8, 8, 'LIBER', 3);

INSERT INTO MENSAJES (nombre, descripcion, prestamo) VALUES
('Recordatorio de devolución', 'Su préstamo del equipo Dell Latitude vence a las 13:00 hrs.', 1),
('Confirmación de préstamo', 'Se ha registrado con éxito el préstamo de la laptop Lenovo.', 2),
('Aviso de Sanción', 'El préstamo FOL-2026-003 excedió el tiempo límite de entrega.', 3),
('Agradecimiento de entrega', 'El proyector fue entregado correctamente en almacén.', 4),
('Notificación de Préstamo Activo', 'Recuerde entregar la cámara Canon antes de las 15:00 hrs.', 5),
('Confirmación de Préstamo Docente', 'Proyector listo para recolección.', 6),
('Aviso de Préstamo de Equipo', 'Multímetro entregado en ventanilla.', 7);


-- ============================================================
-- 4. TABLAS INTERMEDIAS (RELACIONES M:N)
-- ============================================================

INSERT INTO EQUIPO_PRESTAMO (prestamo, equipo) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3),
(5, 7),
(6, 3),
(7, 4);

INSERT INTO USUARIOS_MENSAJES (usuarios, mensajes) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(7, 5),
(5, 6),
(1, 7);

SET FOREIGN_KEY_CHECKS = 1;