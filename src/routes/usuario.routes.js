import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import jwt from 'jsonwebtoken';

const router = Router();
const prisma = new PrismaClient();

router.get('/usuarios', async (req, res) => {
    try {
        const usuarios = await prisma.usuario.findMany({
            select:{
                IdUsuario:true,
                nombre:true,
                correo:true,
                rol:{
                    select:{
                        IdRol:true,
                        descrp:true
                    },
                
                },
            }
        });
        res.json(usuarios);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener usuarios'});
    }
});

router.post('/usuarios/login', async (req, res) => {
    try {
        const { name, email, picture } = req.body;

        // Verificar si el usuario ya existe en la base de datos
        const existingUser = await prisma.usuario.findFirst({
            where: {
                correo: email
            }
        });

        let IdUsuario, IdRol;

        if (!existingUser) {
            // Si el usuario no existe, crear uno nuevo
            const newUser = await prisma.usuario.create({
                data: {
                    nombre: name,
                    correo: email,
                    IdRol: 3
                },
                select: {
                    IdUsuario: true,
                    IdRol: true
                }
            });

            IdUsuario = newUser.IdUsuario;
            IdRol = newUser.IdRol;

            console.log("Usuario Registrado");
        } else {
            // Si el usuario ya existe, obtener sus datos
            IdUsuario = existingUser.IdUsuario;
            IdRol = existingUser.IdRol;

            console.log("Usuario logueado, ya existente!");
        }

        // Tu clave secreta para firmar el token (deberías almacenarla de manera segura)
        const secretKey = 'Euromotors.2023@';

        // La información que deseas incluir en el token (puedes personalizar según tus necesidades)
        const payload = {
            IdUsuario,
            IdRol
        };

        // Configuración del token, incluyendo la duración de validez (expira en 1 hora en este ejemplo)
        const options = {
            expiresIn: '1h',
        };

        // Generar el token
        const token = jwt.sign(payload, secretKey, options);

        console.log('Token generado:', token);

        res.json({
            token
        });
    } catch (error) {
        console.error("Error al manejar la solicitud de login:", error);
        res.status(500).json({ error: 'Error al procesar la solicitud de login' });
    }
});

// Otras rutas y lógica aquí...

export default router;
