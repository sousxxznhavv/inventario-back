import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma =  new PrismaClient();

router.post("/recepcion", async(req,res)=>{
try {
    const {IdActivo, IdMotivo, IdEstado} = req.body
    if(IdMotivo == 1) return res.json( await prisma.activo.update({
        where:{
            IdActivo: +IdActivo,
        },
        data:{
            IdEstado: 5,
        }
    }))

    if (IdMotivo == 2) return res.json( await prisma.activo.update({
        where:{
            IdActivo: +IdActivo,
        },
        data:{
            IdEstado: +IdEstado,
        }
    }))



} catch (error) {
    console.log(error.message)
}
})

export default router;