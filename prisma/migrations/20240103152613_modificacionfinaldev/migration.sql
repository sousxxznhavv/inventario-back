/*
  Warnings:

  - You are about to drop the column `IdEmpresa` on the `asignacion` table. All the data in the column will be lost.
  - Added the required column `IdLocal` to the `Asignacion` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `asignacion` DROP FOREIGN KEY `Asignacion_IdEmpresa_fkey`;

-- AlterTable
ALTER TABLE `asignacion` DROP COLUMN `IdEmpresa`,
    ADD COLUMN `IdLocal` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_IdLocal_fkey` FOREIGN KEY (`IdLocal`) REFERENCES `Local`(`IdLocal`) ON DELETE RESTRICT ON UPDATE CASCADE;
