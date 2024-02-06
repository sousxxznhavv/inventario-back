import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();



router.get('/activos/total', async(req,res)=>{
    const activos =  await prisma.activo.findMany({
        select:{
            IdActivo:true,
            num_serial: true,
            asignacion:{
                select:{
                    empleado:{
                    select:{
                        IdEmpleado:true,
                        nombreUsuario:true
                    }
                }
            },orderBy:{
                IdAsignacion: 'desc'
            }, take: 1
            },
            modeloHomologado:{
                select:{
                    tipo:{
                        select: {
                            descrp:true
                        }
                    },
                    marca:{
                        select:{
                            descrp:true,
                        }
                    }, modelo:{
                        select:{
                            descrp:true,
                            num_modelo:true,
                        }
                    }
                }
            },
            IdEstado:true,
            estado: {
                select:{
                    descrp: true,
                }
            },
            
        }
    })
    res.json(activos)
})




router.get('/activos', async(req,res)=>{
    const activos =  await prisma.activo.findMany({
        where: {
            IdEstado: 5
        }, select:{
            IdModeloHomologado: true,
            num_serial: true,
            modeloHomologado:{
                select:{
                    tipo:{
                        select:{
                            descrp: true,
                        }
                    },
                    marca:{
                        select:{
                            descrp: true,
                        }
                    },
                    modelo:{
                        select:{
                            descrp:true,
                            num_modelo: true,
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
            }, estado:true
        }
    })
    res.json(activos)
})

router.get('/activos/asignados', async(req,res)=>{
const asignados = await prisma.activo.findMany({
    where:{ IdEstado: 1,  
        }, select:{
            IdActivo: true,
            num_serial:true,
            modeloHomologado:{
                select:{
                    tipo:{
                        select:{
                            descrp: true,
                        }
                    },
                    marca:{
                        select:{
                            descrp: true,
                        }
                    },
                    modelo:{
                        select:{
                            descrp:true,
                            num_modelo: true,
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
            },estado:{
                select:{
                    descrp:true,
                }
            }
        }
})
res.json(asignados)
})

router.get('/activos/:numSerial', async(req,res)=>{
    const {numSerial} = req.params
    const datosNumSerial = await prisma.activo.findMany({
        where:{ AND: [
            {
                num_serial: numSerial,
            },
            {
                IdEstado: 5
            }
        ]  
        }, select:{
            IdActivo: true,
            modeloHomologado:{
                select:{
                    tipo:{
                        select:{
                            descrp: true,
                        }
                    },
                    marca:{
                        select:{
                            descrp: true,
                        }
                    },
                    modelo:{
                        select:{
                            descrp:true,
                            num_modelo: true,
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
        }
    })
    res.json(datosNumSerial)
})


router.get('/activos/asignados/:numSerial', async(req,res)=>{
    const {numSerial} = req.params
    const datosNumSerial = await prisma.activo.findMany({
        where:{ AND: [
            {
                num_serial: numSerial,
            },
            {
                IdEstado: 1
            }
        ]  
        }, select:{
            IdActivo: true,
            estado: {
                select:{
                    descrp:true
                }
            },
            modeloHomologado:{
                select:{
                    tipo:{
                        select:{
                            descrp: true,
                        }
                    },
                    marca:{
                        select:{
                            descrp: true,
                        }
                    },
                    modelo:{
                        select:{
                            descrp:true,
                            num_modelo: true,
                        }
                    },
                IdModeloHomologado: true,
                tipo_cpu: true,
                modelo_cpu: true,
                ghz: true,
                hdd: true,
                tipo_hdd: true,
                ram: true,
            
                }
            }
        }
    })
    res.json(datosNumSerial)
})

router.post('/activos', async(req,res)=>{
    const {body} = req
    console.log(body)
    try {
        const nuevoActivo = await prisma.activo.create({
        data: { 
            IdModeloHomologado: +body.marca_modelo.IdModeloHomologado,
            num_serial: body.num_serial,
            fec_facturacion: new Date(body.fec_facturacion).toISOString(),
            IdProveedor: +body.IdProveedor,
            factura: body.factura,
            IdEmpresa: +body.IdEmpresa,
            IdMoneda: +body.IdMoneda,
            valor_venta: +body.valor_venta,
            orden_compra: body.orden_compra,
            anotacion: body.anotacion,
            IdEstado: 5
        },
    })
    console.log(body.marca_modelo.IdModeloHomologado)
    res.json("Al fín!!!");
    } catch (error) {
        console.log(error)
        res.status(500).json({error: error.message})
    }    
})


router.get('/activos/buscar/:IdActivo', async(req,res)=>{
    const {IdActivo} = req.params;
    try {
        const nuevoActivo = await prisma.activo.findMany({
        where:{
            IdActivo: +IdActivo
        }
    })
    console.log(body.marca_modelo.IdModeloHomologado)
    res.json("Al fín!!!");
    } catch (error) {
        console.log(error)
        res.status(500).json({error: error.message})
    }    
})

router.get('/activos/editar/:IdActivo',async(req,res)=>{
    const {IdActivo} = req.params
    const activos = await prisma.activo.findMany({
        where:{
            IdActivo: + IdActivo
        },
        select:{
            IdActivo: true,
            IdModeloHomologado:true,
            modeloHomologado:{
                select:{
                 tipo:{
                    select:{
                        IdTipo:true,
                        descrp:true
                    }
                 },
                 modelo:{
                    select:{
                        IdModelo:true,
                        descrp:true,
                        num_modelo:true,
                    }
                 },
                 marca:{
                    select:{
                        IdMarca:true,
                        descrp: true
                    }
                 },
                   
                }
            },
            num_serial: true,
            fec_facturacion: true,
            proveedor:{
                select:{
                    IdProveedor: true,
                    ruc: true,
                    nombre: true
                },
            },
            factura:true,
            empresa: true,
            moneda:true,
            valor_venta:true,
            orden_compra:true,
            anotacion:true,
            estado:true
        }
    })
    res.json(activos)
})


router.put('/activos/:id', async (req, res) => {
  const { body, params } = req;
  console.log(body);

  try {
    const idActivo = +params.id;
    const activoActualizado = await prisma.activo.update({
      where: {
        IdActivo: +idActivo,
      },
      data: { 
            IdModeloHomologado: +body.marca_modelo.IdModeloHomologado,
            num_serial: body.num_serial,
            fec_facturacion: new Date(body.fec_facturacion).toISOString(),
            IdProveedor: +body.IdProveedor,
            factura: body.factura,
            IdEmpresa: +body.IdEmpresa,
            IdMoneda: +body.IdMoneda,
            valor_venta: +body.valor_venta,
            orden_compra: body.orden_compra,
            anotacion: body.anotacion
        },
    });

    res.json("¡Actualizado exitosamente!");
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: error.message });
  }
});



export default router;