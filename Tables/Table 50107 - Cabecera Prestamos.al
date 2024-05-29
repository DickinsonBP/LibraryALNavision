table 50107 "Cabecera Prestamos"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Lista Prestamos";
    DrillDownPageId = "Lista Prestamos";

    fields
    {
        field(1; Codigo; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                recCabeceraPrestamo: Record "Cabecera Prestamos";
            begin
                if Codigo < xRec.Codigo then begin
                    if not recCabeceraPrestamo.Get(Rec.Codigo) then begin
                        SalesSetup.Get();
                        NoSeriesMgt.TestManual(SalesSetup."Nº serie prestamo");
                        "Nº serie" := '';
                    end;
                end;
            end;
        }
        field(2; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                recUsuario: Record Customer;
            begin
                if recUsuario.Get("Cod. Cliente") then begin
                    rec."Nombre Cliente" := recUsuario.Name;
                    rec."Telefono Cliente" := recUsuario."Phone No.";
                end;
            end;
        }
        field(3; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Telefono cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Fecha Venta"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Nº serie"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

            trigger OnValidate()
            var
                lNuevoCodigo: Code[20];
            begin
                recLineasPrestamo.SetRange("Codigo Prestamo", rec.Codigo);
                SalesSetup.Get();
                lNuevoCodigo := NoSeriesMgt.GetNextNo("Nº serie", WorkDate(), true);

                if recLineasPrestamo.FindFirst() then begin
                    repeat
                        recLineasPrestamo."Codigo Prestamo" := lNuevoCodigo;
                    until recLineasPrestamo.Next() = 0;
                end;
                rec.Codigo := lNuevoCodigo;
                // Modify();
            end;
        }
        field(10; Registrado; Boolean)
        {
            DataClassification = ToBeClassified;
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

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recLineasPrestamo: Record LineasPrestamos;

    trigger OnInsert()
    var
    begin
        if Codigo = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Nº serie prestamo");
            "Nº serie" := SalesSetup."Nº serie prestamo";
            Codigo := NoSeriesMgt.GetNextNo("Nº serie", WorkDate(), true);
            // Codigo := NoSeriesMgt.InitSeries("Nº serie", WorkDate(), true);
            "Fecha Venta" := DT2Date(CurrentDateTime);
            CreateLinea();
        end;
    end;

    trigger OnModify()
    begin
        recLineasPrestamo.SetRange("Codigo Prestamo", rec.Codigo);
        if recLineasPrestamo.FindFirst() then begin
            repeat
                recLineasPrestamo."No. Cliente" := rec."Cod. Cliente";
                recLineasPrestamo.Modify(true);
            until recLineasPrestamo.Next() = 0;
        end;
    end;

    trigger OnDelete()
    begin
        recLineasPrestamo.SetRange("Codigo Prestamo", rec.Codigo);
        recLineasPrestamo.DeleteAll(); //Borrar todas las lineas asignadas a este prestamo
    end;

    procedure CreateLinea()
    begin
        recLineasPrestamo.Init();
        recLineasPrestamo."Codigo Prestamo" := rec.Codigo;
        // recLineasPrestamo."Fecha inicio Prestamo" := DT2Date(CurrentDateTime);
        recLineasPrestamo.Insert(true, false); //NO EJECUTA ONINSERT
    end;
}