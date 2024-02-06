/*
  Warnings:

  - You are about to drop the `empresalocal` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `IdEmpresa` to the `Local` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `empleado` DROP FOREIGN KEY `Empleado_IdEmpresa_IdLocal_fkey`;

-- DropForeignKey
ALTER TABLE `empresalocal` DROP FOREIGN KEY `EmpresaLocal_IdEmpresa_fkey`;

-- DropForeignKey
ALTER TABLE `empresalocal` DROP FOREIGN KEY `EmpresaLocal_IdLocal_fkey`;

-- AlterTable
ALTER TABLE `local` ADD COLUMN `IdEmpresa` INTEGER NOT NULL;

-- DropTable
DROP TABLE `empresalocal`;

-- AddForeignKey
ALTER TABLE `Local` ADD CONSTRAINT `Local_IdEmpresa_fkey` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;
