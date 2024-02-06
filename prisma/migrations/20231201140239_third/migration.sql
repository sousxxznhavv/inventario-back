/*
  Warnings:

  - The primary key for the `detalle` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `activo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `area` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `asignacion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `empresa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `estado` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `local` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `local_personal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `modelo_homologado` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `moneda` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `personal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `proveedor` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `tipoId` to the `Marca` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `activo` DROP FOREIGN KEY `Activo_estadoId_fkey`;

-- DropForeignKey
ALTER TABLE `activo` DROP FOREIGN KEY `Activo_facturado_a_fkey`;

-- DropForeignKey
ALTER TABLE `activo` DROP FOREIGN KEY `Activo_modeloHomologadoId_fkey`;

-- DropForeignKey
ALTER TABLE `activo` DROP FOREIGN KEY `Activo_monedaId_fkey`;

-- DropForeignKey
ALTER TABLE `activo` DROP FOREIGN KEY `Activo_proveedorId_fkey`;

-- DropForeignKey
ALTER TABLE `asignacion` DROP FOREIGN KEY `Asignacion_activoId_fkey`;

-- DropForeignKey
ALTER TABLE `asignacion` DROP FOREIGN KEY `Asignacion_areaId_fkey`;

-- DropForeignKey
ALTER TABLE `asignacion` DROP FOREIGN KEY `Asignacion_local_personalId_fkey`;

-- DropForeignKey
ALTER TABLE `local` DROP FOREIGN KEY `Local_empresaId_fkey`;

-- DropForeignKey
ALTER TABLE `local_personal` DROP FOREIGN KEY `Local_Personal_localId_fkey`;

-- DropForeignKey
ALTER TABLE `local_personal` DROP FOREIGN KEY `Local_Personal_personalId_fkey`;

-- DropForeignKey
ALTER TABLE `modelo_homologado` DROP FOREIGN KEY `Modelo_Homologado_marcaId_fkey`;

-- DropForeignKey
ALTER TABLE `modelo_homologado` DROP FOREIGN KEY `Modelo_Homologado_modeloId_fkey`;

-- DropForeignKey
ALTER TABLE `modelo_homologado` DROP FOREIGN KEY `Modelo_Homologado_tipoId_fkey`;

-- DropForeignKey
ALTER TABLE `personal` DROP FOREIGN KEY `Personal_empresaId_fkey`;

-- AlterTable
ALTER TABLE `detalle` DROP PRIMARY KEY;

-- AlterTable
ALTER TABLE `marca` ADD COLUMN `tipoId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `activo`;

-- DropTable
DROP TABLE `area`;

-- DropTable
DROP TABLE `asignacion`;

-- DropTable
DROP TABLE `empresa`;

-- DropTable
DROP TABLE `estado`;

-- DropTable
DROP TABLE `local`;

-- DropTable
DROP TABLE `local_personal`;

-- DropTable
DROP TABLE `modelo_homologado`;

-- DropTable
DROP TABLE `moneda`;

-- DropTable
DROP TABLE `personal`;

-- DropTable
DROP TABLE `proveedor`;

-- AddForeignKey
ALTER TABLE `Marca` ADD CONSTRAINT `Marca_tipoId_fkey` FOREIGN KEY (`tipoId`) REFERENCES `Tipo`(`IdTipo`) ON DELETE RESTRICT ON UPDATE CASCADE;
