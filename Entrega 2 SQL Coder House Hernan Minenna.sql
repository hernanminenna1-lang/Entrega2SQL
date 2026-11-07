CREATE Table Clientes (
	ID_Cliente SERIAL PRIMARY KEY,
	Email VARCHAR(150) NOT NULL UNIQUE,
	First_Name VARCHAR (100),
	Last_Name VARCHAR (100),
	Telefono VARCHAR (100) ,
	Fecha_Dado_Alta DATE NOT NULL DEFAULT Current_Date
);

CREATE Table Productos (
	ID_Product SERIAL Primary Key,
	Precio DECIMAL (10,2) NOT NULL CHECK (Precio>0) ,
	Stock INT NOT NULL CHECK (Stock >=0),
	Nombre VARCHAR (100) NOT NULL,
	Categoria VARCHAR (100) NOT NULL
);

CREATE Table Ventas (
	ID_Cliente INT NOT NULL,
	ID_Product INT NOT NULL,
	ID_Ventas SERIAL PRIMARY KEY,
	Fecha_Venta DATE NOT NULL DEFAULT Current_date,
	Cantidad INT NOT NULL CHECK (Cantidad>0),
	CONSTRAINT fk_ventas_cliente
		FOREIGN KEY (ID_Cliente) REFERENCES clientes (id_cliente),
	CONSTRAINT fk_ventas_producto
		FOREIGN KEY (ID_Product) REFERENCES Productos (id_product)
);

BEGIN;

INSERT INTO clientes (email, first_name, last_name, telefono)
VALUES
    ('lucia.fernandez@mail.com', 'Lucía', 'Fernández', '1155550101'),
    ('martin.gomez@mail.com',    'Martín', 'Gómez',    '1155550102'),
    ('sofia.ruiz@mail.com',      'Sofía',  'Ruiz',     '1155550103'),
    ('diego.paz@mail.com',       'Diego',  'Paz',      '1155550104'),
    ('valeria.sosa@mail.com',    'Valeria','Sosa',     '1155550105');

-- acá van los INSERT de productos y ventas

INSERT INTO Productos (nombre, categoria, precio, stock)
VALUES
	('Alimento balanceado perro adulto 3 kg', 'Alimento',    8500.00, 40),
    ('Alimento balanceado gato adulto 1,5 kg', 'Alimento',   6200.00, 35),
    ('Snacks dentales para perro',             'Alimento',   2300.00, 60),
    ('Correa retráctil 5 m',                   'Accesorios', 7800.00, 25),
    ('Cama acolchada mediana',                 'Accesorios', 15900.00, 12);

--Acá van los INSERT de Ventas

SELECT id_cliente FROM clientes;
SELECT id_product FROM productos;

INSERT INTO ventas (id_cliente, id_product, cantidad)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

COMMIT;

-- 1) Mirar qué filas se van a modificar
SELECT id_product, nombre, categoria, precio
FROM productos
WHERE categoria = 'Alimento';

-- 2) Modificar
UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Alimento';

-- 3) Comprobar
SELECT id_product, nombre, categoria, precio
FROM productos;


SELECT *
FROM Ventas
Where ID_Ventas = 5;

DELETE FROM Ventas
WHERE id_Ventas = 5;

SELECT *
FROM Ventas;
