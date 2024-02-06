/*
  Warnings:

  - You are about to drop the column `modeloId` on the `detalle` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `detalle` DROP FOREIGN KEY `Detalle_modeloId_fkey`;

-- AlterTable
ALTER TABLE `detalle` DROP COLUMN `modeloId`;
