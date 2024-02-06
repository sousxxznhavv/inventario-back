import { Router } from "express";
import { PrismaClient } from "@prisma/client"

const router = Router();
const prisma = new PrismaClient();

router.get('/tipoDocumentos', async(req,res)=>{
    const estados = await prisma.tipoDocumento.findMany()
    res.json(estados)
})

router.post('/tipoDocumentos', async(req,res)=>{
    const nuevoEstado = await prisma.tipoDocumento.create({
        data: req.body,
    });
    res.json(nuevoEstado)
})

export default router;