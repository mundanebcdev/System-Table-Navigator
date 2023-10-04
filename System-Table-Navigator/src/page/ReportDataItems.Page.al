page 88103 "Report Data Items"
{
    ApplicationArea = All;
    Caption = 'Report Data Items';
    PageType = List;
    SourceTable = "Report Data Items";
    UsageCategory = Administration;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Report ID"; Rec."Report ID")
                {
                    ToolTip = 'Specifies the value of the Report ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Data Item Name field.';
                }
                field("Data Item ID"; Rec."Data Item ID")
                {
                    ToolTip = 'Specifies the value of the Data Item ID field.';
                }
                field("Data Item Table View"; Rec."Data Item Table View")
                {
                    ToolTip = 'Specifies the value of the Data Item Table View field.';
                }
                field("Indentation Level"; Rec."Indentation Level")
                {
                    ToolTip = 'Specifies the value of the Indentation Level field.';
                }
                field("Related Table ID"; Rec."Related Table ID")
                {
                    ToolTip = 'Specifies the value of the Related Table ID field.';
                }
                field("Request Filter Fields"; Rec."Request Filter Fields")
                {
                    ToolTip = 'Specifies the value of the Request Filter Fields field.';
                }
                field("Sorting Fields"; Rec."Sorting Fields")
                {
                    ToolTip = 'Specifies the value of the Sorting Fields field.';
                }
            }
        }
    }
}