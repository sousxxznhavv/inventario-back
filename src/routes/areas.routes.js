import { Router } from "express";
import { PrismaClient } from "@prisma/client"

const router = Router();
const prisma = new PrismaClient();

router.get('/areas', async (req, res) => {
    try {
        const areas = await prisma.area.findMany();
        res.json(areas);
    } catch (error) {
        console.error('Error al obtener áreas:', error);
        res.status(500).json({ error: 'Error al obtener áreas' });
    }
});

router.post('/areas', async (req, res) => {
    try {
        // Validar datos de entrada
        const { descrp } = req.body;

        if (!descrp) {
            return res.status(400).json({ error: 'Faltan datos obligatorios' });
        }

        // Validar que no se ingresen solo espacios en blanco
        if (descrp.trim() === '') {
            return res.status(400).json({ error: 'El campo no puede estar vacío' });
        }

        const nuevaArea = await prisma.area.create({
            data: { descrp },
        });

         // Verificar si la descripción ya existe
    // const empresaExistente = await prisma.empresa.findMany({
    //     where: { descrp }
    // });

    // if (empresaExistente) {
    //     return res.status(400).json({ error: 'La descripción ya existe en la base de datos' });
    // }


        res.json(nuevaArea);
    } catch (error) {
        console.error('Error al crear área:', error);
        res.status(500).json({ error: 'Error al crear área' });
    }
});

export default router;