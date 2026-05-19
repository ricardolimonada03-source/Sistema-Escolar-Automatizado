# Diagrama de Base de Datos

```mermaid
erDiagram

    ESCUELA ||--o{ GRUPO : tiene
    GRADO ||--o{ GRUPO : contiene
    GRUPO ||--o{ ALUMNO : pertenece_a
    DOCENTE ||--o{ GRUPO_MATERIA : imparte
    MATERIA ||--o{ GRUPO_MATERIA : se_imparte_en
    GRUPO ||--o{ GRUPO_MATERIA : cursa
    ALUMNO ||--o{ ASISTENCIA : registra
    GRUPO_MATERIA ||--o{ ASISTENCIA : corresponde_a
    ALUMNO ||--o{ CALIFICACION : obtiene
    GRUPO_MATERIA ||--o{ CALIFICACION : evalua
    PERIODO ||--o{ CALIFICACION : pertenece_a
    ALUMNO ||--o{ REPORTE_TUTORIA : tiene
    DOCENTE ||--o{ REPORTE_TUTORIA : realiza

    ESCUELA {
        int id_escuela PK
        string nombre
        string clave_cct
        string turno
        string direccion
    }

    GRADO {
        int id_grado PK
        int numero_grado
        string nivel
    }

    GRUPO {
        int id_grupo PK
        int id_escuela FK
        int id_grado FK
        string nombre_grupo
        string ciclo_escolar
    }
```
