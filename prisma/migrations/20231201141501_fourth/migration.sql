/*
  Warnings:

  - A unique constraint covering the columns `[nombre,tipoId]` on the table `Marca` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Marca_nombre_tipoId_key` ON `Marca`(`nombre`, `tipoId`);
