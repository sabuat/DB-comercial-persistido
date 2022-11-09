CREATE DATABASE ecommerce_DB;

USE ecommerce_DB;

CREATE TABLE Cliente(
	idClient 	INT NOT NULL auto_increment primary key,
    nome_cl 	VARCHAR(20) NOT NULL,
    telf_cl 	VARCHAR(11) NOT NULL UNIQUE,
    endereço_cl VARCHAR(40) NOT NULL,
    tipo_cl 	ENUM('PF', 'PJ'),
    cpf 		VARCHAR(11),
    cnpj_cl 	VARCHAR(14)
);

CREATE TABLE Vendedor(
	idVendor 	INT NOT NULL auto_increment primary key,
    vendor_name VARCHAR(20) NOT NULL,
    cnpj_vendor VARCHAR(14) NOT NULL,
    endereço_cl VARCHAR(40) NOT NULL
);

CREATE TABLE Produto(
	idProduto 	INT NOT NULL auto_increment primary key,
    nome_prod 	VARCHAR(20) NOT NULL,
    valor_prod	FLOAT NOT NULL UNIQUE,
    vendor_prod INT NOT NULL,
    CONSTRAINT fk_id_vendor foreign key (vendor_prod) references Vendedor(idVendor) 
);

CREATE TABLE Pedido(
	idPedido 	INT NOT NULL auto_increment primary key,
    cliente_OC  INT NOT NULL,
    produto_OC  INT NOT NULL,
    valor_prod	FLOAT,
    CONSTRAINT fk_cliente_pedido foreign key (cliente_OC) references Cliente (idClient),
    CONSTRAINT fk_produto_pedido foreign key (produto_OC) references Produto (idProduto)
);

CREATE TABLE Stock(
	stk_produto    INT NOT NULL,
    stk_vendor     INT NOT NULL,
    stk_quantidade INT NOT NULL,
    CONSTRAINT fk_produto_stock foreign key (stk_produto) references Produto (idProduto),
    CONSTRAINT fk_vendor_stock  foreign key (stk_vendor)  references Vendedor (idVendor)
);

INSERT INTO Cliente () values (default, "Carlos Alberto", "11987987987", "Manaus, AM", "PF", "70870970890", NULL);

INSERT INTO Cliente () values (default, "Carlos Eduardo", "11987234987", "Manaus, AM", "PF", "70875430890", NULL),
							  (default, "Marcos Eduardo", "19987234907", "São Paulo, SP", "PF", "76575430890", NULL),
                              (default, "Fernando Jose", "21987234987", "Rio de Janeiro, RJ", "PF", "21345430890", NULL),
                              (default, "Maria Eduarda", "91987234987", "Manaus, AM", "PF", "70219870890", NULL);
                              
select * from Vendedor;

INSERT INTO Vendedor () values (1, "Hortifruti", "100014505076", "Manaus, AM"),
							   (default, "Cafetaria", "100094305076", "São Paulo, SP"),
                               (default, "Restaurant", "100014594376", "Rio de Janeiro, RJ"),
                               (default, "Loja", "100043215076", "São Paulo, SP");

INSERT INTO Produto () values (default, "Cafe" , 20.95, 3),
							  (default, "Agua" , 2.50, 2),
                              (default, "Arroz" , 12.65, 4),
                              (default, "Sacola" , 10.95, 1),
                              (default, "Manteiga" , 3.95, 3),
							  (default, "Banana" , 1.40, 2),
                              (default, "Maça" , 3.65, 4),
                              (default, "Copos" , 1.95, 1);

SELECT * FROM Produto, Vendedor WHERE idVendor = vendor_prod AND idVendor = "2";

