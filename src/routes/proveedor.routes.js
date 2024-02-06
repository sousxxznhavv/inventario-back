import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/proveedor', async (req, res)=>{
    const proveedor = await prisma.proveedor.findMany()
    res.json(proveedor)
})

router.post('/proveedor', async(req, res) =>{
    const newProveedor = await prisma.proveedor.create({
        data: req.body,
    });
    res.json(newProveedor);
})

export default router;