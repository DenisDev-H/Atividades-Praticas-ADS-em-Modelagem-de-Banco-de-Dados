-- Relatório completo de rastreabilidade de dispensação de medicamentos
SELECT 
    p.nome_completo AS Paciente,
    p.numero_leito AS Leito,
    m.nome_comercial AS Medicamento,
    m.dosagem AS Dosagem,
    d.quantidade_dispensada AS Qtd_Entregue,
    d.data_hora_dispensacao AS Data_Hora
FROM Dispensacao d
JOIN Prescricao pr ON d.id_prescricao = pr.id_prescricao
JOIN Paciente p ON pr.id_paciente = p.id_paciente
JOIN Medicamento m ON d.id_medicamento = m.id_medicamento;
