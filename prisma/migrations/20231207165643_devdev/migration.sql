/*
  Warnings:

  - Added the required column `IdModelo` to the `ModeloHomologado` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `modelohomologado` ADD COLUMN `IdModelo` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `ModeloHomologado` ADD CONSTRAINT `ModeloHomologado_IdModelo_fkey` FOREIGN KEY (`IdModelo`) REFERENCES `Modelo`(`IdModelo`) ON DELETE RESTRICT ON UPDATE CASCADE;
