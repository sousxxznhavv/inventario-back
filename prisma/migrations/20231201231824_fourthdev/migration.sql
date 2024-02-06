-- CreateTable
CREATE TABLE `Local` (
    `IdLocal` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdLocal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Empleado` (
    `IdEmpleado` INTEGER NOT NULL AUTO_INCREMENT,
    `num_documento` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Empleado_num_documento_key`(`num_documento`),
    PRIMARY KEY (`IdEmpleado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EmpresaLocal` (
    `IdEmpresa` INTEGER NOT NULL,
    `IdLocal` INTEGER NOT NULL,

    UNIQUE INDEX `EmpresaLocal_IdEmpresa_IdLocal_key`(`IdEmpresa`, `IdLocal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `EmpresaLocal` ADD CONSTRAINT `EmpresaLocal_IdEmpresa_fkey` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmpresaLocal` ADD CONSTRAINT `EmpresaLocal_IdLocal_fkey` FOREIGN KEY (`IdLocal`) REFERENCES `Local`(`IdLocal`) ON DELETE RESTRICT ON UPDATE CASCADE;
