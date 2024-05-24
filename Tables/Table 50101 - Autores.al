table 50101 Autores
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista de Autores";
    DrillDownPageId = "Lista de Autores";

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Codigo := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Autor", WorkDate(), true);
                Modify();
            end;

        }
        field(2; Nombre; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Apellido 1"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Apellido 2"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Fecha Nacimiento"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CurrentDate: Date;
            begin
                CurrentDate := DT2Date(CurrentDateTime);
                if CurrentDate < rec."Fecha Nacimiento" then begin
                    Error('Fecha de nacimiento incorrecta', rec."Fecha Nacimiento");
                end
            end;
        }
        field(6; BibliotecaCodigo; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Biblioteca;
        }
        field(100; "Numero Libros"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(
                Libros where(
                    Autor = field(Codigo),
                    "Año Publicacion" = Field("Filtro Año")
                )
            );
        }
        field(101; "Numero Paginas"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum(
                Libros.Paginas where(
                    Autor = field(Codigo),
                    "Año Publicacion" = Field("Filtro Año")
                )
            );
        }
        field(500; "Filtro Año"; Integer)
        {
            FieldClass = FlowFilter;
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
        fieldgroup(DropDown; Codigo, Nombre, "Apellido 1", "Numero Libros", "Numero Paginas")
        {
        }
    }

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Autor",
            recSalesSetup."Nº serie Autor",
            0D,
            Codigo,
            recSalesSetup."Nº serie Autor"
        );
    end;

    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";

}