table 50109 Usuarios
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Nombre; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Direccion; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Poblacion; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Telefono; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Codigo)
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