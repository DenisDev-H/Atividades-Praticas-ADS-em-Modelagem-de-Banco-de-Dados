-- =====================================================================
-- SCRIPT DE INTEGRIDADE TRANSACIONAL E CONTROLE DE CONCORRÊNCIA
-- Garante atomicidade ("tudo ou nada") entre Dispensação e Estoque
-- =====================================================================

USE db_farmacia_hospitalar;

-- ---------------------------------------------------------------------
-- CENÁRIO 1: Dispensação com sucesso e baixa atômica no estoque
-- ---------------------------------------------------------------------
START TRANSACTION;

-- 1. Registra a saída do medicamento (Ex: 2 unidades de Dipirona para Prescrição 1)
INSERT INTO Dispensacao (id_prescricao, id_medicamento, quantidade_dispensada, data_hora_dispensacao)
VALUES (1, 1, 2, NOW());

-- 2. Atualiza o estoque descontando exatamente a quantidade dispensada
-- A condição "quantidade_estoque >= 2" evita estoque negativo em acessos simultâneos
UPDATE Medicamento
SET quantidade_estoque = quantidade_estoque - 2
WHERE id_medicamento = 1 AND quantidade_estoque >= 2;

-- 3. Confirma e grava permanentemente ambas as operações juntas
COMMIT;


-- ---------------------------------------------------------------------
-- CENÁRIO 2: Simulação de falha ou cancelamento (ROLLBACK)
-- Útil para testar que o banco desfaz alterações parciais em caso de erro
-- ---------------------------------------------------------------------
START TRANSACTION;

-- Tenta registrar uma dispensação
INSERT INTO Dispensacao (id_prescricao, id_medicamento, quantidade_dispensada, data_hora_dispensacao)
VALUES (2, 3, 50, NOW());

-- Se for detectado erro de validação na aplicação (ex: lote vencido ou estoque insuficiente),
-- o ROLLBACK cancela o INSERT acima e mantém o banco íntegro
ROLLBACK;
