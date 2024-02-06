import { Router } from "express";
import { PrismaClient } from "@prisma/client"

const router = Router();
const prisma = new PrismaClient();

router.get('/motivos', async (req, res) => {
    try {
        const motivos = await prisma.motivo.findMany();
        res.json(motivos);
    } catch (error) {
        console.error('Error al obtener motivos:', error);
        res.status(500).json({ error: 'Error al obtener motivos' });
    }
});

router.post('/motivos', async (req, res) => {
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

        const nuevoMotivo = await prisma.motivo.create({
            data: { descrp },
        });

         // Verificar si la descripción ya existe
    const motivoExistente = await prisma.motivo.findMany({
        where: { descrp }
    });

    if (motivoExistente) {
        return res.status(400).json({ error: 'La descripción ya existe en la base de datos' });
    }


        res.json(nuevoMotivo);
    } catch (error) {
        console.error('Error al crear motivo:', error);
        res.status(500).json({ error: 'Error al crear motivo' });
    }
});

export default router;