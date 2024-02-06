import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();


router.get('/empleado', async(req,res)=>{
    const empleado =  await prisma.empleado.findMany({
        select:{
            empresa:{
                select:{
                    descrp: true
                }
            },
            local:{
                select:{
                    descrp: true
                }
            },
            IdEmpleado: true,
            tipoDocumento:{
                select:{
                    descrp:true,
                }
            },
            num_documento: true,
            nombre: true,
            nombreUsuario: true,
        }
    })
    res.json(empleado)
})


router.get('/empleado/:nombreUsuario', async(req,res)=>{
    const {nombreUsuario} = req.params
    const datosUsuario = await prisma.empleado.findMany({
        where: {
            nombreUsuario: nombreUsuario
        }, select: {
            empresa:{
                select: {
                    descrp: true,
                }
            },
            local: {
                select: {
                    descrp: true,
                }
            }
        }
    })
    res.json(datosUsuario)
})

router.post('/empleado', async (req,res)=>{
    const nuevoEmpleado = await prisma.empleado.create({
        data: req.body,
    });
    res.json(nuevoEmpleado);
})

export default router;