table 50102 Biblioteca
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista de Bibliotecas";
    DrillDownPageId = "Lista de Bibliotecas";

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Codigo := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Biblioteca", WorkDate(), true);
                Modify();
            end;
        }
        field(2; "Numero de libros"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Libros where(BibliotecaCodigo = field(Codigo)));
            Editable = false;
        }
        field(3; "Numero de Autores"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Autores where(BibliotecaCodigo = field(Codigo)));
            Editable = false;
        }
        field(4; "Numero de Editoriales"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Editoriales where(BibliotecaCodigo = field(Codigo)));
            Editable = false;
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
        fieldgroup(DropDown; Codigo, "Numero de libros")
        {
        }
    }

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Biblioteca",
            recSalesSetup."Nº serie Biblioteca",
            0D,
            Codigo,
            recSalesSetup."Nº serie Biblioteca"
        );
    end;



    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";

}