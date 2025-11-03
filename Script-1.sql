create database Hospital;
use Hospital;

CREATE table hospitais (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
); 

create TABLE enfermaria (
    enfermaria_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_id INT,
    sigla VARCHAR(10),
    camas INT,
    FOREIGN KEY (hospital_id) references hospitais (hospital_id)
);

CREATE TABLE empregado (
    empregado_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_id INT,
    num_ordem VARCHAR(30),
    categoria VARCHAR(100),
    vencimento DECIMAL(10,2),
    data_contratacao DATE,
    FOREIGN KEY (hospital_id) REFERENCES hospitais (hospital_id)
   );

CREATE TABLE medico (

    empregado_id INT PRIMARY KEY,
    especialidade VARCHAR(100),
    FOREIGN KEY (empregado_id) REFERENCES empregado(empregado_id)
    );
    
CREATE TABLE enfermeiro (
    enfermeiro_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_id INT,
    enfermaria_id INT,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    vencimento DECIMAL(10,2),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id),
    FOREIGN KEY (enfermaria_id) REFERENCES enfermaria(enfermaria_id)
);

CREATE TABLE doente (
    doente_id INT AUTO_INCREMENT PRIMARY KEY,
	hospital_id INT,
	num_interno VARCHAR(20),
    data_entrada DATE,
    data_saida DATE,
    diagnostico VARCHAR(255),
	FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);
    
CREATE TABLE laboratorio (
    laboratorio_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	morada VARCHAR(100) NOT NULL
);

CREATE TABLE analise (
    analise_id INT AUTO_INCREMENT PRIMARY KEY,
	laboratorio_id INT,
	doente_id INT,
	tipo VARCHAR(100),
	data_analise DATE,
	resultado VARCHAR(100),
	FOREIGN KEY (laboratorio_id) REFERENCES laboratorio(laboratorio_id),
	FOREIGN KEY (doente_id) REFERENCES doente(doente_id)
);

CREATE USER 'Tiago'@'localhost' IDENTIFIED BY 'senha_do_tiago';
CREATE USER 'Rodrigo'@'localhost' IDENTIFIED BY 'senha_da_rodrigo';
CREATE USER 'AndreVentura'@'localhost' IDENTIFIED BY 'senha_do_andre';
CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'senha_do_admin';

CREATE ROLE 'medico';
CREATE ROLE 'enfermeiro';
CREATE ROLE 'empregado';
create role 'Admin';

Grant all on hospital to 'Admin'@'localhost';
GRANT SELECT, UPDATE, INSERT ON hospital.doente TO 'Tiago'@'localhost';
GRANT SELECT, UPDATE ON hospital.enfermaria TO 'Rodrigo'@'localhost';
GRANT SELECT ON laboratorio TO 'AndreVentura'@'localhost';
 
revoke SELECT ON hospital.doente from 'Tiago'@'localhost';
revoke all ON laboratorio from 'AndreVentura'@'localhost';

 INSERT INTO hospitais (nome, cidade) VALUES
('Hospital Central de Lisboa', 'Lisboa'),
('Hospital São João', 'Porto'),
('Hospital de Braga', 'Braga'),
('Hospital Garcia de Orta', 'Almada'),
('Hospital de Évora', 'Évora'),
('Hospital de Coimbra', 'Coimbra'),
('Hospital de Faro', 'Faro'),
('Hospital de Setúbal', 'Setúbal'),
('Hospital do Barreiro', 'Barreiro'),
('Hospital de Leiria', 'Leiria'),
('Hospital de Aveiro', 'Aveiro'),
('Hospital de Santarém', 'Santarém'),
('Hospital de Viseu', 'Viseu'),
('Hospital de Castelo Branco', 'Castelo Branco'),
('Hospital de Vila Real', 'Vila Real'),
('Hospital de Beja', 'Beja'),
('Hospital de Portalegre', 'Portalegre'),
('Hospital da Guarda', 'Guarda'),
('Hospital do Funchal', 'Funchal'),
('Hospital de Ponta Delgada', 'Ponta Delgada');
 
INSERT INTO enfermaria (hospital_id, sigla, camas) VALUES
(1, 'ENF-A1', 20),
(1, 'ENF-A2', 25),
(2, 'ENF-B1', 15),
(2, 'ENF-B2', 30),
(3, 'ENF-C1', 20),
(3, 'ENF-C2', 20),
(4, 'ENF-D1', 25),
(5, 'ENF-E1', 20),
(6, 'ENF-F1', 30),
(7, 'ENF-G1', 18),
(8, 'ENF-H1', 22),
(9, 'ENF-I1', 28),
(10, 'ENF-J1', 24),
(11, 'ENF-K1', 26),
(12, 'ENF-L1', 20),
(13, 'ENF-M1', 30),
(14, 'ENF-N1', 25),
(15, 'ENF-O1', 20),
(16, 'ENF-P1', 18),
(17, 'ENF-Q1', 22);

