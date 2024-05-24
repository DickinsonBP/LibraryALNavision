tableextension 50100 "Sales & Receivables Extension" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Nº serie Libro"; Code[10])
        {
            Caption = 'Nº serie Libro';
            TableRelation = "No. Series";
        }
        field(50101; "Nº serie Autor"; Code[10])
        {
            Caption = 'Nº serie Autor';
            TableRelation = "No. Series";
        }
        field(50102; "Nº serie Editorial"; Code[10])
        {
            Caption = 'Nº serie Editorial';
            TableRelation = "No. Series";
        }
        field(50103; "Nº serie Biblioteca"; Code[10])
        {
            Caption = 'Nº serie Biblioteca';
            TableRelation = "No. Series";
        }
        field(50104; "Nº serie Usuario"; Code[10])
        {
            Caption = 'Nº serie Usuario';
            TableRelation = "No. Series";
        }
        field(50105; "Nº serie Prestamo"; Code[10])
        {
            Caption = 'Nº serie Prestamo';
            TableRelation = "No. Series";
        }
    }
}
