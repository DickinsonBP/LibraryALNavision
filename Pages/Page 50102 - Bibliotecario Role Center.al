page 50102 "Bibliotecario Role Center"
{
    Caption = 'Bibliotecario';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            // part(Control104; "Headline RC Order Processor")
            // {
            //     ApplicationArea = Basic, Suite;

            // }
            part(Control1901851508; "SO Processor Activities")
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(sections)
        {
            group("Library Managenet")
            {
                Caption = 'Biblioteca';
                action(Action20)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Libros';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Page "Lista de Libros";
                }
                action(Action21)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Editoriales';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Page "Lista de Editoriales";
                }
                action(Action22)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Autores';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    RunObject = Page "Lista de Autores";
                }
            }
        }
    }
}

profile Bibliotecario
{
    Description = 'Rol de bibliotecario';
    RoleCenter = "Bibliotecario Role Center";
    Caption = 'Bibliotecario';
}