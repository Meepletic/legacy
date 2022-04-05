<p align="center">
    <br/>
        <img src=images/marcauma-aniversario-50.jpg alt="UMA">
    <br/>
</p>



# Plantilla para TFG

Este es un proyecto LaTeX para la elaboración del Trabajo de Fin de Grado (TFG) de la _Universidad de Málaga_, antendiendo a las [normas de presentación, estructura y edición](https://www.uma.es/etsi-informatica/info/72589/tfg-memoria-y-defensa/) establecidas en el reglamento de la _E.T.S. de Ingeniería Informática_ (a fecha de **junio de 2019**).

La plantilla fuerza que las páginas de agradecimientos, el resumen, los capítulos del cuerpo y los anexos empiecen en páginas impares siguiendo el formato de un libro.

> Agradecimientos a [Antonio](https://github.com/benhid) por su [plantilla del TFG](https://github.com/benhid/TFG-UMA) de la _E.T.S.I Informática de la Universidad de Málaga_.



## Cómo usar la plantilla

### Instalación

El método más sencillo es crear un nuevo proyecto en [Overleaf](https://www.overleaf.com) y trabajar ahí.

1. Importar el contenido de la plantilla en formato ZIP.
2. Crear un proyecto en Overleaf e importar el ZIP anterior.



### Edición

#### Documento

Para empezar a trabajar en la memoria solo es necesario modificar los ficheros descritos a continuación:

| Fichero              | Función                                                                       |
| -------------------- | ----------------------------------------------------------------------------- |
| `datos`              | Inicializa las variables del documento (alumno, tutor, título...).            |
| `03-agradecimientos` | Página de agradecimientos.                                                    |
| `04-resumen`         | Breve descripción del proyecto en español y en inglés con palabras clave.     |
| `05-cuerpo`          | El contenido de la memoria, que debe dividirse y estructurarse con capítulos. |
| `06-anexos`          | Contenido adicional que no tiene cabida en el cuerpo (en mi caso, un manual). |

Las páginas generadas por `01-etiqueta.tex` y `02-portada.tex` usan la información proporcionada en `datos.tex`.
* **La etiqueta no debe incluirse en la memoria**, ya que irá pegada sobre la cubierta facilitada por el centro.

Las páginas generadas por `03-agradecimientos.tex` y `06-anexos.tex` son opcionales, pueden desactivarse desde `datos.tex`.



#### Bibliografía

Esta plantilla hace uso de `biblatex` para el manejo de la bibliografía.

Para incluir alguna referencia bibliográfica, debe modificarse el archivo `references.bib` añadiendo entradas.

Las citas y referencias se escriben en el cuerpo usando `\cite{entrada}`.



##### Ejemplo

```
@article{Cantu-Paz98asurvey,
    author  = {Erick Cantú-Paz},
    title   = {A Survey of Parallel Genetic Algorithms},
    journal = {CALCULATEURS PARALLELES, RESEAUX ET SYSTEMS REPARTIS},
    year    = {1998},
    volume  = {10}
}
```
El ejemplo de arriba se trata de una entrada _artículo_, cuya llamada en el cuerpo sería `\cite{Cantu-Paz98asurvey}`.

> Más información sobre tipos de entradas y sus atributos en [Bibliography Management](https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management#biblatex).



### Generar el documento PDF

Overleaf permite **descargar** el documento generado a partir del estado del proyecto.

* Una buena práctica es _compilar antes de descargar_ para asegurarse que es la versión correcta.
