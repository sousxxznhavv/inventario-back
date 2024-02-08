/*
  Warnings:

  - You are about to drop the column `IdActivo` on the `archivo` table. All the data in the column will be lost.
  - Added the required column `IdRecepcion` to the `Archivo` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `archivo` DROP FOREIGN KEY `Archivo_IdArchivo_fkey`;

-- AlterTable
ALTER TABLE `archivo` DROP COLUMN `IdActivo`,
    ADD COLUMN `IdRecepcion` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Archivo` ADD CONSTRAINT `Archivo_IdArchivo_fkey` FOREIGN KEY (`IdArchivo`) REFERENCES `Recepcion`(`IdRecepcion`) ON DELETE RESTRICT ON UPDATE CASCADE;
