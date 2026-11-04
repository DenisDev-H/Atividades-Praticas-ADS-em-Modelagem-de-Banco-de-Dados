-- Inserindo pacientes fictícios
INSERT INTO Paciente (cpf, nome_completo, numero_leito, data_internacao)
VALUES 
('12345678901', 'Maria da Silva', 'Leito 101', '2026-11-01'),
('98765432109', 'João de Oliveira', 'Leito 102', '2026-11-02'),
('45678912345', 'Ana Souza Santos', 'UTI 03', '2026-11-03');

-- Inserindo medicamentos essenciais no estoque
INSERT INTO Medicamento (nome_comercial, principio_ativo, dosagem, quantidade_estoque, data_validade)
VALUES 
('Dipirona Sódica', 'Dipirona', '500mg/ml', 500, '2027-12-31'),
('Paracetamol', 'Paracetamol', '750mg', 300, '2026-08-15'),
('Ceftriaxona', 'Ceftriaxona Dissódica', '1g', 120, '2026-06-30'),
('Omeprazol', 'Omeprazol', '20mg', 250, '2027-03-31');

-- Inserindo prescrições médicas
INSERT INTO Prescricao (id_paciente, data_prescricao, observacoes)
VALUES 
(1, '2026-11-01', 'Administrar analgésico em horário regular para dor pós-cirúrgica.'),
(2, '2026-11-02', 'Uso de antibiótico intravenoso conforme protocolo de infecção.'),
(3, '2026-11-03', 'Proteção gástrica diária pela manhã.');

-- Inserindo dispensações da farmácia
INSERT INTO Dispensacao (id_prescricao, id_medicamento, quantidade_dispensada, data_hora_dispensacao)
VALUES 
(1, 1, 4, '2026-11-01 08:30:00'),
(2, 3, 2, '2026-11-02 10:15:00'),
(3, 4, 1, '2026-11-03 07:00:00');
