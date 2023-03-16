-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Tempo de geração: 16/03/2023 às 20:25
-- Versão do servidor: 8.0.32
-- Versão do PHP: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `facil_solucoes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Tb_banco`
--

CREATE TABLE `Tb_banco` (
  `codigo` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Tb_banco`
--

INSERT INTO `Tb_banco` (`codigo`, `nome`) VALUES
(1, 'Banco do Brasil'),
(260, 'Nu Bank'),
(336, 'C6 Bank');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Tb_contrato`
--

CREATE TABLE `Tb_contrato` (
  `codigo` int NOT NULL,
  `prazo` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_inclusao` date DEFAULT NULL,
  `convenio_servico` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Tb_contrato`
--

INSERT INTO `Tb_contrato` (`codigo`, `prazo`, `valor`, `data_inclusao`, `convenio_servico`) VALUES
(1, 12, 5000.00, '2022-01-01', 1),
(2, 6, 8000.00, '2022-02-15', 3),
(3, 24, 12000.00, '2022-03-30', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Tb_convenio`
--

CREATE TABLE `Tb_convenio` (
  `codigo` int NOT NULL,
  `convenio` varchar(50) DEFAULT NULL,
  `verba` decimal(10,2) DEFAULT NULL,
  `banco` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Tb_convenio`
--

INSERT INTO `Tb_convenio` (`codigo`, `convenio`, `verba`, `banco`) VALUES
(1, 'Convênio A', 10000.00, 260),
(2, 'Convênio B', 15000.00, 1),
(3, 'Convênio C', 20000.00, 336);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Tb_convenio_servico`
--

CREATE TABLE `Tb_convenio_servico` (
  `codigo` int NOT NULL,
  `convenio` int NOT NULL,
  `servico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Tb_convenio_servico`
--

INSERT INTO `Tb_convenio_servico` (`codigo`, `convenio`, `servico`) VALUES
(1, 3, 2),
(2, 1, 3),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Tb_servico`
--

CREATE TABLE `Tb_servico` (
  `codigo` int NOT NULL,
  `servico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Tb_servico`
--

INSERT INTO `Tb_servico` (`codigo`, `servico`) VALUES
(1, 'Serviço X'),
(2, 'Serviço Y'),
(3, 'Serviço Z');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Tb_banco`
--
ALTER TABLE `Tb_banco`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `Tb_contrato`
--
ALTER TABLE `Tb_contrato`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `convenio_servico` (`convenio_servico`);

--
-- Índices de tabela `Tb_convenio`
--
ALTER TABLE `Tb_convenio`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `banco` (`banco`);

--
-- Índices de tabela `Tb_convenio_servico`
--
ALTER TABLE `Tb_convenio_servico`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `servico` (`servico`),
  ADD KEY `convenio` (`convenio`);

--
-- Índices de tabela `Tb_servico`
--
ALTER TABLE `Tb_servico`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Tb_contrato`
--
ALTER TABLE `Tb_contrato`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Tb_convenio`
--
ALTER TABLE `Tb_convenio`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Tb_convenio_servico`
--
ALTER TABLE `Tb_convenio_servico`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Tb_servico`
--
ALTER TABLE `Tb_servico`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Tb_contrato`
--
ALTER TABLE `Tb_contrato`
  ADD CONSTRAINT `Tb_contrato_ibfk_1` FOREIGN KEY (`convenio_servico`) REFERENCES `Tb_convenio_servico` (`codigo`);

--
-- Restrições para tabelas `Tb_convenio`
--
ALTER TABLE `Tb_convenio`
  ADD CONSTRAINT `Tb_convenio_ibfk_1` FOREIGN KEY (`banco`) REFERENCES `Tb_banco` (`codigo`);

--
-- Restrições para tabelas `Tb_convenio_servico`
--
ALTER TABLE `Tb_convenio_servico`
  ADD CONSTRAINT `Tb_convenio_servico_ibfk_1` FOREIGN KEY (`convenio`) REFERENCES `Tb_convenio` (`codigo`),
  ADD CONSTRAINT `Tb_convenio_servico_ibfk_2` FOREIGN KEY (`servico`) REFERENCES `Tb_servico` (`codigo`),
  ADD CONSTRAINT `Tb_convenio_servico_ibfk_3` FOREIGN KEY (`convenio`) REFERENCES `Tb_convenio` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
