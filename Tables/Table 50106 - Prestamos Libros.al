table 50106 "Prestamos Libros"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Cod. Libro"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Libros.Codigo;
        }
        field(2; "Num. Prestamos"; Integer)
        {
            DataClassification = ToBeClassified;
            //TODO: Hacer autoincremental
        }
        field(3; "Descripcion Libro"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Fecha inicio Prestamo"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Usuarios.Codigo;
        }
        field(6; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Direccion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Poblacion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Telefono Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Fecha fin"; Date)
        {
            DataClassification = ToBeClassified;
            //TODO: Calculada a partir de los dias.
        }
        field(11; Dias; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
            //TODO: Calcular precio del importe
        }
        field(13; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Cod. Libro")
        {
            Clustered = true;
        }
    }
}