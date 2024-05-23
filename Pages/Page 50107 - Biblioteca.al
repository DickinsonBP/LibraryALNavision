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
                ShowCaption = false;
                field("Numero de libros"; Rec."Numero de libros")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Lista de Libros";
                }
                field("Numero de autores"; Rec."Numero de Autores")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Lista de Autores";
                }
                field("Numero de editoriales"; Rec."Numero de Editoriales")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageId = "Lista de Editoriales";
                }
            }
        }
    }
}