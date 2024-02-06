/*
  Warnings:

  - Added the required column `IdMotivo` to the `Recepcion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `recepcion` ADD COLUMN `IdMotivo` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Motivo` (
    `IdMotivo` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdMotivo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Recepcion` ADD CONSTRAINT `Recepcion_IdMotivo_fkey` FOREIGN KEY (`IdMotivo`) REFERENCES `Motivo`(`IdMotivo`) ON DELETE RESTRICT ON UPDATE CASCADE;
