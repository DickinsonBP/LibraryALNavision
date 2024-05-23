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
                CurrentYear: Integer;
            begin
                CurrentYear := Date2DWY(DT2Date(CurrentDateTime), 3);
                if CurrentYear < rec."Año Publicacion" then begin
                    Error('Año de publicación incorrecto', rec."Año Publicacion");
                end
                else begin
                    rec.Edad := CurrentYear - rec."Año Publicacion";
                end
            end;
        }
        field(6; Autor; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Autores.Codigo;
        }
        field(7; Editorial; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Editoriales;
        }
        field(8; Paginas; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Paginas < 0 then begin
                    Error('El numero de paginas no puede ser inferior a 0');
                end;
            end;
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
            //TODO: Automatico
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = false;
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

    fieldgroups
    {
        fieldgroup(DropDown; Codigo, Autor, Editorial, Paginas)
        {
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
        recUser.Get();
        // cduUser.(
        //     recUser."Full Name",
        //     recUser."Full Name",
        //     0D,
        //     Usuario,
        //     recUser."Full Name"
        // );
        SetActualDate();
    end;

    trigger OnModify()
    begin
        SetModifedDate();
    end;

    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";
        cduUser: Codeunit "User Selection";
        recUser: Record User;


    procedure SetActualDate()
    begin
        "Fecha de alta" := DT2Date(CurrentDateTime);
    end;

    procedure SetModifedDate()
    begin
        "Fecha ult. modificacion" := DT2Date(CurrentDateTime);
    end;
}