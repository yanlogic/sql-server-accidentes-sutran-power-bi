USE Lab2_Accidentes;
GO

-- 1. Creamos la primera tabla Dimensión (Departamentos)
SELECT DISTINCT DEPARTAMENTO 
INTO Dim_Departamento
FROM Accidentes_Sutran
WHERE DEPARTAMENTO IS NOT NULL;

-- 2. Creamos la segunda tabla Dimensión (Modalidad del accidente)
SELECT DISTINCT MODALIDAD 
INTO Dim_Modalidad
FROM Accidentes_Sutran
WHERE MODALIDAD IS NOT NULL;

-- 3. CONSULTA FINAL SOLICITADA EN LA GUÍA (2 JOINS y 1 GROUP BY)
SELECT 
    d.DEPARTAMENTO AS Departamento,
    m.MODALIDAD AS Tipo_Accidente,
    COUNT(a.FECHA) AS Total_Accidentes
FROM Accidentes_Sutran a
-- Primer JOIN
INNER JOIN Dim_Departamento d 
    ON a.DEPARTAMENTO = d.DEPARTAMENTO
-- Segundo JOIN
INNER JOIN Dim_Modalidad m 
    ON a.MODALIDAD = m.MODALIDAD
-- Resumen por grupo (GROUP BY)
GROUP BY 
    d.DEPARTAMENTO, 
    m.MODALIDAD
ORDER BY 
    Total_Accidentes DESC;