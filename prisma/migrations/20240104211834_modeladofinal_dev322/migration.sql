-- CreateTable
CREATE TABLE `Recepcion` (
    `IdRecepcion` INTEGER NOT NULL AUTO_INCREMENT,
    `IdActivo` INTEGER NOT NULL,

    PRIMARY KEY (`IdRecepcion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Recepcion` ADD CONSTRAINT `Recepcion_IdActivo_fkey` FOREIGN KEY (`IdActivo`) REFERENCES `Activo`(`IdActivo`) ON DELETE RESTRICT ON UPDATE CASCADE;
