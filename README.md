# 🏥 Sistema de Gestão de Farmácia e Dispensação Hospitalar

Projeto desenvolvido no âmbito da formação em **Análise e Desenvolvimento de Sistemas (ADS)**, com foco na transição de carreira para a área de **Tecnologia em Saúde e Sistemas Hospitalares**. O objetivo é modelar, estruturar e consultar um banco de dados relacional robusto voltado para o controle de estoque, prescrições e rastreabilidade de medicamentos em ambiente hospitalar.

---

## 🎯 Sobre o Projeto (Elevator Pitch)
Este sistema relacional foi desenhado para gerenciar o controle de estoque, a validade de insumos e a dispensação de medicamentos para os leitos de uma farmácia hospitalar. O principal propósito é automatizar a rastreabilidade dos medicamentos, garantindo segurança na administração aos pacientes e eficiência operacional para farmacêuticos, enfermeiros e gestores.

---

## 🏗️ Modelagem de Dados e Arquitetura (DDL)
O banco de dados foi construído utilizando **Microsoft SQL Server**, aplicando os princípios fundamentais de normalização, integridade referencial e chaves estrangeiras (`FK`).

### Estruturas das Tabelas:
1. **`Paciente`**: Armazena a identificação e os dados de internação dos pacientes.
2. **`Medicamento`**: Controla o catálogo de insumos, princípios ativos, dosagens, quantidades em estoque e datas de validade.
3. **`Prescricao`**: Regista as orientações médicas associadas a cada paciente (Relacionamento 1 para N).
4. **`Dispensacao`**: Tabela transacional que une prescrições e medicamentos, registrando a saída física dos itens com data, hora e quantidade exata.

---

## 🚀 Como Executar o Projeto

1. Certifique-se de ter o **Microsoft SQL Server** e o **SQL Server Management Studio (SSMS)** instalados.
2. Crie uma nova base de dados com o nome desejado:
   ```sql
   CREATE DATABASE SistemaGestaoFarmaciaHospitalar;
