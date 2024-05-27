table 50108 LineasPrestamos
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Codigo Prestamo"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cabecera Prestamos".Codigo;
        }

        //TODO Numero de linea que sea autoincremental.
        field(2; "Num. linea"; Integer)
        {
            DataClassification = ToBeClassified;
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
                end
            end;
        }
    }

    keys
    {
        key(PK; "Codigo Prestamo")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SetStartDate();
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

    procedure SetStartDate()
    begin
        "Fecha inicio Prestamo" := DT2Date(CurrentDateTime);
    end;

    var
        recCabeceraPrestamo: Record "Cabecera Prestamos";

}