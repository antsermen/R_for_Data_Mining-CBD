# Repositorio de Scripts R

En este repositorio se alojarán los distintos Scripts en lenuaje R para el proyecto de la asignatura CBD del curso 2022/2023. Dichos scripts contendrán una serie de funciones en R que ofrecerán respuestas a distintas preguntas relacionadas con la base de datos SQL "Chinook" mediante técnicas de minería de datos. Cada script será nombrado en función de la información que ofrezca, de forma que un script llamado "Géneros_más_populares" devolverá los géneros más populares de la base de datos una vez ejecutado sobre esta. También se subirá un script llamado "Revisar_datos" que utilizamos como apoyo para comprobar los datos existentes en las tablas de la base de datos, concretamente para la fase de preprocesamiento de datos.

Además, se añadirá la base de datos también para facilitar la descarga.

Aunque viene expresado en la memoria del trabajo, para poder ejecutar correctamente los distintos scripts R en su dispositivo, se deben de instalar los paquetes RSQLite, DBI y rpart con el comando install.packages("RSQLite"), install.packages("DBI") e install.packages("rpart") respectivamente. Se pueden ejecutar los comandos anteriores directamente en la consola de RStudio. Existen paquetes adicionales que se pueden instalar con install.packages("nombrepaquete") según sea conveniente. Estos paquetes adicionales se encuentran comentados (así como las funciones referentes a estos), que si bien no son necesarios para ejecutar el script, pueden ayudar en tema de visualización por ejemplo. Un ejemplo concreto de este tipo de paquetes es "rpart.plot".
