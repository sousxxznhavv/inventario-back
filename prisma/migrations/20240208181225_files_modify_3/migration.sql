/*
  Warnings:

  - Made the column `IdRecepcion` on table `archivo` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `archivo` MODIFY `IdRecepcion` INTEGER NOT NULL;
