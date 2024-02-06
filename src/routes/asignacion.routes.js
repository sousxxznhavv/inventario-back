import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();


router.get('/asignacion', async(req,res)=>{
    const asignados =  await prisma.asignacion.findMany({
        select:{
            activo:{
                select:{
                    IdActivo:true,
                    num_serial:true,
                }
            },
            gmd_cpu:true,
            hostname:true,
            sistema_operativo:true,
            empleado:{
                select:{
                    nombreUsuario:true,
                    local:true,
                    empresa:true,
                }
            },
            area:true,
        }
    });
    res.json(asignados)
})


router.get('/asignacion/tabla/:IdActivo', async(req,res)=>{
    const {IdActivo} = req.params
    const asignarTabla = await prisma.asignacion.findFirst({
        where: {
    activo: {
      IdActivo: +IdActivo,
    },
  },
  include:{
    activo:{
        select:{
            modeloHomologado:{
                select:{
                    modelo:true,
                }
            }
        }
    }
  }
    });
    res.json(asignarTabla)
})



router.get('/asignacion/:numSerial', async(req,res)=>{
    const {numSerial} = req.params
    const asignados =  await prisma.asignacion.findMany({
        where:{
            activo:{
                num_serial:numSerial,
            },
        },
    select:{
            activo:{
                select:{
                    IdActivo:true,
                    num_serial:true,
                }
            },
            gmd_cpu:true,
            hostname:true,
            sistema_operativo:true,
            empleado:{
                select:{
                    nombreUsuario:true,
                    local:true,
                    empresa:true,
                }
            },
            area:true,
        }
    });
    res.json(asignados)
})

router.get('/asignacion/editar/:IdActivo', async (req, res) => {
    const { IdActivo } = req.params;

    try {
        const activos = await prisma.asignacion.findMany({
            where: {
                IdActivo: +IdActivo
            },
            select: {
                gmd_cpu: true,
                hostname: true,
                sistema_operativo: true,
                empleado: true,
                area: true,
            },
            orderBy: {
                IdAsignacion: 'desc' 
            },
            take: 1 
        });

        if (activos.length === 0) {
            return res.status(404).json({ message: 'No se encontraron registros para el IdActivo proporcionado' });
        }

        res.json(activos[0]); // Devolver el primer (y último) registro encontrado
    } catch (error) {
        console.error('Error al obtener el último registro:', error);
        res.status(500).json({ message: 'Se produjo un error al obtener el último registro' });
    }
});



router.post('/asignacion', async (req,res)=>{
    try {
        console.log(req.body)
        const nuevoActivo = await prisma.asignacion.create({
        data: req.body,
    });

    await prisma.activo.update({
        where: {
            IdActivo: req.body.IdActivo
        }, data:{
            IdEstado: 1
        }
    })
    console.log(nuevoActivo);

    res.json(nuevoActivo);
    } catch (error) {
        console.log(error.message)
    }
    
})

export default router;