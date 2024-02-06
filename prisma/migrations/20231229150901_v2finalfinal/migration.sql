/*
  Warnings:

  - Added the required column `IdActivo` to the `Asignacion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `asignacion` ADD COLUMN `IdActivo` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_IdActivo_fkey` FOREIGN KEY (`IdActivo`) REFERENCES `Activo`(`IdActivo`) ON DELETE RESTRICT ON UPDATE CASCADE;
