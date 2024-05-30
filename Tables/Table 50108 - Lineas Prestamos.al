table 50108 LineasPrestamos
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Codigo Prestamo"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cabecera Prestamos".Codigo;
        }

        //TODO Numero de linea que sea autoincremental.
        field(2; "Num. linea"; Integer)
        {
            DataClassification = ToBeClassified;
            // AutoIncrement = true;
        }
        field(3; "Descripcion Libro"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Fecha inicio Prestamo"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                recUsuario: Record Customer;
            begin
                if recUsuario.Get("No. Cliente") then begin
                    rec."Nombre Cliente" := recUsuario.Name;
                    rec."Direccion Cliente" := recUsuario.Address;
                    rec."Poblacion Cliente" := recusuario.City;
                    rec."Telefono Cliente" := recUsuario."Phone No.";
                end;
            end;
        }

        field(6; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Direccion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Poblacion Cliente"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Telefono Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Fecha fin"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Dias; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Fecha fin" := DT2Date(CurrentDateTime) + Dias;
            end;
        }
        field(12; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(100; "Cod Libro"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Libros.Codigo;

            trigger OnValidate()
            var
                porcentageImporte: Integer;
                recLibro: Record Libros;
            begin
                if recLibro.Get("Cod Libro") then begin
                    porcentageImporte := 10;
                    rec."Descripcion Libro" := recLibro.Descripcion;
                    rec.Importe := reclibro."Importe PVP";
                    rec.Precio := Importe / porcentageImporte;
                end;
            end;
        }
    }

    keys
    {
        key(PK; "Codigo Prestamo", "Num. linea")
        {
            Clustered = true;
        }
        key(LineaInfo; "Num. linea")
        {
        }
    }

    trigger OnInsert()
    var
        recLineasPrestamo: Record LineasPrestamos;
        recUsuario: Record Customer;
        lCodigoNuevo: Code[20];
    begin
        SetStartDate();
        "Num. linea" := 1000;

        lCodigoNuevo := "Codigo Prestamo";
        "Codigo Prestamo" := '';
        recLineasPrestamo.SetRange("Codigo Prestamo", lCodigoNuevo);
        if recLineasPrestamo.FindLast() then begin
            "No. Cliente" := recLineasPrestamo."No. Cliente";
            if recUsuario.Get(recLineasPrestamo."No. Cliente") then begin
                rec."Nombre Cliente" := recUsuario.Name;
                rec."Direccion Cliente" := recUsuario.Address;
                rec."Poblacion Cliente" := recusuario.City;
                rec."Telefono Cliente" := recUsuario."Phone No.";
            end;
        end;
        "Codigo Prestamo" := lCodigoNuevo;
        "Num. linea" := recLineasPrestamo."Num. linea" + 1000;

    end;

    trigger OnModify()
    var
        recUsuario: Record Customer;
    begin
        if recUsuario.Get("No. Cliente") then begin
            rec."Nombre Cliente" := recUsuario.Name;
            rec."Direccion Cliente" := recUsuario.Address;
            rec."Poblacion Cliente" := recusuario.City;
            rec."Telefono Cliente" := recUsuario."Phone No.";
        end;
    end;

    trigger OnDelete()
    begin
        recMovimientosPrestamos.SetRange("Cod. Prestamo", rec."Codigo Prestamo");
        recMovimientosPrestamos.DeleteAll();
    end;

    procedure SetStartDate()
    begin
        "Fecha inicio Prestamo" := DT2Date(CurrentDateTime);
    end;

    var
        recCabeceraPrestamo: Record "Cabecera Prestamos";
        recMovimientosPrestamos: Record "Movimientos Prestamos Libros";

}