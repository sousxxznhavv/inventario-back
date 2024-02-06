import { Router } from "express";
import { PrismaClient } from "@prisma/client"

const router = Router();
const prisma = new PrismaClient();

router.get('/empresas', async(req,res)=>{
    const empresas = await prisma.empresa.findMany()
    res.json(empresas)
})

router.post('/empresas', async(req,res)=>{
    const nuevaEmpresa = await prisma.empresa.create({
        data: req.body,
    });
    res.json(nuevaEmpresa)
})

export default router;