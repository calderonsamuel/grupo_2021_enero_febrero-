--- 
title: 'Entrenamiento en productos de datos: R Markdown'
author: "Samuel Calderon, Isabel Calderon, Sandra Cerna, Antenor Escudero, Christian Reyes"
date: "2021-03-04"
output: pdf_document
documentclass: book
bibliography:
- book.bib
- packages.bib
biblio-style: apalike
link-citations: yes
description: Este libro es una compilación de reportes individuales trabajados durante
  el verano 2021 en el Taller de Elaboración de productos de datos dictado por Samuel
  Calderon.
site: bookdown::bookdown_site
---

# Presentación {-}

Durante el verano de 2021 tuve la oportunidad de reunirme dos veces por semana con un grupo de personas interesadas en aprender a elaborar productos de datos. La única condición impuesta para formar parte de este grupo fue tener mucha paciencia y disposición a cometer muchos errores en el camino. En resumen, pienso que las personas que lograron participar en las sesiones y elaborar su proyecto final, compilado en este libro digital, han tenido éxito en adquirir nuevos conocimientos que les permitirán aplicar sus habilidades de análisis de datos con mayor confianza y habilidad técnica. 

Pienso que los aprendizajes logrados brillan particularmente a la luz de los desafíos que tuvieron que enfrentar. 

En primer lugar, el comentario que dieron en común cuando tuvieron que presentarse ante los demás miembros del grupo fue "no soy bueno con los números". Esto no fue sorprendente, siendo que todas las personas participantes provenían de estudios superiores de carreras de ciencias sociales, en las que mucha gente busca "refugiarse" de las matemáticas. Ante esto, espero que con el transcurso de los talleres haber podido convencerlos de dos ideas:

1. Que en realidad no son tan malos con los números como pensaban.
2. Que con eso es suficiente para obtener valor de los datos a los que tienen acceso.

El segundo desafío está relacionado con las condiciones en las que se brinda la educación no presencial. Por lo general, las condiciones son malas: deficiente calidad de señal de internet, falta de ambientes adecuados en la vivienda para atender las clases, computadoras de varios años de antigüedad y dificultad de poder realmente dedicarse exclusivamente a la sesión durante su duración completa por diferentes motivos. Estas dificultades no han sido exclusivas de este taller, sino que en general describen las condiciones en que se ha tenido que brindar la educación no presencial en nuestro país.

Por último, la pandemia por el covid 19. Además de obligarnos a ejecutar el taller en modalidad no presencial, fue un motivo directo para que varios participantes simplemente ya no pudieran continuar con las sesiones, ya sea porque enfermaron ellos mismos o una persona cercana que requirió su atención. Nuevamente, este es un hecho que se replica en toda la población estudiantil del país y el mundo. Espero que cuando los participantes afectados puedan recuperarse podamos encontrar un tiempo para completar las sesiones con ellos e incluirlos en este libro digital.

Este libro busca ser una compilación de los trabajos realizados como proyecto final para el Taller de Elaboración de productos de datos. Está pensado como una vitrina en la que los participantes puedan exhibir que han adquirido los conocimientos esperados en el taller:

1. Elaborar reportes de análisis de datos usando R Markdown y el flujo de trabajo de Proyectos en RStudio.
2. Obtener información releva

*Samuel Calderon*

# Sobre los autores {-}

## Isabel Calderon

Experiencia previa con código:
Experiencia previa de análisis de datos:
Formación profesional:
Región de la que proviene:
Experiencia laboral:
Temas de interés:

## Sandra Cerna

Experiencia previa con código:
Experiencia previa de análisis de datos:
Formación profesional:
Región de la que proviene:
Experiencia laboral:
Temas de interés:

## Antenor Escudero

Politólogo de la Universidad Antonio Ruiz de Montoya. Diplomado en Economía del Comportamiento, por la Universidad del Pacífico. Estudiante de Maestria en Ciencias Políticas y Relaciones Internacionales, especialización en Política Comparada, por la Pontificia Universidad Católica del Perú. Antes del taller no ha tenido experiencia en ningún lenguaje de programación ni en análisis de datos. Tiene experiencia laboral en el sector público, privado y de manera independiente, siendo las más recientes en el Centro Nacional de Planeamiento Estratégico - CEPLAN, Profesor Particular en Tu Profe En Casa, Asistente de clase de Teoría Política II y Temas de Ciencia Política en la Escuela Académico-Profesional de Ciencia Política, Universidad Antonio Ruiz de Montoya. Tiene interés en los temas de comportamiento político, psicología política, desigualdad, clases sociales, participación ciudadana, entre otros.

## Christian Reyes

Politólogo de la Universidad Antonio Ruiz de Montoya. Previo al taller no ha tenido experiencia en el uso de R para el análisis de datos, pero sí el uso de herramientas como Microsoft Excel. Sus últimas experiencias laborales fueron dentro del sector público (Ministerio de Transportes y Comunicaciones, y Ministerio de Vivienda, Construcción y Saneamiento) realizando labores de elaboración y análisis de encuestas y cuestionarios,  monitoreo del curso virtual “Programa para Formadores de Integridad” y Seguimiento al Plan de Lucha Contra la Corrupción del sector Vivienda. Le interesan los temas de sistemas electorales, participación y representación política, ética e integridad, entre otros.

## Samuel Calderon

Politólogo de la Universidad Antonio Ruiz de Montoya. Fue el encargado de dictar el taller. Actualmente trabaja en la Superintendencia Nacional de Educación Universitaria - SUNEDU como miembro del Equipo Técnico Normativo de la Dirección de Licenciamiento. Aprendió a usar R el año 2019 y desde entonces ha tratado de "convertir" a otras personas. Miembro de la organización [DecideBien](https://github.com/DecideBienpe), colabora ocasionalmente en iniciativas de código abierto. Proviene de Lima, Perú. Su experiencia laboral ha sido siempre en el sector público (Instituto Nacional de Estadística e Informática, Ministerio de Salud, Escuela Nacional de Administración Pública, Ministerio de Vivienda, Ministerio de Educación, SUNEDU). Tiene interés en los temas de educación superior, organizaciones electorales y datos abiertos.




