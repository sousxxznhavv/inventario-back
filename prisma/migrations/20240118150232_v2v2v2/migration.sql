-- CreateTable
CREATE TABLE `Usuario` (
    `IdUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,
    `correo` VARCHAR(191) NOT NULL,
    `IdRol` INTEGER NOT NULL,

    PRIMARY KEY (`IdUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rol` (
    `IdRol` INTEGER NOT NULL AUTO_INCREMENT,
    `descrp` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`IdRol`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Usuario` ADD CONSTRAINT `Usuario_IdRol_fkey` FOREIGN KEY (`IdRol`) REFERENCES `Rol`(`IdRol`) ON DELETE RESTRICT ON UPDATE CASCADE;
