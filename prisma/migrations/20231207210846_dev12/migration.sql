-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_IdEmpresa_fkey` FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa`(`IdEmpresa`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_IdLocal_fkey` FOREIGN KEY (`IdLocal`) REFERENCES `Local`(`IdLocal`) ON DELETE RESTRICT ON UPDATE CASCADE;
