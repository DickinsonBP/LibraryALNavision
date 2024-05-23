page 50118 "Custom Headline"
{
    PageType = HeadlinePart;

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
            field(HeadLine2; hdlTxt2)
            {

            }
            field(HeadLine3; hdlTxt3)
            {

            }
            field(HeadLine4; hdlTxt4)
            {

            }
        }
    }

    var
        hdlTxt1: Label 'HOLAAAAAAAAAAA';
        hdlTxt2: Label 'EEEEEEEEEEEE';
        hdlTxt3: Label 'FJKLASDKJLÑFASD';
        hdlTxt4: Label '1234';
}