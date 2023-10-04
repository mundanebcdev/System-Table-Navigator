page 88000 "System Tables"
{
    ApplicationArea = All;
    Caption = 'System Tables';
    PageType = List;
    SourceTable = "System Tables";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                IndentationColumn = Rec.Indentation;
                ShowAsTree = true;

                field("Table Caption"; Rec."Table Caption")
                {
                    StyleExpr = StyleExp;

                }
                field("Object ID"; Rec."Object ID")
                {
                    ToolTip = 'Specifies the ID of the object.';
                    HideValue = HideValues;
                }

                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the name of the object.';
                    HideValue = HideValues;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies detailed description';
                    HideValue = HideValues;
                }
                // field("Direct Table Access"; Rec."Direct Table Access")
                // {
                //     ToolTip = 'Specifies whether table can be opened directly.';
                //     HideValue = HideValues;
                // }
                field(PageId; Rec."Page Id")
                {
                    ToolTip = 'Page id to run.';
                    HideValue = HideValues;
                }
                field("Blog links"; Rec."Blog links")
                {
                    ToolTip = 'Open related blog';
                    HideValue = HideValues;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Reset)
            {
                ApplicationArea = All;
                Caption = 'Reset table list';
                Image = ResetStatus;
                trigger OnAction()
                var
                    SystemTables: Record "System Tables";
                begin
                    if not SystemTables.IsEmpty() then
                        if not Confirm('All records will be re-created to default state.') then
                            exit;
                    Rec.FillSystemTables();
                end;
            }
            action("Open Table")
            {
                ApplicationArea = All;
                Caption = 'Open Table';
                Image = Open;
                // Enabled = Rec."Direct Table Access";
                trigger OnAction()
                begin
                    Hyperlink(GetUrl(ClientType::Current, CompanyName, ObjectType::Table, Rec."Object ID"));
                end;
            }
            action("Open Page")
            {
                ApplicationArea = All;
                Caption = 'Open Page';
                Image = Open;
                // Enabled = Rec."Page Id" <> 0;
                trigger OnAction()
                begin
                    Page.Run(Rec."Page Id");
                end;
            }
            action("Open Blog")
            {
                ApplicationArea = All;
                Caption = 'Open Blog';
                Image = Open;
                // Enabled = Rec."Blog links" <> '';
                trigger OnAction()
                begin
                    Hyperlink(Rec."Blog links");
                end;
            }
            action("Environment Information")
            {
                ApplicationArea = All;
                Caption = 'Environment  Information';
                Image = Open;
                trigger OnAction()
                var
                    EnvironmentInfo: Codeunit "Environment Information";
                    AzureAD: Codeunit "Azure AD Tenant";
                    MsgBuilder: TextBuilder;
                begin
                    MsgBuilder.AppendLine('Environment Information');
                    MsgBuilder.AppendLine(StrSubstNo('Environment Name: %1', EnvironmentInfo.GetEnvironmentName()));
                    MsgBuilder.AppendLine(StrSubstNo('Application Family: %1', EnvironmentInfo.GetApplicationFamily()));
                    MsgBuilder.AppendLine(StrSubstNo('Tenant Name: %1', TenantId()));
                    MsgBuilder.AppendLine(StrSubstNo('Tenant Domain Name: %1', AzureAD.GetAadTenantDomainName()));
                    MsgBuilder.AppendLine(StrSubstNo('Microsoft Entra tenant ID: %1', AzureAD.GetAadTenantId()));
                    MsgBuilder.AppendLine(StrSubstNo('User Id: %1', UserId()));
                    MsgBuilder.AppendLine(StrSubstNo('User Security Id: %1', Format(UserSecurityId()).TrimStart('{').TrimEnd('}').ToLower()));
                    Message(MsgBuilder.ToText());
                end;
            }
            action("Application Information")
            {
                ApplicationArea = All;
                Caption = 'Application Information';
                Image = Open;
                trigger OnAction()
                var
                    AppSysConstants: Codeunit "Application System Constants";
                    MsgBuilder: TextBuilder;
                begin
                    MsgBuilder.AppendLine('Application Information');
                    MsgBuilder.AppendLine(StrSubstNo('Application Version: %1', AppSysConstants.ApplicationVersion()));
                    MsgBuilder.AppendLine(StrSubstNo('Build File Version: %1', AppSysConstants.BuildFileVersion()));
                    MsgBuilder.AppendLine(StrSubstNo('Application Build: %1', AppSysConstants.ApplicationBuild()));
                    MsgBuilder.AppendLine(StrSubstNo('Platform Product Version: %1', AppSysConstants.PlatformProductVersion()));
                    MsgBuilder.AppendLine(StrSubstNo('Platform File Version: %1', AppSysConstants.PlatformFileVersion()));
                    MsgBuilder.AppendLine(StrSubstNo('Build Branch: %1', AppSysConstants.BuildBranch()));
                    Message(MsgBuilder.ToText());
                end;
            }

        }
        area(Promoted)
        {
            group(Open)
            {
                ShowAs = Standard;
                actionref(OpenPage; "Open Page") { }
                actionref(OpenTable; "Open Table") { }
                actionref(OpenBlog; "Open Blog") { }

            }
            group(Info)
            {
                actionref(EnvInfo; "Environment Information") { }
                actionref(ApplicationInfo; "Application Information") { }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetStyle();
    end;

    local procedure SetStyle()
    begin
        Clear(StyleExp);
        Clear(HideValues);
        if Rec.Indentation = 0 then begin
            StyleExp := 'Strong';
            HideValues := true;
        end;

    end;

    var
        StyleExp: Text;
        HideValues: Boolean;
}