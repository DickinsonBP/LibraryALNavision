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
    }
}
