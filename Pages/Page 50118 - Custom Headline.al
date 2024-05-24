page 50118 "Custom Headline"
{
    PageType = HeadlinePart;
    SourceTable = Biblioteca;

    layout
    {
        area(Content)
        {
            field(HeadLine1; hdlTxt1)
            {
                trigger OnDrillDown()
                var
                    DrillDownURLTxt: Label 'https://go.microsoft.com/fwlink/?linkid=867580', Locked = True;
                begin
                    Hyperlink(DrillDownURLTxt)
                end;
            }
            field(HeadLine2; StrSubstNo(hdlTxt2, rec."Numero de libros"))
            {
                ApplicationArea = All;
            }
            field(HeadLine3; StrSubstNo(hdlTxt3, rec."Numero de autores")) { ApplicationArea = All; }
            field(HeadLine4; StrSubstNo(hdlTxt4, rec."Numero de editoriales")) { ApplicationArea = All; }
        }
    }

    var
        hdlTxt1: Label 'HOLAAAAAAAAAAA';
        hdlTxt2: Label 'Numero de libros %1';
        hdlTxt3: Label 'Numero de autores %1';
        hdlTxt4: Label 'Numero de editoriales %1';
}