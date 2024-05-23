table 50103 Editoriales
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista de Editoriales";
    DrillDownPageId = "Lista de Editoriales";

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Codigo := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Editorial", WorkDate(), true);
                Modify();
            end;
        }
        field(2; Nombre; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Correo; Text[15])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.CheckValidEmailAddresses(rec.Correo);
            end;
        }
        field(4; BibliotecaCodigo; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Biblioteca;
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
        fieldgroup(DropDown; Codigo, Nombre, Correo)
        {
        }
    }

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Editorial",
            recSalesSetup."Nº serie Editorial",
            0D,
            Codigo,
            recSalesSetup."Nº serie Editorial"
        );
    end;



    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";
}