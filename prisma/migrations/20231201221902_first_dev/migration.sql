/*
  Warnings:

  - You are about to drop the column `nombre` on the `marca` table. All the data in the column will be lost.
  - You are about to drop the column `tipoId` on the `marca` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `modelo` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `tipo` table. All the data in the column will be lost.
  - You are about to drop the `detalle` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `descrp` to the `Marca` table without a default value. This is not possible if the table is not empty.
  - Added the required column `descrp` to the `Modelo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `descrp` to the `Tipo` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `detalle` DROP FOREIGN KEY `Detalle_marcaId_fkey`;

-- DropForeignKey
ALTER TABLE `detalle` DROP FOREIGN KEY `Detalle_tipoId_fkey`;

-- DropForeignKey
ALTER TABLE `marca` DROP FOREIGN KEY `Marca_tipoId_fkey`;

-- DropIndex
DROP INDEX `Marca_nombre_tipoId_key` ON `marca`;

-- DropIndex
DROP INDEX `Modelo_nombre_IdMarca_key` ON `modelo`;

-- AlterTable
ALTER TABLE `marca` DROP COLUMN `nombre`,
    DROP COLUMN `tipoId`,
    ADD COLUMN `descrp` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `modelo` DROP COLUMN `nombre`,
    ADD COLUMN `descrp` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tipo` DROP COLUMN `nombre`,
    ADD COLUMN `descrp` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `detalle`;
