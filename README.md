# Análisis de Incidentes de Incendios en San Francisco

Este repositorio contiene un análisis de los incidentes de incendios en San Francisco, utilizando PostgreSQL como base de datos y herramientas de procesamiento de datos en Python. El proyecto incluye el dataset de incidentes de incendios, un notebook en Jupyter para el procesamiento de datos, el volcado de la base de datos (`fire_incidents.sql`), y un archivo SQL con consultas para realizar análisis específicos.

## Contexto del Problema

Un cliente necesita analizar un conjunto de datos de incidentes de incendios en la ciudad de San Francisco. El objetivo es poner estos datos a disposición en un almacén de datos y crear un modelo que permita ejecutar consultas dinámicas de manera eficiente. El equipo de inteligencia de negocio debe poder realizar agregaciones de los incidentes según diferentes dimensiones: **período de tiempo**, **distrito**, y **batallón**.

### Requerimientos Específicos

1. **Copia actualizada** del conjunto de datos en el almacén, que refleje el estado actual de los datos fuente, asumiendo una actualización diaria.
2. **Consultas agregadas** en tres dimensiones:
   - Período de tiempo (por mes, día y año).
   - Distrito donde ocurrió el incidente.
   - Batallón que atendió el incidente.

## Tecnologías Utilizadas

- **Docker**: Para ejecutar PostgreSQL en un entorno aislado.
- **PostgreSQL**: Base de datos utilizada para almacenar y consultar los datos de incendios.
- **pgAdmin** o **DBeaver**: Herramientas de administración de bases de datos para interactuar con PostgreSQL.
- **Python (Jupyter Notebook)**: Para el procesamiento y limpieza de datos usando librerías como `pandas` y `SQLAlchemy`.
- **SQLAlchemy**: Para conectarse a PostgreSQL desde Python.
- **pg_dump**: Para crear un volcado de la base de datos en formato SQL.

## Archivos en el Repositorio

- `FireCaseStudySF.ipynb`: Notebook en Jupyter que contiene el procesamiento y la carga de datos en PostgreSQL.
- `fire_incidents.csv`: Dataset original en formato CSV con los datos de incidentes de incendios.
- `fire_incidents.sql`: Archivo SQL con el volcado completo de la base de datos, incluyendo la estructura y los datos de la tabla `fire_incidents`.
- `queries.sql`: Archivo SQL con las consultas necesarias para realizar el análisis de datos requerido.

## Instalación y Configuración

### Paso 1: Configurar el Entorno de Docker con PostgreSQL

1. **Instalar Docker**: Descarga e instala Docker Desktop desde [docker.com](https://www.docker.com/products/docker-desktop).
2. **Ejecutar PostgreSQL en Docker**:
   - Abre una terminal y ejecuta el siguiente comando para iniciar un contenedor de PostgreSQL:
     ```bash
     docker run --name postgres-fire-db -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres
     ```
   - Esto creará un contenedor llamado `postgres-fire-db` con PostgreSQL ejecutándose en el puerto 5432.

### Paso 2: Cargar el Dataset en PostgreSQL

1. **Conéctate al contenedor**:
   - Abre la terminal y ejecuta:
     ```bash
     docker exec -it postgres-fire-db bash
     ```
   - Esto te conectará al contenedor para que puedas interactuar directamente con PostgreSQL.

2. **Cargar el Volcado de la Base de Datos**:
   - Ejecuta el siguiente comando en tu máquina local para cargar el archivo `fire_incidents.sql` en PostgreSQL:
     ```bash
     docker exec -i postgres-fire-db psql -U postgres -d postgres < fire_incidents.sql
     ```

3. **Verificar la Carga**:
   - Abre pgAdmin o DBeaver y conéctate a PostgreSQL usando los siguientes parámetros:
     - Host: `localhost`
     - Puerto: `5432`
     - Usuario: `postgres`
     - Contraseña: `mysecretpassword`
   - Verifica que la tabla `fire_incidents` esté disponible y que los datos se hayan cargado correctamente.

### Paso 3: Ejecución de las Consultas

El archivo `queries.sql` contiene las consultas necesarias para realizar el análisis de los datos. Estas consultas permiten obtener el número total de incidentes agregados por mes y distrito, por año y batallón, y por día. Abre el archivo `queries.sql` y ejecuta las consultas en tu herramienta de administración de bases de datos o directamente en PostgreSQL para obtener los resultados.

### Paso 4: Procesamiento de Datos con Jupyter Notebook

Para realizar el procesamiento de datos y cargar el dataset en PostgreSQL, abre el archivo `FireCaseStudySF.ipynb` en Jupyter Notebook y sigue los pasos documentados en el notebook.

1. **Instala las dependencias necesarias**:
   - Asegúrate de tener `pandas`, `SQLAlchemy`, y `psycopg2` instalados. Si no es así, puedes instalar estos paquetes ejecutando:
     ```python
     !pip install pandas SQLAlchemy psycopg2-binary
     ```

2. **Carga del CSV en PostgreSQL**:
   - El notebook `FireCaseStudySF.ipynb` incluye el código para cargar el archivo `fire_incidents.csv` en la base de datos PostgreSQL usando `SQLAlchemy`.

### Notas Adicionales

- **Frecuencia de Actualización**: Este análisis asume que los datos se actualizan diariamente. Un proceso de ETL (Extract, Transform, Load) diario podría implementarse para reflejar las actualizaciones en el almacén de datos.
- **Escalabilidad**: PostgreSQL y Docker permiten que este proyecto sea escalable y fácilmente replicable en otros entornos.

## Estructura de Archivos

```plaintext
.
├── README.md                 # Documentación del proyecto
├── FireCaseStudySF.ipynb     # Notebook de procesamiento de datos
├── fire_incidents.csv        # Dataset original en formato CSV
├── fire_incidents.sql        # Volcado de la base de datos en formato SQL
└── queries.sql               # Consultas SQL para análisis de datos