INSERT INTO empregado (hospital_id, num_ordem, categoria, vencimento, data_contratacao) VALUES
(1, 'E001', 'Médico', 3200.00, '2018-05-10'),
(1, 'E002', 'Enfermeiro', 1800.00, '2019-03-15'),
(2, 'E003', 'Médico', 3400.00, '2017-06-12'),
(2, 'E004', 'Administrativo', 1500.00, '2020-07-01'),
(3, 'E005', 'Médico', 3100.00, '2016-09-20'),
(3, 'E006', 'Enfermeiro', 1900.00, '2021-01-10'),
(4, 'E007', 'Médico', 3600.00, '2015-11-25'),
(4, 'E008', 'Administrativo', 1400.00, '2022-03-02'),
(5, 'E009', 'Médico', 3000.00, '2018-10-05'),
(6, 'E010', 'Enfermeiro', 1850.00, '2019-02-08'),
(7, 'E011', 'Médico', 3300.00, '2017-05-14'),
(8, 'E012', 'Enfermeiro', 1750.00, '2020-09-09'),
(9, 'E013', 'Médico', 3500.00, '2016-01-01'),
(10, 'E014', 'Administrativo', 1550.00, '2021-06-06'),
(11, 'E015', 'Médico', 3250.00, '2019-07-07'),
(12, 'E016', 'Enfermeiro', 1800.00, '2020-08-08'),
(13, 'E017', 'Médico', 3100.00, '2017-03-03'),
(14, 'E018', 'Enfermeiro', 1850.00, '2022-09-09'),
(15, 'E019', 'Médico', 3450.00, '2015-12-12'),
(16, 'E020', 'Administrativo', 1600.00, '2021-04-04');


INSERT INTO enfermeiro (hospital_id, enfermaria_id, nome, categoria, vencimento) VALUES
(1, 1, 'Ana Costa', 'Chefe', 2000.00),
(1, 2, 'Bruno Silva', 'Auxiliar', 1600.00),
(2, 3, 'Carla Pereira', 'Chefe', 1900.00),
(3, 5, 'Daniel Rocha', 'Auxiliar', 1700.00),
(4, 7, 'Eva Martins', 'Chefe', 2100.00),
(5, 8, 'Filipe Gomes', 'Auxiliar', 1650.00),
(6, 9, 'Gabriela Sousa', 'Chefe', 1950.00),
(7, 10, 'Hugo Nunes', 'Auxiliar', 1750.00),
(8, 11, 'Inês Duarte', 'Chefe', 2000.00),
(9, 12, 'João Lopes', 'Auxiliar', 1600.00),
(10, 13, 'Liliana Freitas', 'Chefe', 2100.00),
(11, 14, 'Miguel Tavares', 'Auxiliar', 1800.00),
(12, 15, 'Nádia Silva', 'Chefe', 2050.00),
(13, 16, 'Oscar Ramos', 'Auxiliar', 1750.00),
(14, 17, 'Patrícia Alves', 'Chefe', 1950.00),
(15, 1, 'Rui Pinto', 'Auxiliar', 1700.00),
(16, 2, 'Sofia Castro', 'Chefe', 2000.00),
(17, 3, 'Tiago Mendes', 'Auxiliar', 1600.00),
(18, 4, 'Vera Reis', 'Chefe', 2100.00),
(19, 5, 'Zé Ferreira', 'Auxiliar', 1750.00);

INSERT INTO doente (hospital_id, num_interno, data_entrada, data_saida, diagnostico) VALUES
(1, 'D001', '2024-01-10', '2024-01-15', 'Gripe'),
(2, 'D002', '2024-02-11', NULL, 'Pneumonia'),
(3, 'D003', '2024-03-12', '2024-03-20', 'Fratura'),
(4, 'D004', '2024-04-13', NULL, 'Covid-19'),
(5, 'D005', '2024-05-14', '2024-05-22', 'Diabetes'),
(6, 'D006', '2024-06-15', NULL, 'Hipertensão'),
(7, 'D007', '2024-07-16', '2024-07-25', 'Apendicite'),
(8, 'D008', '2024-08-17', NULL, 'Bronquite'),
(9, 'D009', '2024-09-18', '2024-09-26', 'Anemia'),
(10, 'D010', '2024-10-19', NULL, 'Asma'),
(11, 'D011', '2024-01-05', '2024-01-10', 'Otite'),
(12, 'D012', '2024-02-06', NULL, 'Tosse Crónica'),
(13, 'D013', '2024-03-07', '2024-03-14', 'Gastrite'),
(14, 'D014', '2024-04-08', NULL, 'Covid-19'),
(15, 'D015', '2024-05-09', '2024-05-16', 'Colesterol Alto'),
(16, 'D016', '2024-06-10', NULL, 'Gripe'),
(17, 'D017', '2024-07-11', '2024-07-18', 'Dor Lombar'),
(18, 'D018', '2024-08-12', NULL, 'Dermatite'),
(19, 'D019', '2024-09-13', '2024-09-20', 'Sinusite'),
(20, 'D020', '2024-10-14', NULL, 'Ansiedade');

