# Desafío IA – Agente de Validación de Tickets

Este proyecto implementa un **agente de IA** para automatizar tareas en el área de soporte, usando **n8n**, **PostgreSQL/Supabase** y **Telegram**.
El agente revisa tickets entrantes, valida si contienen la información mínima necesaria para ser atendidos y solicita datos faltantes de manera automática.

---

## 🎯 Objetivos

1. **Validar tickets automáticamente** para asegurar que incluyan:

   * Aplicativo afectado
   * Módulo o pantalla
   * Opción específica
   * Motivo de la falla
   * Pasos para reproducirla
   * Comportamiento esperado
2. **(Futuro)** Resumir las actividades pendientes de los tickets vigentes.

---

## 📦 Requisitos

* **n8n** (versión mínima: básica – Web o local)
* **Base de datos PostgreSQL** (Supabase, Docker local, etc.)
* **Bot de Telegram**
* **Cuenta y API key de OpenAI** (u otro proveedor de IA compatible)

---

## 📂 Estructura del repositorio

```bash
.
├── database
│   └── create_tables.sql         # Script para crear tablas necesarias
├── docs
│   ├── doc_bot.md                # Guía de uso del bot en Telegram
│   └── doc_uso_ia.md             # Explicación del uso de IA en el proyecto
├── n8n
│   └── Flujo_Prueba_Truora.json  # Workflow para importar en n8n
└── README.md
```

---

## 🚀 Cómo probar el proyecto

Puedes usar el **bot de prueba** en Telegram:
[Bot de Prueba](https://web.telegram.org/k/#@n8npruebau606u4rb8a5ovignbot)

Comandos disponibles:

* `/crear <usuario> <descripción>` → Crea un ticket nuevo.
* `/agregar <id> <info>` → Agrega información a un ticket existente.
* `/listar` → Lista todos los tickets con estado y resumen.
* `/detalle <id>` → Muestra información completa del ticket.

Ejemplo de creación:

```bash
/crear juan Aplicativo: CRM; Módulo: Ventas; Opción: Cotizaciones; Motivo: error 500 al guardar; Pasos: ingresar, crear cotización, guardar; Esperado: se guarde sin error.
```

📄 La guía completa de comandos está en [`docs/doc_bot.md`](docs/doc_bot.md)

---

## ⚙️ Configuración del proyecto

### 1. Importar el flujo en n8n

1. Abrir n8n.
2. Crear un nuevo flujo ("Create workflow").
3. En el editor, ir a los **tres puntos** (arriba a la derecha) y seleccionar **Import from File…**.
4. Importar `n8n/Flujo_Prueba_Truora.json`.

### 2. Configurar credenciales

* **Telegram**:
  Configura el token de tu bot en el nodo **Telegram Trigger**.
  [Cómo crear un bot de Telegram](https://www.youtube.com/watch?v=zZfyFjQR6qo&pp=ygUQdGVsZWdyYW0gY29uIG44bg%3D%3D)
* **IA (OpenAI)**:
  Configura la API Key en el nodo **OpenAI Chat Model** conectado a "Validar Ticket Nuevo".

### 3. Configurar la base de datos

* Ejecutar `database/create_tables.sql` en tu instancia PostgreSQL/Supabase.
* Configurar credenciales de la base de datos en los nodos que interactúan con ella.

---

## 🧠 Uso de la IA en el proyecto

La IA recibe el contenido del ticket y:

1. Evalúa si cumple con la información mínima requerida.
2. Si falta información, genera un mensaje claro solicitándola.
3. Si está completo, marca el ticket como listo para atención.

📄 El detalle del prompting y decisiones técnicas está en [`docs/doc_uso_ia.md`](docs/doc_uso_ia.md).

---

## 📌 Notas

* Actualmente **no** incluye la guía de ejecución local de n8n (pendiente).
* Futuras mejoras planteadas:

  * Resumen de tickets pendientes.
