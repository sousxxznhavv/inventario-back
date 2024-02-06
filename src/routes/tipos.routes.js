import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();


router.get('/tipos', async(req,res)=>{
    const tipos =  await prisma.tipo.findMany()
    res.json(tipos)
})

router.post('/tipos', async (req,res)=>{
    const nuevoTipo = await prisma.tipo.create({
        data: req.body,
    });
    res.json(nuevoTipo);
})

export default router;