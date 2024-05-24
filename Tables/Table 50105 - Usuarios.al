table 50105 Usuarios
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista de Usuarios";
    DrillDownPageId = "Lista de Usuarios";

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Codigo := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Usuario", WorkDate(), true);
                Modify();
            end;
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
        fieldgroup(DropDown; Codigo, Nombre)
        {
        }
    }

    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Usuario",
            recSalesSetup."Nº serie Usuario",
            0D,
            Codigo,
            recSalesSetup."Nº serie Usuario"
        );
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