page 88108 "Page Actions"
{
    ApplicationArea = All;
    Caption = 'Page Actions';
    PageType = List;
    SourceTable = "Page Action";
    UsageCategory = Lists;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Page ID"; Rec."Page ID")
                {
                    ToolTip = 'Specifies the value of the Page ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Caption; Rec.Caption)
                {
                    ToolTip = 'Specifies the value of the Caption field.';
                }
                field("Action ID"; Rec."Action ID")
                {
                    ToolTip = 'Specifies the value of the Action ID field.';
                }
                field("Action Index"; Rec."Action Index")
                {
                    ToolTip = 'Specifies the value of the Action Index field.';
                }
                field("Action Subtype"; Rec."Action Subtype")
                {
                    ToolTip = 'Specifies the value of the Action Subtype field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(ApplicationArea; Rec.ApplicationArea)
                {
                    ToolTip = 'Specifies the value of the ApplicationArea field.';
                }

                field(Indentation; Rec.Indentation)
                {
                    ToolTip = 'Specifies the value of the Indentation field.';
                }

                field("Parent Action ID"; Rec."Parent Action ID")
                {
                    ToolTip = 'Specifies the value of the Parent Action ID field.';
                }
                field(Promoted; Rec.Promoted)
                {
                    ToolTip = 'Specifies the value of the Promoted field.';
                }
                field(RunObjectID; Rec.RunObjectID)
                {
                    ToolTip = 'Specifies the value of the RunObjectID field.';
                }
                field(RunObjectType; Rec.RunObjectType)
                {
                    ToolTip = 'Specifies the value of the RunObjectType field.';
                }
                field(RunPageMode; Rec.RunPageMode)
                {
                    ToolTip = 'Specifies the value of the RunPageMode field.';
                }
                field(RunSourceTable; Rec.RunSourceTable)
                {
                    ToolTip = 'Specifies the value of the RunSourceTable field.';
                }
                field(ToolTip1; Rec.ToolTip1)
                {
                    ToolTip = 'Specifies the value of the ToolTip1 field.';
                }
                field(ToolTip2; Rec.ToolTip2)
                {
                    ToolTip = 'Specifies the value of the ToolTip2 field.';
                }
                field(ToolTip3; Rec.ToolTip3)
                {
                    ToolTip = 'Specifies the value of the ToolTip3 field.';
                }
                field(ToolTip4; Rec.ToolTip4)
                {
                    ToolTip = 'Specifies the value of the ToolTip4 field.';
                }
            }
        }
    }
}