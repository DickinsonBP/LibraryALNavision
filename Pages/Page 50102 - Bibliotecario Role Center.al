page 50102 "Bibliotecario Role Center"
{
    Caption = 'Bibliotecario';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Headline; "Custom Headline")
            {
                ApplicationArea = All;
            }
            part(Biblioteca; Biblioteca)
            {
                // Caption = 'Biblioteca';
                ApplicationArea = Basic, Suite;
            }
            part(Libros; SubpageLibros)
            {
                Caption = 'Libros';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            //
        }
        area(sections)
        {
            group("Library Managenet")
            {
                Caption = 'Biblioteca';
                action("Lista Libros")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Libros';
                    RunObject = Page "Lista de Libros";
                }
                action("Lista Editoriales")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Editoriales';
                    RunObject = Page "Lista de Editoriales";
                }
                action("Lista Autores")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Autores';
                    RunObject = Page "Lista de Autores";
                }
                action("Lista EditorialesLibros")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Editoriales y libros';
                    RunObject = Page EditorialLibros;
                }
                action("Lista de Bibliotecas")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Lista de Bibliotecas";
                }
            }
            group("Loan Management")
            {
                caption = 'Prestamos';
                action(Action24)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Lista de Prestamos';
                    RunObject = Page "Lista Prestamos";
                }
            }
        }
        area(Creation)
        {
            //Secciones para añadir libros
            action("Añadir libro")
            {
                ApplicationArea = All;
                RunObject = Page FichaLibros;
                RunPageMode = Create; //Si no se pone este campo, elige el primer libro
            }
            action("Añadir Biblioteca")
            {
                ApplicationArea = All;
                RunObject = Page FichaBibliotecas;
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            //
        }

    }
}

profile Bibliotecario
{
    Description = 'Rol de bibliotecario';
    RoleCenter = "Bibliotecario Role Center";
    Caption = 'Bibliotecario';
}