table 50109 CabeceraLibros
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Cod. Prestamos"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Cod. Usuario"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Usuarios.Codigo;
        }
        field(3; "Fecha venta"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Registrado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Precio Total"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Cod. Prestamos")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}