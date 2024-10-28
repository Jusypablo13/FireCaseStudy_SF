-- # Total de incidentes por mes, distrito y batallón
SELECT date_trunc('month', "Incident Date"::date) AS mes,
       "neighborhood_district" AS distrito,
       "Battalion" AS batallón,
       COUNT(*) AS total_incidentes
FROM fire_incidents
GROUP BY mes, distrito, batallón
ORDER BY mes DESC, distrito, batallón;

-- # Total de incidentes por batallón y año
SELECT date_trunc('year', "Incident Date"::date) AS año,
       "Battalion" AS batallón,
       COUNT(*) AS total_incidentes
FROM fire_incidents
GROUP BY año, batallón
ORDER BY año DESC, batallón;

-- # Total de incidentes por día
SELECT "Incident Date"::date AS dia,
       COUNT(*) AS total_incidentes
FROM fire_incidents
GROUP BY dia
ORDER BY dia DESC;