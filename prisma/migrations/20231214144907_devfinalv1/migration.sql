/*
  Warnings:

  - A unique constraint covering the columns `[nombreUsuario]` on the table `Empleado` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nombreUsuario` to the `Empleado` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `empleado` ADD COLUMN `nombreUsuario` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Empleado_nombreUsuario_key` ON `Empleado`(`nombreUsuario`);
