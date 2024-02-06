/*
  Warnings:

  - The primary key for the `detalle` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `IdDetalle` on the `detalle` table. All the data in the column will be lost.
  - You are about to drop the column `detalleId` on the `modelo_homologado` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[tipoId]` on the table `Detalle` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[marcaId]` on the table `Detalle` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[modeloId]` on the table `Detalle` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `marcaId` to the `Modelo_Homologado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modeloId` to the `Modelo_Homologado` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoId` to the `Modelo_Homologado` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `modelo_homologado` DROP FOREIGN KEY `Modelo_Homologado_detalleId_fkey`;

-- AlterTable
ALTER TABLE `detalle` DROP PRIMARY KEY,
    DROP COLUMN `IdDetalle`,
    ADD PRIMARY KEY (`tipoId`);

-- AlterTable
ALTER TABLE `modelo_homologado` DROP COLUMN `detalleId`,
    ADD COLUMN `marcaId` INTEGER NOT NULL,
    ADD COLUMN `modeloId` INTEGER NOT NULL,
    ADD COLUMN `tipoId` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Detalle_tipoId_key` ON `Detalle`(`tipoId`);

-- CreateIndex
CREATE UNIQUE INDEX `Detalle_marcaId_key` ON `Detalle`(`marcaId`);

-- CreateIndex
CREATE UNIQUE INDEX `Detalle_modeloId_key` ON `Detalle`(`modeloId`);

-- AddForeignKey
ALTER TABLE `Modelo_Homologado` ADD CONSTRAINT `Modelo_Homologado_tipoId_fkey` FOREIGN KEY (`tipoId`) REFERENCES `Tipo`(`IdTipo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Modelo_Homologado` ADD CONSTRAINT `Modelo_Homologado_marcaId_fkey` FOREIGN KEY (`marcaId`) REFERENCES `Marca`(`IdMarca`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Modelo_Homologado` ADD CONSTRAINT `Modelo_Homologado_modeloId_fkey` FOREIGN KEY (`modeloId`) REFERENCES `Modelo`(`IdModelo`) ON DELETE RESTRICT ON UPDATE CASCADE;
