page 88106 "Keys"
{
    ApplicationArea = All;
    Caption = 'Keys';
    PageType = List;
    SourceTable = "Key";
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
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the value of the TableNo field.';
                }
                field(TableName; Rec.TableName)
                {
                    ToolTip = 'Specifies the value of the TableName field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Key"; Rec."Key")
                {
                    ToolTip = 'Specifies the value of the Key field.';
                }
                field(Clustered; Rec.Clustered)
                {
                    ToolTip = 'Specifies the value of the Clustered field.';
                }
                field(SumIndexFields; Rec.SumIndexFields)
                {
                    ToolTip = 'Specifies the value of the SumIndexFields field.';
                }
                field(Unique; Rec.Unique)
                {
                    ToolTip = 'Specifies the value of the Unique field.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ToolTip = 'Specifies the value of the Enabled field.';
                }
                field(MaintainSIFTIndex; Rec.MaintainSIFTIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSIFTIndex field.';
                }
                field(MaintainSQLIndex; Rec.MaintainSQLIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSQLIndex field.';
                }
                field(SQLIndex; Rec.SQLIndex)
                {
                    ToolTip = 'Specifies the value of the SQLIndex field.';
                }
                field(ObsoleteReason; Rec.ObsoleteReason)
                {
                    ToolTip = 'Specifies the value of the ObsoleteReason field.';
                }
                field(ObsoleteState; Rec.ObsoleteState)
                {
                    ToolTip = 'Specifies the value of the ObsoleteState field.';
                }
            }
        }
    }
}