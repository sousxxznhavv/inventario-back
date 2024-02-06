import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/modelos', async(req,res)=>{
    const modelos = await prisma.modelo.findMany({
        select: {
            marca: {
                select: {
                    descrp: true
                }
            },
            descrp: true,
            num_modelo:true,
            IdModelo: true
        }
    });
    res.json(modelos)
})

router.get('/modelos/:IdMarca', async(req,res)=>{
    const {IdMarca} = req.params
    const modelos = await prisma.modelo.findMany({
        where: {
                IdMarca: +IdMarca
        },
        select: {
            IdModelo: true,
            descrp: true,
            num_modelo: true
            
        },
    });
    res.json(modelos)
})

router.get('/modelos/:IdMarca/:IdModelo', async(req,res)=>{
    const {IdMarca} = req.params
    const {IdModelo} = req.params
    const modelos = await prisma.modelo.findMany({
        where: {
                AND:[{
                    IdMarca: +IdMarca,
                
                }, {IdModelo: +IdModelo,}]
        },
        select: {
            descrp: true,
            num_modelo: true
            
        },
    });
    res.json(modelos)
})

router.post('/modelos', async(req,res)=>{
    try {
        const nuevoModelo = await prisma.modelo.create({
        data: req.body,
    });
    res.json(nuevoModelo)
    } catch (error) {
        console.log(error.message)
        res.json(error.message)
    }
    
})

export default router;