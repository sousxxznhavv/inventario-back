/*
  Warnings:

  - You are about to drop the column `usuario` on the `asignacion` table. All the data in the column will be lost.
  - Added the required column `IdEmpleado` to the `Asignacion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `asignacion` DROP COLUMN `usuario`,
    ADD COLUMN `IdEmpleado` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Asignacion` ADD CONSTRAINT `Asignacion_IdEmpleado_fkey` FOREIGN KEY (`IdEmpleado`) REFERENCES `Empleado`(`IdEmpleado`) ON DELETE RESTRICT ON UPDATE CASCADE;
