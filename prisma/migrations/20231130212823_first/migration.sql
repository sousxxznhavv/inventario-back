-- CreateTable
CREATE TABLE `Tipo` (
    `IdTipo` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdTipo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Marca` (
    `IdMarca` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdMarca`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Modelo` (
    `IdModelo` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,
    `IdMarca` INTEGER NOT NULL,

    PRIMARY KEY (`IdModelo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Detalle` (
    `IdDetalle` INTEGER NOT NULL AUTO_INCREMENT,
    `tipoId` INTEGER NOT NULL,
    `marcaId` INTEGER NOT NULL,
    `modeloId` INTEGER NOT NULL,

    PRIMARY KEY (`IdDetalle`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Modelo_Homologado` (
    `IdModeloHomologado` INTEGER NOT NULL AUTO_INCREMENT,
    `num_modelo` VARCHAR(191) NOT NULL,
    `tipo_cpu` VARCHAR(191) NOT NULL,
    `modelo_cpu` VARCHAR(191) NOT NULL,
    `ghz` VARCHAR(191) NOT NULL,
    `hdd` VARCHAR(191) NOT NULL,
    `tipo_hdd` VARCHAR(191) NOT NULL,
    `ram` VARCHAR(191) NOT NULL,
    `detalleId` INTEGER NOT NULL,

    PRIMARY KEY (`IdModeloHomologado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estado` (
    `IdEstado` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdEstado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Moneda` (
    `IdMoneda` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdMoneda`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Proveedor` (
    `IdProveedor` INTEGER NOT NULL AUTO_INCREMENT,
    `ruc` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Proveedor_ruc_key`(`ruc`),
    PRIMARY KEY (`IdProveedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Activo` (
    `IdActivo` INTEGER NOT NULL AUTO_INCREMENT,
    `num_serial` VARCHAR(191) NOT NULL,
    `fec_facturacion` DATETIME(3) NOT NULL,
    `factura` VARCHAR(191) NOT NULL,
    `facturado_a` INTEGER NOT NULL,
    `valor_venta` INTEGER NOT NULL,
    `orden_compra` VARCHAR(191) NOT NULL,
    `anotacion` VARCHAR(191) NOT NULL,
    `estadoId` INTEGER NOT NULL,
    `monedaId` INTEGER NOT NULL,
    `modeloHomologadoId` INTEGER NOT NULL,
    `proveedorId` INTEGER NOT NULL,

    UNIQUE INDEX `Activo_num_serial_key`(`num_serial`),
    PRIMARY KEY (`IdActivo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Empresa` (
    `IdEmpresa` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdEmpresa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Local` (
    `IdLocal` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` INTEGER NOT NULL,
    `empresaId` INTEGER NOT NULL,

    PRIMARY KEY (`IdLocal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Personal` (
    `IdPersonal` INTEGER NOT NULL AUTO_INCREMENT,
    `num_documento` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL,
    `empresaId` INTEGER NOT NULL,

    UNIQUE INDEX `Personal_num_documento_key`(`num_documento`),
    PRIMARY KEY (`IdPersonal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Local_Personal` (
    `IdLocal_Empleado` INTEGER NOT NULL AUTO_INCREMENT,
    `localId` INTEGER NOT NULL,
    `personalId` INTEGER NOT NULL,

    PRIMARY KEY (`IdLocal_Empleado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Area` (
    `IdArea` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdArea`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Asignacion` (
    `IdAsignacion` INTEGER NOT NULL AUTO_INCREMENT,
    `gmd_cpu` VARCHAR(191) NOT NULL,
    `hostname` VARCHAR(191) NOT NULL,
    `sistema_operativo` VARCHAR(191) NOT NULL,
    `local_personalId` INTEGER NOT NULL,
    `areaId` INTEGER NOT NULL,
    `activoId` INTEGER NOT NULL,

    PRIMARY KEY (`IdAsignacion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Modelo` ADD CONSTRAINT `Modelo_IdMarca_fkey` FOREIGN KEY (`IdMarca`) REFERENCES `Marca`(`IdMarca`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_tipoId_fkey` FOREIGN KEY (`tipoId`) REFERENCES `Tipo`(`IdTipo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_marcaId_fkey` FOREIGN KEY (`marcaId`) REFERENCES `Marca`(`IdMarca`) ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_modeloId_fkey` FOREIGN KEY (`modeloId`) REFERENCES `Modelo`(`IdModelo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Modelo_Homologado` ADD CONSTRAINT `Modelo_Homologado_detalleId_fkey` FOREIGN KEY (`detalleId`) REFERENCES `Detalle`(`IdDetalle`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_facturado_a_fkey` FOREIGN KEY (`facturado_a`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_estadoId_fkey` FOREIGN KEY (`estadoId`) REFERENCES `Estado`(`IdEstado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_monedaId_fkey` FOREIGN KEY (`monedaId`) REFERENCES `Moneda`(`IdMoneda`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_modeloHomologadoId_fkey` FOREIGN KEY (`modeloHomologadoId`) REFERENCES `Modelo_Homologado`(`IdModeloHomologado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Activo` ADD CONSTRAINT `Activo_proveedorId_fkey` FOREIGN KEY (`proveedorId`) REFERENCES `Proveedor`(`IdProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Local` ADD CONSTRAINT `Local_empresaId_fkey` FOREIGN KEY (`empresaId`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Personal` ADD CONSTRAINT `Personal_empresaId_fkey` FOREIGN KEY (`empresaId`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Local_Personal` ADD CONSTRAINT `Local_Personal_localId_fkey` FOREIGN KEY (`localId`) REFERENCES `Local`(`IdLocal`) ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Local_Personal` ADD CONSTRAINT `Local_Personal_personalId_fkey` FOREIGN KEY (`personalId`) REFERENCES `Personal`(`IdPersonal`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_local_personalId_fkey` FOREIGN KEY (`local_personalId`) REFERENCES `Local_Personal`(`IdLocal_Empleado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `Area`(`IdArea`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_activoId_fkey` FOREIGN KEY (`activoId`) REFERENCES `Activo`(`IdActivo`) ON DELETE RESTRICT ON UPDATE NO ACTION;
