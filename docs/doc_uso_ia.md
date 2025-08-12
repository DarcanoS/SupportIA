# 🧠 Uso de la IA en el Proyecto
## Agente
### 1. Rol de la IA en el agente

En este proyecto utilicé **GPT** (mediante API) ya que se me otorgó un token para su uso. Mi experiencia previa con GPT facilitó el diseño del flujo, aunque en un escenario real también evaluaría opciones que permitan realizar pruebas sin costo.

La función principal de la IA es **validar que los mensajes de un ticket dirigido a soporte contengan la información mínima necesaria** para ser atendidos.
Esto incluye verificar y extraer de un texto libre los siguientes campos:

* `aplicativo`
* `modulo`
* `opcion`
* `motivo_falla` (por qué es una falla)
* `pasos` (cómo se llegó al resultado)
* `esperado` (qué se espera en lugar del fallo)

Dado que los tickets pueden llegar en **lenguaje natural**, diseñé un prompt específico que permite entender y caracterizar la información, incluso cuando está incompleta, y solicitar solo lo faltante.

---

### 2. Prompt principal usado

```
Eres un asistente que valida tickets de soporte en español.
Debes LEER texto libre y extraer estos campos:
- aplicativo
- modulo
- opcion
- motivo_falla (por qué es falla)
- pasos (cómo se llegó al resultado)
- esperado (qué se espera en lugar del fallo)

Reglas especiales sobre ADJUNTOS (no leas archivos, solo el texto):
- Si el usuario menciona que adjunta o agrega un VIDEO/IMAGEN/CAPTURA/Screenshot con los PASOS, considera el campo "pasos" como presente y rellénalo con el texto estándar: "[Adjunto: video con pasos]" o "[Adjunto: imagen con pasos]" según corresponda.
- Si el usuario menciona que adjunta o agrega evidencia del ERROR (video/imagen/captura), considera "motivo_falla" como presente y rellénalo con el texto estándar: "[Adjunto: video con evidencia del error]" o "[Adjunto: imagen con evidencia del error]".
- No inventes contenido de los adjuntos; solo registra que existen con la nota estándar.
- Estas reglas solo marcan "pasos" y/o "motivo_falla" como presentes. Los demás campos siguen igual.

Devuelve SIEMPRE un JSON ESTRICTO:
{
  "aplicativo": "...",
  "modulo": "...",
  "opcion": "...",
  "motivo_falla": "...",
  "pasos": "...",
  "esperado": "...",
  "adjuntos_detectados": ["video_pasos","imagen_pasos","video_error","imagen_error"], 
  "completo": boolean,
  "faltantes": ["..."],
  "solicitud": "mensaje amable pidiendo SOLO lo que falta en formato claro"
}

Reglas:
- Si un campo no aparece explícito y no está cubierto por las reglas de adjuntos, déjalo vacío "".
- "adjuntos_detectados" es una lista informativa; incluye solo los tipos aplicables según el texto (usa los literales indicados arriba).
- "completo" = true solo si TODOS los campos de texto ("aplicativo","modulo","opcion","motivo_falla","pasos","esperado") tienen contenido claro o fueron cubiertos con las notas estándar por adjuntos.
- "faltantes" lista los nombres exactos de los campos de texto vacíos (excluye los que quedaron cubiertos por adjuntos).
- "solicitud" debe ser corta (2–4 líneas) y pedir SOLO lo que falta.
- No incluyas texto fuera del JSON.
```

Este prompt permite que la IA:

* Comprenda el contenido en lenguaje natural.
* Identifique información faltante.
* Solicite únicamente los datos necesarios.
* Reconozca menciones de adjuntos y los procese con reglas claras.


El prompt para agregar más mensajes a los tickets es bastante parecido.
---
## Desarrollo 
### 1. Uso de la IA durante el desarrollo

La IA me apoyó en varias etapas:

* **Selección de herramientas**: Solicité recomendaciones de plataformas que me permitieran implementar la solución de forma rápida y con una curva de aprendizaje baja, priorizando opciones gratuitas o de software libre. Ya que mi conocimiento sobre automatización para este caso no me parecía suficiente para empezar solo y desde cero.
* **Diseño del flujo en n8n**: Utilicé GPT para entender conceptos y nodos clave, así como para recibir ejemplos prácticos de integración. Esto fue realmente suficiente ya que n8n es una herramienta algo fácil de usar.
* **Ayuda de errores**: Use GPT y la IA que proporciona n8n para entender y corregir algunos errores que aparecieron en el flujo de n8n.
* **Solución de dudas técnicas**: Me apoyé tanto en GPT como en la documentación oficial de n8n y videos de YouTube. Estos dos últimos también fueron demasiado útiles, la documentación esta muy bien cuidad y hay una cantidad increíble de videos sobre el tema.

---

## 2. Limitaciones encontradas

Uno de los mayores retos fue un **error al crear los contenedores de n8n**.
En este caso, la IA no pudo darme una solución efectiva y las sugerencias que proporcionó no resolvieron el problema. Finalmente, la solución llegó mediante prueba y error, lo que me hizo perder algo de tiempo siguiendo indicaciones incorrectas.

También, aunque mi plan inicial era ejecutar todo de forma **local**, la complejidad y tiempo invertido me llevaron a implementar la solución en la **nube**, lo que resultó más práctico para el reto.