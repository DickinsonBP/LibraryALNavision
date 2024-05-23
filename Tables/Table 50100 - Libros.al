table 50100 Libros
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista de Libros";
    DrillDownPageId = "Lista de Libros";

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Codigo := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Libro", WorkDate(), true);
                Modify();
            end;

        }
        field(2; Descripcion; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Descripcion 2"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Tematica; Option)
        {
            OptionMembers = Aventura,Terror,Drama,"Ciencia Ficción";
            DataClassification = ToBeClassified;
        }
        field(5; "Año Publicacion"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                InputDate: Date;
            begin
                InputDate := DT2Date(CurrentDateTime);
                rec.Edad := Date2DWY(InputDate, 3) - rec."Año Publicacion";
            end;
        }
        field(6; Autor; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Autores;
        }
        field(7; Editorial; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Editoriales;
        }
        field(8; Paginas; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Importe PVP"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Cod. Producto"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;

            trigger OnValidate()
            var
                recItem: Record Item;
            begin
                if (recItem.Get(rec."Cod. Producto")) then begin
                    rec."Descripcion Producto" := recItem.Description;
                end
                else begin
                    rec."Descripcion Producto" := '';
                end;
            end;
        }
        field(11; Edad; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Fecha de alta"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Fecha ult. modificacion"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Usuario; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(15; "Descripcion Producto"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "calc Descripcion producto"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(
                Item.Description where(
                    "No." = field("Cod. Producto")
                )
            );
        }
        field(17; BibliotecaCodigo; Code[10])
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

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Libro",
            recSalesSetup."Nº serie Libro",
            0D,
            Codigo,
            recSalesSetup."Nº serie Libro"
        );
        SetActualDate();
    end;

    trigger OnModify()
    begin
        SetModifedDate();
    end;

    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";

    procedure SetActualDate()
    begin
        "Fecha de alta" := DT2Date(CurrentDateTime);
    end;

    procedure SetModifedDate()
    begin
        "Fecha ult. modificacion" := DT2Date(CurrentDateTime);
    end;
}