import { Router } from "express";
import { PrismaClient} from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/monedas', async(req,res)=>{
    const monedas = await prisma.moneda.findMany()
    res.json(monedas)
})

router.post('/monedas', async(req,res)=>{
    const nuevaMoneda = await prisma.moneda.create({
        data: req.body,
    });
    res.json(nuevaMoneda)
})


export default router;