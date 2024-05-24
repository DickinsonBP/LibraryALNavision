pageextension 50100 "Sales & Receivables Extension" extends "Sales & Receivables Setup"
{
    layout
    {
        addLast("Number Series")
        {
            field("Nº serie Libro"; Rec."Nº serie Libro")
            {
                ApplicationArea = All;
            }
            field("Nº serie Autor"; Rec."Nº serie Autor")
            {
                ApplicationArea = All;
            }
            field("Nº serie Editorial"; Rec."Nº serie Editorial")
            {
                ApplicationArea = All;
            }
            field("Nº serie Biblioteca"; Rec."Nº serie Biblioteca")
            {
                ApplicationArea = All;
            }
            field("Nº serie Usuario"; Rec."Nº serie Usuario")
            {
                ApplicationArea = All;
            }
            field("Nº serie Prestamo"; Rec."Nº serie Prestamo")
            {
                ApplicationArea = All;
            }
        }
    }
}
