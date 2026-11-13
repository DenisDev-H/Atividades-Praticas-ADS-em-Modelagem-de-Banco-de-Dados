-- =====================================================================
-- SCRIPT DE CONSULTAS EXPLORATÓRIAS COMPLETAS (SELECT)
-- Combinando JOIN + WHERE + ORDER BY + LIMIT simultaneamente
-- =====================================================================

-- Consulta 1: Histórico de dispensações filtradas por período e ordenadas pelas mais recentes
SELECT 
    d.id_dispensacao,
    p.nome_completo AS paciente,
    p.numero_leito,
    m.nome_comercial AS medicamento,
    d.quantidade_dispensada,
    d.data_hora_dispensacao
FROM Dispensacao d
INNER JOIN Prescricao pr ON d.id_prescricao = pr.id_prescricao
INNER JOIN Paciente p ON pr.id_paciente = p.id_paciente
INNER JOIN Medicamento m ON d.id_medicamento = m.id_medicamento
WHERE d.data_hora_dispensacao >= '2026-11-01 00:00:00'
ORDER BY d.data_hora_dispensacao DESC
LIMIT 10;

-- Consulta 2: Prescrições ativas de pacientes em alas específicas (filtro de leito)
SELECT 
    p.nome_completo AS paciente,
    p.numero_leito,
    pr.id_prescricao,
    pr.data_prescricao,
    pr.observacoes
FROM Prescricao pr
INNER JOIN Paciente p ON pr.id_paciente = p.id_paciente
WHERE p.numero_leito LIKE 'Leito 2%'
ORDER BY pr.data_prescricao DESC
LIMIT 5;

-- Consulta 3: Saídas de medicamentos com volume dispensado maior ou igual a 2 unidades
SELECT 
    m.nome_comercial,
    m.principio_ativo,
    m.quantidade_estoque,
    d.quantidade_dispensada,
    d.data_hora_dispensacao
FROM Dispensacao d
INNER JOIN Medicamento m ON d.id_medicamento = m.id_medicamento
WHERE d.quantidade_dispensada >= 2
ORDER BY d.quantidade_dispensada DESC
LIMIT 5;