INSERT INTO laboratorio (nome, morada) VALUES
('Lab Central', 'Lisboa'),
('Lab Norte', 'Porto'),
('Lab Sul', 'Faro'),
('Lab Beiras', 'Coimbra'),
('Lab Minho', 'Braga'),
('Lab Tejo', 'Santarém'),
('Lab Alentejo', 'Évora'),
('Lab Madeira', 'Funchal'),
('Lab Açores', 'Ponta Delgada'),
('Lab Litoral', 'Aveiro'),
('Lab Centro', 'Leiria'),
('Lab Oeste', 'Setúbal'),
('Lab Interior', 'Guarda'),
('Lab Serra', 'Viseu'),
('Lab Hospitalar', 'Barreiro'),
('Lab Avançado', 'Vila Real'),
('Lab Clínico', 'Beja'),
('Lab Diagnóstico', 'Portalegre'),
('Lab Vida', 'Castelo Branco'),
('Lab Saúde+', 'Lisboa');

INSERT INTO analise (laboratorio_id, doente_id, tipo, data_analise, resultado) VALUES
(1, 1, 'Sangue', '2024-01-12', 'Normal'),
(2, 2, 'Urina', '2024-02-13', 'Infecção'),
(3, 3, 'Raio-X', '2024-03-14', 'Fratura'),
(4, 4, 'PCR', '2024-04-15', 'Positivo'),
(5, 5, 'Glicemia', '2024-05-16', 'Alta'),
(6, 6, 'Tensão', '2024-06-17', 'Elevada'),
(7, 7, 'Sangue', '2024-07-18', 'Normal'),
(8, 8, 'Urina', '2024-08-19', 'Normal'),
(9, 9, 'Hemograma', '2024-09-20', 'Baixo'),
(10, 10, 'Raio-X', '2024-10-21', 'Normal'),
(11, 11, 'Sangue', '2024-01-13', 'Normal'),
(12, 12, 'Urina', '2024-02-14', 'Infecção'),
(13, 13, 'Raio-X', '2024-03-15', 'Normal'),
(14, 14, 'PCR', '2024-04-16', 'Negativo'),
(15, 15, 'Glicemia', '2024-05-17', 'Alta'),
(16, 16, 'Tensão', '2024-06-18', 'Normal'),
(17, 17, 'Sangue', '2024-07-19', 'Normal'),
(18, 18, 'Urina', '2024-08-20', 'Normal'),
(19, 19, 'Hemograma', '2024-09-21', 'Baixo'),
(20, 20, 'Raio-X', '2024-10-22', 'Normal');

INSERT INTO medico (empregado_id, especialidade) VALUES
(1, 'Cardiologia'),
(3, 'Neurologia'),
(5, 'Ortopedia'),
(7, 'Pediatria'),
(9, 'Dermatologia'),
(11, 'Ginecologia'),
(13, 'Oftalmologia'),
(15, 'Urologia'),
(17, 'Oncologia'),
(19, 'Psiquiatria'),
(2, 'Medicina Geral'),
(4, 'Reumatologia'),
(6, 'Endocrinologia'),
(8, 'Cirurgia Geral'),
(10, 'Otorrinolaringologia'),
(12, 'Hematologia'),
(14, 'Gastroenterologia'),
(16, 'Nefrologia'),
(18, 'Radiologia'),
(20, 'Anestesiologia');

SELECT d.doente_id, d.diagnostico, h.nome AS hospital
FROM doente d
JOIN hospitais h ON d.hospital_id = h.hospital_id;


SELECT m.empregado_id, m.especialidade, h.nome AS hospital
FROM medico m
JOIN empregado e ON m.empregado_id = e.empregado_id
JOIN hospitais h ON e.hospital_id = h.hospital_id;

SELECT n.nome, enf.sigla, h.nome AS hospital
FROM enfermeiro n
JOIN enfermaria enf ON n.enfermaria_id = enf.enfermaria_id
JOIN hospitais h ON n.hospital_id = h.hospital_id;

SELECT d.num_interno, a.tipo, a.resultado
FROM doente d
JOIN analise a ON d.doente_id = a.doente_id;

SELECT h.nome, SUM(e.camas) AS total_camas
FROM hospitais h
JOIN enfermaria e ON h.hospital_id = e.hospital_id
GROUP BY h.nome;