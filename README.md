# Sistema de Gestão de Farmácia e Dispensação Hospitalar

## 📋 Descrição do Minimundo
Projeto de modelagem e implementação de banco de dados relacional para controle de farmácia hospitalar, abrangendo cadastro de pacientes internados, controle de estoque e validade de medicamentos, registro de prescrições médicas e auditoria de dispensações.

## 🗄️ Estrutura do Modelo Lógico (3FN)
* **Paciente:** `id_paciente` (PK), `cpf` (UNIQUE), `nome_completo`, `numero_leito`, `data_internacao`.
* **Medicamento:** `id_medicamento` (PK), `nome_comercial`, `principio_ativo`, `dosagem`, `quantidade_estoque`, `data_validade`.
* **Prescricao:** `id_prescricao` (PK), `id_paciente` (FK), `data_prescricao`, `observacoes`.
* **Dispensacao:** `id_dispensacao` (PK), `id_prescricao` (FK), `id_medicamento` (FK), `quantidade_dispensada`, `data_hora_dispensacao`.

## ⚙️ Configuração do Ambiente
* **SGBD:** MySQL 8.0+
* **Ferramenta:** MySQL Workbench
* **Conexão:** Servidor local na porta `3306` com o banco `db_farmacia_hospitalar`.

## 🚀 Ordem sugerida
Para garantir a integridade referencial e evitar erros de dependência de chaves estrangeiras (FK), execute os scripts na seguinte sequência:

1. **Criação do schema e tabelas (DDL):** Criação do banco `db_farmacia_hospitalar` e das tabelas independentes (`Paciente`, `Medicamento`) seguidas pelas dependentes (`Prescricao`, `Dispensacao`).
2. **Inserts (Povoamento):** Execução dos comandos `INSERT` respeitando a hierarquia (tabelas-mãe antes das tabelas-filhas).
3. **Selects (Consultas):** Execução das consultas analíticas combinando `JOIN`, `WHERE`, `ORDER BY` e `LIMIT`.
4. **Updates (Atualizações):** Execução das alterações controladas com cláusula `WHERE`.
5. **Deletes (Exclusões):** Execução das remoções seguras de registros dependentes antes dos registros-mãe, sempre condicionadas por `WHERE`.

## 👨‍💻 Autor
Denis Araujo — Estudante de Análise e Desenvolvimento de Sistemas (ADS).
