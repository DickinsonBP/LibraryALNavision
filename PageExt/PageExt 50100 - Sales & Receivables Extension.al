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
        }
    }
}
