import { PrismaClient } from "@prisma/client";
import { Router } from "express";

const router = Router();
const prisma = new PrismaClient();

router.get("/file/show", async (req, res) => {
  try {
    const nameFile = await prisma.archivo.findFirst({});
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
        archivos: {
          select: {
            extension: true,
            guid: true,
            nombre: true,
          },
          orderBy: {
            fechaCreacion: "desc",
          },
        },
      },
      orderBy: {
        fechaCreacion: "desc",
      },
    });
    res.json(result);
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
