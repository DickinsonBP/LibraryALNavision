page 50107 Biblioteca
{
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = Biblioteca;

    layout
    {
        area(Content)
        {
            cuegroup("Biblioteca")
            {
                field("Numero de libros"; Rec."Numero de libros")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Lista de Libros";
                }
            }
        }
    }
}