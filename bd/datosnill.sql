-- CONSULTAS 



/* Consulta de datos para informes de UTT */
USE sistema_prestamos;
SELECT 
    e.num_utt AS 'Num. de Inventario',
    e.nombre AS 'Descripcion del bien',
    e.costo AS 'Costo',
    m.nombre AS 'Marca',
    mo.nombre AS 'Modelo',
    e.numero_serie AS 'Numero de serie',
    e.resguardo AS Resguardo,
    e.resguardante AS Resguardante,
    e.rf_resguardo AS 'Referencia de Resguardo',
    e.ubicacion AS Ubicacion
FROM equipo AS e
INNER JOIN marca AS m ON m.clave = e.marca
LEFT JOIN modelo AS mo ON mo.marca = m.clave;


/* Consulta de prestamo activo */
USE sistema_prestamos;

SELECT 
    p.folio AS 'Folio Préstamo',
    CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, '')) AS 'Usuario',
    u.identificacion AS Identificador,
    u.email AS 'Correo',
    r.nombre AS 'Rol',
    DATE_FORMAT(p.fecha_inicio, '%Y-%m-%d %H:%i') AS 'Fecha/Hora Salida',
    DATE_FORMAT(p.fecha_final, '%Y-%m-%d %H:%i') AS 'Fecha/Hora Límite',
    p.credencial AS 'Garantía Dejada',
    e.nombre AS 'Equipo',
    e.codigo_barras AS 'Código Equipo',
    m.nombre AS 'Marca',
    est.nombre AS 'Estatus'
FROM PRESTAMO AS p
INNER JOIN USUARIOS AS u ON u.codigo = p.usuarios
INNER JOIN ROL AS r ON r.codigo = u.rol
INNER JOIN ESTADO AS est ON est.codigo = p.estado
INNER JOIN EQUIPO_PRESTAMO AS ep ON ep.prestamo = p.num
INNER JOIN EQUIPO AS e ON e.codigo = ep.equipo
INNER JOIN MARCA AS m ON m.clave = e.marca
WHERE est.codigo = 'ACT' OR est.nombre = 'Activo';



/* Consulta de casilleros */
USE sistema_prestamos;

SELECT 
    c.numero AS 'Número de Casillero',
    c.descripcion AS 'Ubicación / Detalle',
    ec.nombre AS 'Estado del Casillero',
    ac.folio AS 'Folio Asignación',
    ac.llave AS 'Código de Llave',
    CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, '')) AS 'Usuario Asignado',
    u.identificacion AS 'Matrícula / ID',
    pe.nombre AS 'Periodo Escolar',
    tm.nombre AS 'Tipo de Movimiento'
FROM CASILLERO AS c
INNER JOIN ESTADO_CASILLERO AS ec ON ec.codigo = c.estado_casillero
LEFT JOIN ASIGNACION_CASILLERO AS ac ON ac.casillero = c.codigo AND ac.estatus = 'Activo'
LEFT JOIN USUARIOS AS u ON u.codigo = ac.usuarios
LEFT JOIN PERIODO_ESCOLAR AS pe ON pe.num = ac.periodo_escolar
LEFT JOIN TIPO_MOVIMIENTO AS tm ON tm.codigo = ac.tipo_movimiento
ORDER BY c.numero ASC;






USE sistema_prestamos;

SELECT
    

FROM USUARIOS
INNER JOIN 
