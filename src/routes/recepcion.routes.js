import { PrismaClient } from "@prisma/client";
import { Router } from "express";
import { upload } from "../helper/multer.js";

const router = Router();
const prisma = new PrismaClient();

router.post("/recepcion", upload.single("file"), async (req, res) => {
  try {
    const { IdActivo, IdMotivo, IdEstado } = req.body;
    const { file } = req;

    if (file && IdMotivo == 1) {
      const extension = file.filename.split(".").at(1);
      let guid = file.filename.split(".").at(0);

      const recepcion = await prisma.recepcion.create({
        data: {
          IdActivo: +IdActivo,
          IdMotivo: +IdMotivo,
        },
      });
      await prisma.archivo.create({
        data: {
          guid: guid,
          nombre: file.originalname,
          extension: extension,
          IdRecepcion: +recepcion.IdRecepcion,
        },
      });

      await prisma.activo.update({
        where: {
          IdActivo: recepcion.IdActivo,
        },
        data: {
          IdEstado: 5,
        },
      });
      return res.json({ ok: true });
    }

    if (IdMotivo == 1) {
      const recepcion = await prisma.recepcion.create({
        data: {
          IdActivo: +IdActivo,
          IdMotivo: +IdMotivo,
        },
      });
      await prisma.activo.update({
        where: {
          IdActivo: recepcion.IdActivo,
        },
        data: {
          IdEstado: 5,
        },
      });
      return res.json({ ok: true });
    } else {
      const recepcion = await prisma.recepcion.create({
        data: {
          IdActivo: +IdActivo,
          IdMotivo: +IdMotivo,
        },
      });
      await prisma.activo.update({
        where: {
          IdActivo: recepcion.IdActivo,
        },
        data: {
          IdEstado: +IdEstado,
        },
      });
      return res.json({ ok: true });
    }
  } catch (error) {
    console.log(error.message);
    res.json({ error: error.message });
  }
});

export default router;
