table 50106 "Movimientos Prestamos Libros"
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
        field(2; "Num. Prestamo"; Integer)
        {
            //TODO: El numero de prestamo es único por cada prestamo. No se incrementa por que por cada nuevo prestamo se genera uno nuevo por defecto.
            DataClassification = ToBeClassified;
            Editable = false;
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
            TableRelation = Customer;
            trigger OnValidate()
            var
                recUsuario: Record Customer;
            begin
                if recUsuario.Get("No. Cliente") then begin
                    rec."Nombre Cliente" := recUsuario.Name;
                    rec."Direccion Cliente" := recUsuario.Address;
                    rec."Poblacion Cliente" := recUsuario.City;
                    rec."Telefono Cliente" := recUsuario."Phone No.";
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
        "Num. Prestamo" := "Num. Prestamo" + 1;
        SetActualDate();
    end;

    procedure SetActualDate()
    begin
        "Fecha inicio Prestamo" := DT2Date(CurrentDateTime);
    end;
}