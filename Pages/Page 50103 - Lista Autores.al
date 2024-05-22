page 50103 "Lista de Autores"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Autores;
    CardPageId = FichaAutores;

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
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field("Apellido 1"; Rec."Apellido 1")
                {
                    ApplicationArea = All;
                }
                field("Apellido 2"; Rec."Apellido 2")
                {
                    ApplicationArea = All;
                }
                field("Fecha Nacimiento"; Rec."Fecha Nacimiento")
                {
                    ApplicationArea = All;
                }
                field("Numero Libros"; Rec."Numero Libros")
                {
                    ApplicationArea = All;
                }
                field("Numero Paginas"; Rec."Numero Paginas")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}