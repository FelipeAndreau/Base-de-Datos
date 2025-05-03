# Ejercicio 2
Considere la relación para libros publicados: <br>
Libro = (Título, Autor, Tipo_libro, Listaprecios, Editor, Direccion_autor) <br> 
Escriba las dependencias funcionales existentes. <br>
¿En qué forma normal se encuentra la tabla? Llevar a la tercera forma normal. <br>

## Libro = (Título, Autor, Tipo_libro, Listaprecios, Editor, Direccion_autor) 
<br>
Definimos contextualmente a la lista de precios como los precios por el tipo de libro y que muchos libros tienen muchos precios
<br>
La tabla no esta ni siquiera en primera forma

DF

titulo, autor, editor → tipo-libro, listaprecios, direccion-autor
<br>
DP

autor → direccion-autor
<br>
1. autor (DNI, AyN, direccion-autor)
    <br>
    libros (titulo, editor, desc)
    <br>
    librosXautor (titulo, editor, DNI)
    <br>
    tipolibro (IDtipo, tipo-nombre)
    <br>
    listas (IDlista, fecha)
    <br>
    listaXlibroXtipo (IDlista, titulo, IDeditorial, IDtipo, precio)
    <br>
2. Cumple la segunda forma: no tener dependencias parciales
<br>
3. no tener dependencias transitivas
    
    Sacamos a editor como otra tabla porque no queremos perderlos si borramos todos los libros:
    
    editoriales (IDeditorial, nombreEditor, domicilioEditor)
