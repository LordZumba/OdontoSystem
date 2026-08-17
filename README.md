# OdontoSystem
Proyecto para integrador
Hola chicas, disculpen la demora, pero aquí esta el proyecto, debería explicarles esto por Discord capaz, pero ya que está esto, se los dejo por aquí también por si acaso.
Para empezar, el proyecto esta adaptado para ejecutarse en apache netbeans, solo tienen que extraerlo y abrir el proyecto, no es necesario cambiar nada realmente, debería funcionar como tal, lo único que si deberían hacer para que pueda correr a la primera, es darle "clean and build" al momento de abrir el proyecto en vuestro apache netbeans, esta adaptado con las ultimas versiones de JSTL y tomcat 10.1, para que las dependencias se instalen automáticamente es necesario que hagan eso, luego de hacerlo solo prendan su servidor en tomcat y luego pueden correr el proyecto, debería funcionarles dado que la base de datos no es local, pero de igual manera les paso el backup de la BD para que lo puedan revisar y vean como es que funciona o si le quieren editar algo de casualidad, si por a o b no les abre el Backup, el texto plano es este:

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    residencia VARCHAR(150),
    foto VARCHAR(255),
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('ADMIN','CLIENTE')),
    estado VARCHAR(20) DEFAULT 'ACTIVO' CHECK (estado IN ('ACTIVO','INACTIVO'))
);

CREATE TABLE citas (
    id_cita SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_atencion DATE,
    hora_atencion TIME,
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
        CHECK (estado IN ('PENDIENTE','APROBADA','RECHAZADA','FINALIZADA','CANCELADA')),
    motivo_rechazo TEXT,
    monto NUMERIC(10,2),

    CONSTRAINT fk_cita_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
);

CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_cita INT UNIQUE NOT NULL,
    metodo_pago VARCHAR(20)
        CHECK (metodo_pago IN ('EFECTIVO','YAPE','PLIN','TARJETA')),
    tipo_pago VARCHAR(20)
        CHECK (tipo_pago IN ('CONTADO','CUOTAS')),
    numero_cuotas INT DEFAULT 1,
    monto_total NUMERIC(10,2) NOT NULL,
    monto_cuota NUMERIC(10,2),
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
        CHECK (estado IN ('PENDIENTE','PARCIAL','PAGADO')),

    CONSTRAINT fk_pago_cita
        FOREIGN KEY(id_cita)
        REFERENCES citas(id_cita)
        ON DELETE CASCADE
);

CREATE TABLE cuotas (
    id_cuota SERIAL PRIMARY KEY,
    id_pago INT NOT NULL,
    numero_cuota INT NOT NULL,
    fecha_vencimiento DATE,
    monto NUMERIC(10,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
        CHECK (estado IN ('PENDIENTE','PAGADA')),

    CONSTRAINT fk_cuota_pago
        FOREIGN KEY(id_pago)
        REFERENCES pagos(id_pago)
        ON DELETE CASCADE
);

CREATE TABLE odontogramas (
    id_odontograma SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    imagen VARCHAR(255) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_odontograma_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
);

CREATE TABLE notas_paciente (
    id_nota SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_nota_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
);

CREATE TABLE documentos_paciente (
    id_documento SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    archivo VARCHAR(255) NOT NULL,
    tipo VARCHAR(50),
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_documento_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
);

CREATE TABLE bloqueos_calendario (
    id_bloqueo SERIAL PRIMARY KEY,
    fecha DATE NOT NULL UNIQUE,
    motivo VARCHAR(255) NOT NULL
);

-- ==========================================
-- USUARIO ADMINISTRADOR INICIAL
-- ==========================================

INSERT INTO usuarios
(nombre, apellido, correo, password, telefono, residencia, foto, rol)
VALUES
(
'Administrador',
'Sistema',
'admin@odontosystem.com',
'admin123',
'999999999',
'Ica',
NULL,
'ADMIN'
);

Como pueden ver, esta todo en texto plano, las claves no están hasheadas porque necesitaba hacer funcionar el proyecto en primer lugar, luego ya lo presente de esa forma por ahorrarme tiempo en traspasar de local a nube. 
Creo que es todo lo que necesitan saber para poder hacer funcionar el proyecto, si necesitan ayuda con algo más o entender alguna parte del código, me avisan para poder responderles al toque.
