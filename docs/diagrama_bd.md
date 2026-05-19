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

    ALUMNO {
        int id_alumno PK
        int id_grupo FK
        string curp
        string nombre
        string apellido_paterno
        string apellido_materno
        date fecha_nacimiento
        string tutor_nombre
        string tutor_telefono
        string estatus
    }

    DOCENTE {
        int id_docente PK
        string nombre
        string apellido_paterno
        string apellido_materno
        string correo
        string telefono
        string estatus
    }

    MATERIA {
        int id_materia PK
        string nombre
        string descripcion
    }

    GRUPO_MATERIA {
        int id_grupo_materia PK
        int id_grupo FK
        int id_materia FK
        int id_docente FK
        string ciclo_escolar
    }

    ASISTENCIA {
        int id_asistencia PK
        int id_alumno FK
        int id_grupo_materia FK
        date fecha
        string estado
        string observaciones
    }

    PERIODO {
        int id_periodo PK
        string nombre
        date fecha_inicio
        date fecha_fin
        string ciclo_escolar
    }

    CALIFICACION {
        int id_calificacion PK
        int id_alumno FK
        int id_grupo_materia FK
        int id_periodo FK
        decimal calificacion
        string observaciones
    }

    REPORTE_TUTORIA {
        int id_reporte PK
        int id_alumno FK
        int id_docente FK
        date fecha
        string tipo_reporte
        string observaciones
        string acciones_recomendadas
    }
