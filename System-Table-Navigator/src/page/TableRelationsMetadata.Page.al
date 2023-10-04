page 88101 "Table Relations Metadata"
{
    ApplicationArea = All;
    Caption = 'Table Relations Metadata';
    PageType = List;
    SourceTable = "Table Relations Metadata";
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
                field("Table ID"; Rec."Table ID")
                {
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }

                field("Field Name"; Rec."Field Name")
                {
                    ToolTip = 'Specifies the value of the Field Name field.';
                }
                field("Field No."; Rec."Field No.")
                {
                    ToolTip = 'Specifies the value of the Field No. field.';
                }
                field("Related Field Name"; Rec."Related Field Name")
                {
                    ToolTip = 'Specifies the value of the Related Field Name field.';
                }
                field("Related Field No."; Rec."Related Field No.")
                {
                    ToolTip = 'Specifies the value of the Related Field No. field.';
                }
                field("Related Table ID"; Rec."Related Table ID")
                {
                    ToolTip = 'Specifies the value of the Related Table ID field.';
                }
                field("Related Table Name"; Rec."Related Table Name")
                {
                    ToolTip = 'Specifies the value of the Related Table Name field.';
                }
                field("Relation No."; Rec."Relation No.")
                {
                    ToolTip = 'Specifies the value of the Relation No. field.';
                }
                field("Condition Field No."; Rec."Condition Field No.")
                {
                    ToolTip = 'Specifies the value of the Condition Field No. field.';
                }
                field("Condition No."; Rec."Condition No.")
                {
                    ToolTip = 'Specifies the value of the Condition No. field.';
                }
                field("Condition Type"; Rec."Condition Type")
                {
                    ToolTip = 'Specifies the value of the Condition Type field.';
                }
                field("Condition Value"; Rec."Condition Value")
                {
                    ToolTip = 'Specifies the value of the Condition Value field.';
                }
                field("Test Table Relation"; Rec."Test Table Relation")
                {
                    ToolTip = 'Specifies the value of the Test Table Relation field.';
                }
                field("Validate Table Relation"; Rec."Validate Table Relation")
                {
                    ToolTip = 'Specifies the value of the Validate Table Relation field.';
                }
            }
        }
    }
}