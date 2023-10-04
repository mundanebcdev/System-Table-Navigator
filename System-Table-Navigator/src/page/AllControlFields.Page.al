page 88102 "All Control Fields"
{
    ApplicationArea = All;
    Caption = 'All Control Fields';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "All Control Fields";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Object ID"; Rec."Object ID")
                {
                    ToolTip = 'Specifies the value of the Object ID field.';
                }
                field("Object Type"; Rec."Object Type")
                {
                    ToolTip = 'Specifies the value of the Object Type field.';
                }
                field("Control ID"; Rec."Control ID")
                {
                    ToolTip = 'Specifies the value of the Control ID field.';
                }
                field(Caption; Rec.Caption)
                {
                    ToolTip = 'Specifies the value of the Caption field.';
                }
                field("Control Name"; Rec."Control Name")
                {
                    ToolTip = 'Specifies the value of the Control Name field.';
                }
                field("Data Type"; Rec."Data Type")
                {
                    ToolTip = 'Specifies the value of the Data Type field.';
                }
                field("Data Type Length"; Rec."Data Type Length")
                {
                    ToolTip = 'Specifies the value of the Data Type Length field.';
                }
                field("Option Caption"; Rec."Option Caption")
                {
                    ToolTip = 'Specifies the value of the Option Caption field.';
                }
                field("Option String"; Rec."Option String")
                {
                    ToolTip = 'Specifies the value of the Option String field.';
                }
                field("Related Field ID"; Rec."Related Field ID")
                {
                    ToolTip = 'Specifies the value of the Related Field ID field.';
                }
                field("Related Table ID"; Rec."Related Table ID")
                {
                    ToolTip = 'Specifies the value of the Related Table ID field.';
                }
                field("Source Expression"; Rec."Source Expression")
                {
                    ToolTip = 'Specifies the value of the Source Expression field.';
                }
            }
        }
    }
}