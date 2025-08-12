# 🤖 Bot de Gestión de Tickets con IA

Bienvenido al **Bot de Soporte con Validación Automática**.
Aquí podrás **crear, actualizar y consultar tickets de soporte** desde Telegram.
La IA se encargará de **revisar la información** y, si es necesario, **te pedirá los datos faltantes tantas veces como sea necesario**, incluso si los envías en lenguaje natural.

---

## 📋 Resumen de comandos

| Comando                              | Descripción                                                                           | Ejemplo                                                                                                                                                                       |
| ------------------------------------ | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/crear <usuario> <descripción>`     | Crea un nuevo ticket de soporte. La IA validará la información y pedirá lo que falte. | `/crear juan Aplicativo: CRM; Módulo: Ventas; Opción: Cotizaciones; Motivo: error 500 al guardar; Pasos: ingresar, crear cotización, guardar; Esperado: se guarde sin error.` |
| `/agregar <id_ticket> <información>` | Agrega información adicional a un ticket existente.                                   | `/agregar 12 Pasos: ingresar, crear cotización, guardar; Esperado: se guarde sin error.`                                                                                      |
| `/listar`                            | Muestra todos los tickets con su ID, estado y resumen.                                | `/listar`                                                                                                                                                                     |
| `/detalle <id_ticket>`               | Muestra toda la información registrada de un ticket.                                  | `/detalle 12`                                                                                                                                                                 |
| `/ayuda`                             | Muestra la lista completa de comandos y su descripción (este mismo contenido).        | `/ayuda`                                                                                                                                                                      |

---

## 📝 Formato recomendado para descripción de tickets

Aunque la IA entiende lenguaje natural, es recomendable incluir la mayor cantidad de detalles posible desde el inicio.
El formato sugerido es:

```
Aplicativo: <nombre>;
Módulo: <nombre del módulo o pantalla>;
Opción: <funcionalidad que falla>;
Motivo: <por qué es una falla>;
Pasos: <proceso para reproducir>;
Esperado: <resultado esperado>.
```

---

## 🔍 Validación Automática con IA

1. Al crear o actualizar un ticket, la IA revisa si contiene **toda la información obligatoria**.
2. Si falta algo, **te lo indicará** y podrás enviarlo en mensajes posteriores.
3. No importa el orden en que envíes la información: la IA la irá guardando hasta completar el ticket.
4. Una vez completo, el ticket pasa al estado **Listo para atención**.

---

## 💡 Consejos de uso

* Usa `/listar` para revisar el estado de todos tus tickets.
* Envía la información que falta **en frases normales**; la IA la entenderá.
* Mientras el ticket no esté completo, el bot seguirá pidiéndote los datos necesarios.
* Si olvidas cómo funciona el bot, usa `/ayuda`.
