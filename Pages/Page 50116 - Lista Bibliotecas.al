page 50116 "Lista de Bibliotecas"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Biblioteca;
    CardPageId = FichaBibliotecas;

    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;

                }
                field("Numero de libros"; Rec."Numero de libros")
                {
                    ApplicationArea = All;
                }
                field("Numero de Autores"; Rec."Numero de Autores")
                {
                    ApplicationArea = All;
                }
                field("Numero de Editoriales"; Rec."Numero de Editoriales")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}