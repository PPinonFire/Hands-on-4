#!/bin/bash

function listar_contenido {
    read -p "Ingrese la ruta absoluta al directorio: " ruta
    if [ -d "$ruta" ]; then
        ls -l "$ruta"
    else
        echo "La ruta especificada no es un directorio válido."
    fi
}

function crear_archivo {
    read -p "Ingrese la cadena de texto para almacenar en el archivo: " texto
    read -p "Ingrese el nombre del archivo a crear: " archivo
    echo "$texto" > "$archivo"
    echo "Archivo $archivo creado con el contenido: $texto"
}

function comparar_archivos {
    read -p "Ingrese la ruta del primer archivo: " archivo1
    read -p "Ingrese la ruta del segundo archivo: " archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
    else
        echo "Uno o ambos archivos no existen."
    fi
}

function uso_awk {
    read -p "Ingrese la ruta del archivo para usar con awk: " archivo
    if [ -f "$archivo" ]; then
        awk '{print $1}' "$archivo"
    else
        echo "El archivo no existe."
    fi
}

function uso_grep {
    read -p "Ingrese la cadena de texto a buscar: " cadena
    read -p "Ingrese la ruta del archivo para usar con grep: " archivo
    if [ -f "$archivo" ]; then
        grep "$cadena" "$archivo"
    else
        echo "El archivo no existe."
    fi
}

while true; do
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto que contenga una simple línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar el uso de awk"
    echo "5. Mostrar el uso de grep"
    echo "6. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida" ;;
    esac

    echo ""
done
