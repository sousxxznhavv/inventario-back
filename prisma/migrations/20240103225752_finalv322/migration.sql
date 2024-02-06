/*
  Warnings:

  - You are about to drop the column `IdLocal` on the `asignacion` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `asignacion` DROP FOREIGN KEY `Asignacion_IdLocal_fkey`;

-- AlterTable
ALTER TABLE `asignacion` DROP COLUMN `IdLocal`;
