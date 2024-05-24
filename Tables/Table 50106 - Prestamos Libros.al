table 50106 "Prestamos Libros"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista Prestamos";
    DrillDownPageId = "Lista Prestamos";
    fields
    {
        field(1; "Cod. Libro"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Libros.Codigo;

            trigger OnValidate()
            var
                recLibro: Record Libros;
            begin
                if recLibro.Get("Cod. Libro") then begin
                    rec."Descripcion Libro" := recLibro.Descripcion;
                    rec.Importe := recLibro."Importe PVP";
                    rec.Precio := Importe * 0.1;
                end;
            end;
        }
        field(2; "Num. Prestamo"; Code[10])
        {
            DataClassification = ToBeClassified;
            //TODO: Hacer autoincremental
            trigger OnValidate()
            begin
                "Num. Prestamo" := cduNumeroSeriesMng.GetNextNo(recSalesSetup."Nº serie Prestamo", WorkDate(), true);
                Modify();
            end;
        }
        field(3; "Descripcion Libro"; Text[50])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(4; "Fecha inicio Prestamo"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Usuarios.Codigo;
            trigger OnValidate()
            var
                recUsuario: Record Usuarios;
            begin
                if recUsuario.Get("No. Cliente") then begin
                    rec."Nombre Cliente" := recUsuario.Nombre;
                    rec."Direccion Cliente" := recUsuario.Direccion;
                    rec."Poblacion Cliente" := recUsuario.Poblacion;
                    rec."Telefono Cliente" := recUsuario.Telefono;
                end;
            end;
        }
        field(6; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Direccion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Poblacion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Telefono Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Fecha fin"; Date)
        {
            //Calculada a partir de los dias.
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; Dias; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                currentDate: Date;
            begin
                currentDate := DT2Date(CurrentDateTime);
                "Fecha fin" := currentDate + Dias;
            end;
        }
        field(12; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
            //TODO: Calcular precio del importe
        }
        field(13; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Num. Prestamo")
        {
            Clustered = true;
        }
    }
    var
        cduNumeroSeriesMng: Codeunit NoSeriesManagement;
        recSalesSetup: Record "Sales & Receivables Setup";

    trigger OnInsert()
    begin
        recSalesSetup.Get();
        cduNumeroSeriesMng.InitSeries(
            recSalesSetup."Nº serie Prestamo",
            recSalesSetup."Nº serie Prestamo",
            0D,
            "Num. Prestamo",
            recSalesSetup."Nº serie Prestamo"
        );
        SetActualDate();
    end;

    procedure SetActualDate()
    begin
        "Fecha inicio Prestamo" := DT2Date(CurrentDateTime);
    end;
}