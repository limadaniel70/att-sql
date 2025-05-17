-- TEMA:
-- Gestão de Produção em uma Indústria de Fabricação de Peças Mecânicas
-- ===============================================================================

CREATE DATABASE industria_pecas;
USE industria_pecas;

-- CREATE TABLES
-- ===============================================================================

CREATE TABLE materiais (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nome_material VARCHAR(100),
    tipo VARCHAR(50),
    fornecedor VARCHAR(100),
    estoque_disponivel INT
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    descricao TEXT,
    categoria VARCHAR(50)
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    turno VARCHAR(20)
);

CREATE TABLE ordens_producao (
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    id_funcionario INT,
    id_produto INT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE materiais_utilizados (
    id_utilizacao INT AUTO_INCREMENT PRIMARY KEY,
    id_ordem INT,
    id_material INT,
    quantidade_utilizada INT,
    FOREIGN KEY (id_ordem) REFERENCES ordens_producao(id_ordem),
    FOREIGN KEY (id_material) REFERENCES materiais(id_material)
);


-- INSERT INTO
-- ===============================================================================

INSERT INTO materiais (nome_material, tipo, fornecedor, estoque_disponivel) VALUES
('Aço Inoxidável', 'Metal', 'Metalúrgica ABC', 500),
('Alumínio', 'Metal', 'Alumix', 300),
('Parafuso M6', 'Fixador', 'Fixatec', 1000),
('Placa de Latão', 'Metal', 'Latonaria Central', 150),
('Tinta Industrial', 'Químico', 'Tintas Pro', 200),
('Graxa Lubrificante', 'Lubrificante', 'LubeMax', 75),
('Cobre', 'Metal', 'Condumax', 250),
('Rolamento 6203', 'Componente', 'Rolatec', 400),
('O-Ring 12mm', 'Vedação', 'SealFix', 600),
('Chapa de Ferro', 'Metal', 'Metalforte', 350);

INSERT INTO produtos (nome_produto, descricao, categoria) VALUES
('Engrenagem Cônica', 'Engrenagem usada em redutores de velocidade', 'Mecânica'),
('Eixo de Transmissão', 'Componente que transmite torque', 'Mecânica'),
('Flange de Aço', 'Conexão de tubulações industriais', 'Conexões'),
('Suporte de Motor', 'Base de fixação para motores industriais', 'Suporte'),
('Carcaça de Bomba', 'Estrutura externa de bombas centrífugas', 'Bomba'),
('Rotor de Ventilador', 'Parte giratória para ventilação industrial', 'Ventilação'),
('Válvula de Controle', 'Regulador de fluxo de fluidos', 'Hidráulica'),
('Capa Protetora', 'Proteção para componentes móveis', 'Segurança'),
('Conjunto de Vedação', 'Kit com anéis e juntas', 'Vedação'),
('Placa Base', 'Estrutura plana para montagem de equipamentos', 'Estrutural');

INSERT INTO funcionarios (nome, cargo, turno) VALUES
('Carlos Andrade', 'Operador de Máquinas', 'diurno'),
('Fernanda Lopes', 'Técnico de Produção', 'noturno'),
('João Silva', 'Supervisor', 'diurno'),
('Paula Souza', 'Operadora de CNC', 'noturno'),
('Rafael Lima', 'Técnico Mecânico', 'diurno'),
('Tatiane Rocha', 'Inspetora de Qualidade', 'noturno'),
('Eduardo Mendes', 'Programador CNC', 'diurno'),
('Marina Dantas', 'Montadora', 'diurno'),
('Lucas Oliveira', 'Operador de Máquinas', 'noturno'),
('Juliana Martins', 'Técnica de Manutenção', 'noturno');

INSERT INTO ordens_producao (data_inicio, data_fim, id_funcionario, id_produto) VALUES
('2025-01-10', '2025-01-15', 1, 1),
('2025-01-12', '2025-01-20', 2, 2),
('2025-01-14', '2025-01-22', 3, 3),
('2025-02-01', '2025-02-10', 4, 4),
('2025-02-05', '2025-02-12', 5, 5),
('2025-02-08', '2025-02-15', 6, 6),
('2025-02-12', '2025-02-18', 7, 7),
('2025-02-20', '2025-02-25', 8, 8),
('2025-02-22', '2025-02-28', 9, 9),
('2025-03-01', '2025-03-05', 10, 10);

INSERT INTO materiais_utilizados (id_ordem, id_material, quantidade_utilizada) VALUES
(1, 1, 20),
(1, 3, 100),
(2, 2, 15),
(2, 4, 30),
(3, 5, 10),
(4, 1, 50),
(4, 6, 5),
(5, 8, 20),
(6, 7, 10),
(7, 9, 40);

-- QUERIES
-- ===============================================================================

-- ORDEM DE PRODUÇÃO: FUNCIONÁRIO + PRODUTO
SELECT o.id_ordem, f.nome AS funcionario, p.nome_produto
FROM ordens_producao o
INNER JOIN funcionarios f ON o.id_funcionario = f.id_funcionario
INNER JOIN produtos p ON o.id_produto = p.id_produto;

-- MATERIAIS QUE CONTENHAM AÇO
SELECT * FROM materiais
WHERE nome_material LIKE '%aço%';

-- NOME DOS PRODUTOS E MATERIAIS UTILIZADOS
SELECT p.nome_produto, m.nome_material
FROM ordens_producao o
INNER JOIN produtos p ON o.id_produto = p.id_produto
INNER JOIN materiais_utilizados mu ON o.id_ordem = mu.id_ordem
INNER JOIN materiais m ON mu.id_material = m.id_material;

-- OPERADORES DO TURNO DA NOITE
SELECT * FROM funcionarios
WHERE turno = 'noturno' AND cargo LIKE '%operador%';

-- MATERIAIS USADOS POR FUNCIONÁRIO
SELECT f.nome AS funcionario, m.nome_material, mu.quantidade_utilizada
FROM funcionarios f
INNER JOIN ordens_producao o ON f.id_funcionario = o.id_funcionario
INNER JOIN materiais_utilizados mu ON o.id_ordem = mu.id_ordem
INNER JOIN materiais m ON mu.id_material = m.id_material;
