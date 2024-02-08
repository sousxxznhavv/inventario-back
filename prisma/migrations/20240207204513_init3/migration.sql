-- CreateTable
CREATE TABLE `Archivo` (
    `IdArchivo` INTEGER NOT NULL AUTO_INCREMENT,
    `guid` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NULL,
    `extension` VARCHAR(191) NULL,
    `IdActivo` INTEGER NOT NULL,
    `fechaCreacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `fechaActualizacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`IdArchivo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Archivo` ADD CONSTRAINT `Archivo_IdArchivo_fkey` FOREIGN KEY (`IdArchivo`) REFERENCES `Activo`(`IdActivo`) ON DELETE RESTRICT ON UPDATE CASCADE;
