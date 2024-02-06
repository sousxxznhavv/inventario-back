-- CreateTable
CREATE TABLE `Proveedor` (
    `IdProveedor` INTEGER NOT NULL AUTO_INCREMENT,
    `ruc` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Proveedor_ruc_key`(`ruc`),
    PRIMARY KEY (`IdProveedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estado` (
    `IdEstado` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdEstado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Moneda` (
    `IdMoneda` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdMoneda`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Activo` (
    `IdActivo` INTEGER NOT NULL AUTO_INCREMENT,
    `num_serial` VARCHAR(191) NOT NULL,
    `IdModeloHomologado` INTEGER NOT NULL,
    `fec_facturacion` DATETIME(3) NOT NULL,
    `factura` VARCHAR(191) NOT NULL,
    `IdEmpresa` INTEGER NOT NULL,
    `valor_venta` INTEGER NOT NULL,
    `orden_compra` VARCHAR(191) NOT NULL,
    `anotacion` VARCHAR(191) NOT NULL,
    `IdEstado` INTEGER NOT NULL,
    `IdMoneda` INTEGER NOT NULL,
    `IdProveedor` INTEGER NOT NULL,

    UNIQUE INDEX `Activo_num_serial_key`(`num_serial`),
    PRIMARY KEY (`IdActivo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Empresa` (
    `IdEmpresa` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdEmpresa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_IdModeloHomologado_fkey` FOREIGN KEY (`IdModeloHomologado`) REFERENCES `ModeloHomologado`(`IdModeloHomologado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_IdEmpresa_fkey` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_IdEstado_fkey` FOREIGN KEY (`IdEstado`) REFERENCES `Estado`(`IdEstado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_IdMoneda_fkey` FOREIGN KEY (`IdMoneda`) REFERENCES `Moneda`(`IdMoneda`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_IdProveedor_fkey` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedor`(`IdProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;
