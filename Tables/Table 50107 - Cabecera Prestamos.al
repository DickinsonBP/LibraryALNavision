table 50107 "Cabecera Prestamos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Codigo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Telefono cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Fecha Venta"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Nº Serie"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Registrado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
    }
}