# Desafío IA
Este es un proyecto para la implementación de un agente de IA para automatizar tareas en el area de soporte.

## Objetivos
Las funcionalidades que tiene el agente son:
1. Validar que los tickets que ingresen contengan la información necesario para su atención. (Realizado)
2. Resumir las actividades que hay que realizar con los tickets vigentes. (Funcionalidad no realizada.)

---

## Requisitos para ejecutar el proyecto

- Tener N8N, desde la versión más básica. Versión Web o Local.
- Tener una base de datos de Postgres. (Supabase, etc.)
- Tener Telegram.

## Esquema de carpetas
```bash
.
├── docs                        #Carpeta general de documentación
├── n8n                         #Carpeta de utilidades para n8n
├── README.md
├── database                    #Carpeta de utilidades para la base de datos

```

## Como probar el proyecto 

Puedes ingresar en telgram al siguiente [Bot](https://web.telegram.org/k/#@n8npruebau606u4rb8a5ovignbot).

El te permitirá realizar las siguientes acciones:
 - Crear tickets
 - Agregar mensajes a tickets creados
 - Listar los tiockets y sus estados
 - Detallar un tickes completo

Si tienes duda de puedes usar el comando de "/ayuda".

Tambien encontraras la documentación más completa [aquí](https://github.com/DarcanoS/SupportIA/docs/doc_bot.md).

## Como ejecutar el proyecto

1. En la carpeta n8n tienes el archivo .Json para importar en n8n. [Documentación oficial](https://docs.n8n.io/try-it-out/quickstart/):
    
    - En la pantalla principal "Create workflow".
    - Adentro de la vista de edición, en la parte supeior derecha, en los 3 puntos, darle en "Import from File...".

2. Configurar las credenciales:

    - Telegram, el primer nodo que es el trigger, debes configurar el token de tu bot. Puedes encontrar información de como crear tu bot [aquí](https://www.youtube.com/watch?v=zZfyFjQR6qo&pp=ygUQdGVsZWdyYW0gY29uIG44bg%3D%3D).
    - Para usar elAgente de IA, también debes configurar el token en el nodo OpenAI chat Model, que se desprende del nodo "Validar Ticket Nuevo" que tiene la imagen de un robot.

3. Configurar la base de datos.

    - En la carpeta de database esta el sql para crear las tablas necesarias para tu base de datos.
    - Puedes colocar los datos de tu base de datos. si deseas usar otra base de datos, puedes hacerlo.

Con estas configuraciones ya puedes iniciar el proyecto.

### Como ejecutar el proyecto en local
... Documentación no realizada.

### Como use la IA para este proyecto

En la documentación explico como fue mi proceso del [uso de la IA](https://github.com/DarcanoS/SupportIA/docs/doc_uso_ia.md) para este proyecto.
