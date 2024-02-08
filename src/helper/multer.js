import mime from "mime-types";
import multer from "multer";
import { v4 as uuidv4 } from "uuid";

const storageConfig = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    const ext = mime.extension(file.mimetype);
    cb(null, uuidv4() + "." + ext);
  },
});

const validationFile = (req, file, cb) => {
  const maxSize = 16 * 1024 * 1024;
  const fileMime = mime.lookup(file.originalname);
  const allowedMimes = ["application/pdf"];
  if (!allowedMimes.includes(fileMime.toString()))
    return cb(new Error("Tipo de archivo no permitido"));

  if (file.size > maxSize) {
    return cb(
      new Error("El tamaño máximo permitido para las imágenes es de 16MB.")
    );
  }
  cb(null, true);
};

export const upload = multer({
  storage: storageConfig,
  fileFilter: validationFile,
  limits: { fileSize: 16 * 1024 * 1024 },
});
