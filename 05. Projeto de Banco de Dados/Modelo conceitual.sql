
CREATE TABLE TB_Loja (
                Loja INT AUTO_INCREMENT NOT NULL,
                nome_Loja VARCHAR(50) NOT NULL,
                PRIMARY KEY (Loja)
);

ALTER TABLE TB_Loja COMMENT 'Contem os dados da loja';


CREATE TABLE TB_Proprietario (
                id_Proprietario INT AUTO_INCREMENT NOT NULL,
                Loja INT NOT NULL,
                nome_proprietario VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Proprietario, Loja)
);

ALTER TABLE TB_Proprietario COMMENT 'Contem os dados dos proprietários da empresa
';


CREATE TABLE TB_Funcionario (
                id_Funcionario INT AUTO_INCREMENT NOT NULL,
                id_Loja INT NOT NULL,
                nome_Funcionario VARCHAR(50) NOT NULL,
                telefone_funcionario VARCHAR(10) NOT NULL,
                dataNascimento_Funcionario DATE NOT NULL,
                RG_Funcioinario VARCHAR(10) NOT NULL,
                CPF_Funcionario VARCHAR(11) NOT NULL,
                senha_Funcioanrio VARCHAR(10) NOT NULL,
                endereco_Funcionario VARCHAR(120) NOT NULL,
                PRIMARY KEY (id_Funcionario)
);

ALTER TABLE TB_Funcionario COMMENT 'Comtem os dados dos funcionarios';


CREATE TABLE TB_DadosBancarios (
                id_Funcionario INT NOT NULL,
                agencia_DadosBancarios INT NOT NULL,
                numConta_DadosBancarios INT NOT NULL,
                PRIMARY KEY (id_Funcionario)
);

ALTER TABLE TB_DadosBancarios COMMENT 'Armazena os dados bancarios dos funcionarios para efetuar os pagamentos';


CREATE TABLE TB_Cliente (
                id_Cliente INT AUTO_INCREMENT NOT NULL,
                apelido_Cliente VARCHAR(30) NOT NULL,
                nome_Cliente VARCHAR(60) NOT NULL,
                telefone_Cliente VARCHAR(10) NOT NULL,
                endereco_Cliente VARCHAR(120) NOT NULL,
                dataNascimento_Cliente DATE NOT NULL,
                senha_Cliente VARCHAR(10) NOT NULL,
                CPF_Cliente VARCHAR(11) NOT NULL,
                PRIMARY KEY (id_Cliente)
);

ALTER TABLE TB_Cliente COMMENT 'Esta tabela possui os dados dos clientes';


CREATE TABLE TB_Divida (
                id_Divida INT NOT NULL,
                id_Cliente INT NOT NULL,
                id_Funcionario INT NOT NULL,
                data_Divida DATE NOT NULL,
                status_Divida VARCHAR(10) NOT NULL,
                valor_Divida NUMERIC(10,2) NOT NULL,
                PRIMARY KEY (id_Divida, id_Cliente, id_Funcionario, data_Divida)
);


CREATE TABLE TB_Pagamento (
                id_Pagamento INT AUTO_INCREMENT NOT NULL,
                id_Funcionario INT NOT NULL,
                id_Cliente INT NOT NULL,
                data_Pagamento DATE,
                valor_Pagamento NUMERIC(10,2) NOT NULL,
                PRIMARY KEY (id_Pagamento, id_Funcionario, id_Cliente)
);

ALTER TABLE TB_Pagamento COMMENT 'Informaçoes sobre os pagamentos dos clientes';


ALTER TABLE TB_Funcionario ADD CONSTRAINT tb_loja_tb_funcionario_fk
FOREIGN KEY (id_Loja)
REFERENCES TB_Loja (Loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_Proprietario ADD CONSTRAINT tb_loja_tb_proprietario_fk
FOREIGN KEY (Loja)
REFERENCES TB_Loja (Loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_Pagamento ADD CONSTRAINT tb_funcionario_tb_pagamento_fk
FOREIGN KEY (id_Funcionario)
REFERENCES TB_Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_DadosBancarios ADD CONSTRAINT tb_funcionario_tb_dadosbancarios_fk
FOREIGN KEY (id_Funcionario)
REFERENCES TB_Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_Divida ADD CONSTRAINT tb_funcionario_tb_divida_fk
FOREIGN KEY (id_Funcionario)
REFERENCES TB_Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_Pagamento ADD CONSTRAINT tb_cliente_tb_pagamento_fk
FOREIGN KEY (id_Cliente)
REFERENCES TB_Cliente (id_Cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_Divida ADD CONSTRAINT tb_cliente_tb_divida_fk
FOREIGN KEY (id_Cliente)
REFERENCES TB_Cliente (id_Cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
