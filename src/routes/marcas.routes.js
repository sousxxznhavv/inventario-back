import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/marcas', async(req,res)=>{
    const marcas = await prisma.marca.findMany();
    res.json(marcas)
})


router.post('/marcas', async(req,res)=>{
    const nuevaMarca = await prisma.marca.create({
        data: req.body,
    });
    res.json(nuevaMarca);
})



export default router;