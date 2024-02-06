import { Router } from "express";
import { PrismaClient } from "@prisma/client"

const router = Router();
const prisma = new PrismaClient();

router.get('/estados', async(req,res)=>{
    const estados = await prisma.estado.findMany()
    res.json(estados)
})

router.post('/estados', async(req,res)=>{
    const nuevoEstado = await prisma.estado.create({
        data: req.body,
    });
    res.json(nuevoEstado)
})

export default router;