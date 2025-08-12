# 👋 *Bienvenido al Bot de Gestión de Tickets con IA*
Aquí podrás crear, actualizar y consultar tickets de soporte.
La IA validará si tu información es suficiente y te pedirá lo que falte.

📌 *Comandos disponibles:*

`/crear <usuario> <descripción>`

Crea un nuevo ticket. Ejemplo:

```/crear juan Aplicativo: CRM; Módulo: Ventas; Opción: Cotizaciones; Motivo: error 500 al guardar; Pasos: ingresar, crear cotización, guardar; Esperado: se guarde sin error.```

`/agregar <id> <información>`
Agrega información faltante a un ticket. Ejemplo:
```/agregar 12 Pasos: ingresar, crear cotización, guardar; Esperado: se guarde sin error.```

`/listar`
Muestra todos los tickets creados, con su estado y un resumen del primer mensaje.

`/detalle <id>`
Muestra toda la info de un ticket, incluyendo mensajes y fechas. Ejemplo:
```/detalle 12```"

