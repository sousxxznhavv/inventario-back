import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();


router.get('/local', async(req,res)=>{
    const local =  await prisma.local.findMany({
        select:{
            empresa:{
                select:{
                    descrp: true
                }
            },
            IdLocal: true,
            descrp: true
        }
    })
    res.json(local)
})

router.get('/local/:IdEmpresa', async(req, res)=> {
    const {IdEmpresa} = req.params
    const datosTipos = await prisma.local.findMany({
        where: {
            IdEmpresa: +IdEmpresa
        }, select:{
            descrp:true,
        }
    });
    res.json(datosTipos)
})

router.post('/local', async (req,res)=>{
    const nuevoLocal = await prisma.local.create({
        data: req.body,
    });
    res.json(nuevoLocal);
})

export default router;