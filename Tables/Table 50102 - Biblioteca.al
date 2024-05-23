table 50102 Biblioteca
{
    DataClassification = ToBeClassified;

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
    }


    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
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