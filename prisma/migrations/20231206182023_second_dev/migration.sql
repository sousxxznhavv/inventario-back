/*
  Warnings:

  - Added the required column `IdArea` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IdEmpresa` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gmd_cpu` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hostname` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sistema_operativo` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario` to the `Asignacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IdEmpresa` to the `Empleado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IdLocal` to the `Empleado` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `asignacion` ADD COLUMN `IdArea` INTEGER NOT NULL,
    ADD COLUMN `IdEmpresa` INTEGER NOT NULL,
    ADD COLUMN `gmd_cpu` VARCHAR(191) NOT NULL,
    ADD COLUMN `hostname` VARCHAR(191) NOT NULL,
    ADD COLUMN `sistema_operativo` VARCHAR(191) NOT NULL,
    ADD COLUMN `usuario` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `empleado` ADD COLUMN `IdEmpresa` INTEGER NOT NULL,
    ADD COLUMN `IdLocal` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Area` (
    `IdArea` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdArea`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `empresaLocalIndex` ON `Empleado`(`IdEmpresa`, `IdLocal`);

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_IdEmpresa_IdLocal_fkey` FOREIGN KEY (`IdEmpresa`, `IdLocal`) REFERENCES `EmpresaLocal`(`IdEmpresa`, `IdLocal`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_IdArea_fkey` FOREIGN KEY (`IdArea`) REFERENCES `Area`(`IdArea`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_IdEmpresa_fkey` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;
