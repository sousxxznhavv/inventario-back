import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();


router.get('/modelosHomologados', async(req,res)=>{
    const modelosHomologados =  await prisma.modeloHomologado.findMany(
        {
            select: {
                marca: {
                    select:{
                        descrp:true
                    }
                },
                modelo:{
                    select:{
                        descrp: true
                    }
                },
                tipo:{
                    select:{
                        descrp: true
                    }
                },
                IdModeloHomologado: true,
                tipo_cpu: true,
                modelo_cpu: true,
                ghz: true,
                hdd: true,
                tipo_hdd: true,
                ram: true
            }
        }
    )
    res.json(modelosHomologados)
})

router.get('/modelosHomologados/:IdTipo', async(req, res)=> {
    const {IdTipo} = req.params
    const datosTipos = await prisma.modeloHomologado.findMany({
        where: {
            IdTipo: +IdTipo
        }, select:{
            marca:{
                select:{
                    IdMarca:true,
                    descrp:true,
                }
            },
            modelo:{
                select:{
                    IdModelo:true,
                    descrp:true,
                    num_modelo:true
                }
            },
            IdModeloHomologado: true,
                tipo_cpu: true,
                modelo_cpu: true,
                ghz: true,
                hdd: true,
                tipo_hdd: true,
                ram: true
        }
    });
    res.json(datosTipos)
})



router.post('/modelosHomologados', async (req,res)=>{
    const nuevoModeloHomologado = await prisma.modeloHomologado.create({
        data: req.body,
    });
    res.json(nuevoModeloHomologado);
})

export default router;