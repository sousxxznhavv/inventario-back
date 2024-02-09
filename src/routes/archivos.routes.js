import { PrismaClient } from "@prisma/client";
import { Router } from "express";
import fs from "fs";
import path from "path";

const router = Router();
const prisma = new PrismaClient();

router.get("/file/show/:uuid", async (req, res) => {
  try {
    const { uuid } = req.params;

    const nameFile = await prisma.archivo.findFirst({
      where: {
        guid: uuid,
      },
      select: {
        nombre: true,
        extension: true,
      },
    });

    const filePath = path.resolve(`./uploads/${uuid}.${nameFile?.extension}`);

    console.log(filePath);
    if (!fs.existsSync(filePath)) {
      throw new Error("Archivo no encontrado");
    }
    console.log(nameFile);
    if (!nameFile) throw new Error("El archivo no exist");

    res.sendFile(filePath);
  } catch (error) {
    console.log(error.message);
  }
});

router.get("/list/file/:idActivo", async (req, res) => {
  try {
    console.log("Entró");
    const { idActivo } = req.params;

    const result = await prisma.recepcion.findMany({
      where: {
        IdActivo: +idActivo,
      },
      select: {
        IdRecepcion: true,
      },
    });

    const archivos = await prisma.archivo.findMany({
      where: {
        IdRecepcion: result.IdRecepcion,
      },
      select: {
        IdRecepcion: true,
        nombre: true,
        extension: true,
        guid: true,
        fechaCreacion: true,
      },
      orderBy: {
        fechaCreacion: "desc",
      },
      take: 1,
    });
    res.json(archivos);
    /* const archivos = await prisma.archivo.findMany({
      where: {
        IdRecepcion: +idRecepcion,
      },
      select: {
        extension: true,
        guid: true,
        nombre: true,
      },
      orderBy: {
        fechaCreacion: "desc",
      },
      skip: 1,
    }); */
  } catch (error) {
    res.json({ error: error.message });
  }
});

export default router;
