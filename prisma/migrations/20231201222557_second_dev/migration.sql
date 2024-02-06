/*
  Warnings:

  - Added the required column `num_modelo` to the `Modelo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `modelo` ADD COLUMN `num_modelo` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `ModeloHomologado` (
    `IdModeloHomologado` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo_cpu` VARCHAR(191) NOT NULL,
    `modelo_cpu` VARCHAR(191) NOT NULL,
    `ghz` VARCHAR(191) NOT NULL,
    `hdd` VARCHAR(191) NOT NULL,
    `tipo_hdd` VARCHAR(191) NOT NULL,
    `ram` VARCHAR(191) NOT NULL,
    `IdTipo` INTEGER NOT NULL,
    `IdMarca` INTEGER NOT NULL,

    PRIMARY KEY (`IdModeloHomologado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ModeloHomologado` ADD CONSTRAINT `ModeloHomologado_IdTipo_fkey` FOREIGN KEY (`IdTipo`) REFERENCES `Tipo`(`IdTipo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ModeloHomologado` ADD CONSTRAINT `ModeloHomologado_IdMarca_fkey` FOREIGN KEY (`IdMarca`) REFERENCES `Marca`(`IdMarca`) ON DELETE RESTRICT ON UPDATE CASCADE;
