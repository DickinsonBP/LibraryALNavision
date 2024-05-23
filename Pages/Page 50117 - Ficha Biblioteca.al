page 50117 FichaBiblioteca
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Biblioteca;

    layout
    {
        area(Content)
        {
            group(GroupName)
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}