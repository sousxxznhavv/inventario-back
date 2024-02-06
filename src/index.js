import express from "express";

import tiposRoutes from './routes/tipos.routes.js'
import marcasRoutes from './routes/marcas.routes.js'
import modelosRoutes from './routes/modelos.routes.js'
import proovedorRoutes from './routes/proveedor.routes.js'
import estadoRoutes from './routes/estados.routes.js'
import areasRoutes from './routes/areas.routes.js'
import monedaRoutes from './routes/moneda.routes.js'
import activoRoutes from './routes/activos.routes.js'
import empresaRoutes from './routes/empresa.routes.js'
import modeloHomologadoRoutes from './routes/modeloHomologado.routes.js'
import localRoutes from './routes/local.routes.js'
import empleadoRoutes from './routes/empleado.routes.js'
import asignacionRoutes from './routes/asignacion.routes.js'
import tipoDocumentoRoutes from './routes/tipoDocumentos.routes.js'
import motivoRoutes from './routes/motivo.routes.js'
import recepcionRoutes from './routes/recepcion.routes.js'
import usuarioRoutes from './routes/usuario.routes.js'
import rolRoutes from './routes/rol.routes.js'
import cors from "cors"
const app = express();
app.use(express.json())

app.use(cors())
app.use('/api', tiposRoutes);
app.use('/api', marcasRoutes);
app.use('/api', modelosRoutes);
app.use('/api', estadoRoutes);
app.use('/api', proovedorRoutes);
app.use('/api', areasRoutes);
app.use('/api', monedaRoutes);
app.use('/api', activoRoutes);
app.use('/api', empresaRoutes);
app.use('/api', modeloHomologadoRoutes);
app.use('/api', localRoutes);
app.use('/api', empleadoRoutes);
app.use('/api', asignacionRoutes)
app.use('/api', tipoDocumentoRoutes)
app.use('/api', motivoRoutes)
app.use('/api', recepcionRoutes)
app.use('/api', usuarioRoutes)
app.use('/api', rolRoutes)

app.listen(3000);
console.log('server on port', 3000)