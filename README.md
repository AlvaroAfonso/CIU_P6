# CIU-P6
Proyecto de "Creando interfaces de usuario", asignatura de la ULPGC (Universidad de Las Palmas de Gran Canaria) hecho por **Álvaro Javier Afonso López**

### Introducción
El objetivo de esta práctica es aprender a obtener señales de entrada como imagen o vídeo para su posterior tratamiento. En este caso se toma la imagen de la cámara para mover una canasca por pantalle con el movimiento de la cabeza y ganar puntos encestando una pelota en ella.

![Gif de una prueba del proyecto](https://github.com/AlvaroAfonso/CIU_P6/blob/main/export.gif)

### Desarrollo
Lo primero a realizar es contar con el programa FaceOSC que es la que hará el trabajo de detectar el rostro del usuario, e instalar en processing la libreía oscP5. La canasta se colocará donde se encuentre el rostro, más concretamente por la zona de la boca, y se moverá a donde sea que se mueva esta. Cada vez que la canasta contacte con la pelota, que se mueve por la pantalla sola, se contará un punto. 

### Controles
Movimiento de la cabeza para controlar la canasta.

### Dificultades
La única dificultad fue a la hora de obtener el ejecutable FaceOSC, que al intentar ejecutarlo no encontraba un fichero necesario para su funcionar, lo solucioné después de buscar información en internet al respecto.

### Bibliografía
* Documentos de la propia práctica
* Página oficial de Proccesing
