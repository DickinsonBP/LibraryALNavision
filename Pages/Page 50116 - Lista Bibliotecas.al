page 50116 "Lista de Bibliotecas"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Biblioteca;
    CardPageId = FichaBiblioteca;

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

            }
        }
    }
}