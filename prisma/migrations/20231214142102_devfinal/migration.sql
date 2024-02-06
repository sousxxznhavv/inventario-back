/*
  Warnings:

  - Added the required column `IdTipoDocumento` to the `Empleado` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `empleado` ADD COLUMN `IdTipoDocumento` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `TipoDocumento` (
    `IdTipoDocumento` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdTipoDocumento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_IdTipoDocumento_fkey` FOREIGN KEY (`IdTipoDocumento`) REFERENCES `TipoDocumento`(`IdTipoDocumento`) ON DELETE RESTRICT ON UPDATE CASCADE;
