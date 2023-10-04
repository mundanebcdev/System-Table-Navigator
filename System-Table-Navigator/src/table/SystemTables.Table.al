table 88000 "System Tables"
{
    DataClassification = SystemMetadata;

    fields
    {

        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Object ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Object ID';
            DataClassification = SystemMetadata;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
            Editable = false;
        }
        field(3; Indentation; Integer)
        {
            Caption = 'Indentation';
            DataClassification = SystemMetadata;
            InitValue = 1;
        }
        field(20; "Table Name"; Text[100])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = filter(Table), "Object ID" = field("Object ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Table Caption"; Text[249])
        {
            // CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = filter(Table), "Object ID" = field("Object ID")));
            Caption = 'Caption';
            Editable = false;
            // FieldClass = FlowField;
        }
        field(30; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(41; "Direct Table Access"; Boolean)
        {
            Caption = 'Direct Table Access';
        }
        field(42; "MS page"; Boolean)
        {
            Caption = 'MS page';
        }
        field(43; "Page Id"; Integer)
        {
            Caption = 'Page Id';
        }
        field(44; "Blog links"; Text[500])
        {
            Caption = 'Blog';
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    internal procedure FillSystemTables()
    var
        SystemTables: Record "System Tables";
    begin
        if not SystemTables.IsEmpty then
            SystemTables.DeleteAll();

        #region Data Administartion

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Data Administartion';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := 0;
        SystemTables.Description := 'Handling table and database sizes. Overview and cleanup';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Data Administration";
        SystemTables."Blog links" := 'https://demiliani.com/2021/07/02/dynamics-365-business-central-data-administration/';
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Data Administration");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := 0;
        SystemTables.Description := 'Search across all data defined in the setup';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 2680;
        SystemTables."Table Caption" := GetPageCaptionAsText(2680);
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Table Information";
        SystemTables.Description := 'Information about the number of records in all system and business tables';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Table Information";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Table Information");
        SystemTables.Insert();

        #endregion    

        #region Metadata
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Metadata';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"AllObjWithCaption";
        SystemTables.Description := 'Basic information about all al objects.';
        SystemTables."Direct Table Access" := true;
        SystemTables."MS page" := true;
        SystemTables."Page Id" := Page::"All Objects with Caption";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"All Objects with Caption");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Field";
        SystemTables.Description := 'Info about all fields in the DB. Use page for import to Excel.';
        SystemTables."Direct Table Access" := true;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::Fields;
        SystemTables."Blog links" := 'https://yzhums.com/1055/';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Key";
        SystemTables.Description := 'All keys in all tables';
        SystemTables."Direct Table Access" := true;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::Keys;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Page Control Field";
        SystemTables.Description := 'All controls on pages. Useful for API`s';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Add-in";
        SystemTables.Description := 'All add-ins in the system';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Table Relations Metadata";
        SystemTables.Description := 'Lookup relations between table fields';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Table Relations Metadata";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"All Control Fields";
        SystemTables.Description := 'Page, report, XMLPort controls';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"All Control Fields";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Page Action";
        SystemTables.Description := 'Info about actions';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Page Actions";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();
        #endregion

        #region Metadata per object type
        // Init group
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Metadata per object type';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Table Metadata";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"CodeUnit Metadata";
        SystemTables.Description := 'Check if SingleInstance and subtype';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Page Metadata";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Report Metadata";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Report Data Items";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Query Metadata";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        #endregion

        #region External systems integrations
        // Init group
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'External systems integrations';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Ext. Business Event Definition";
        SystemTables.Description := 'All external business event. aka new manual webhooks';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"External Event Subscription";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"API Webhook Subscription";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Tenant Web Service";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Api Web Service";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := 0;
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Database Access Intent List";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Database Access Intent List");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"OData Edm Type";
        SystemTables.Description := 'Edm types definitions';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"OData EDM Definitions";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        #endregion

        #region Globalization and Utilities 
        // Init group
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Globalization and Utilities';
        SystemTables.Insert();


        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Date";
        SystemTables.Description := 'All about dates: Day of the week, periods etc.';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::Date;
        SystemTables."Blog links" := 'https://www.tharangac.com/2017/02/use-of-virtual-table-date-microsoft-dynamics-nav.html';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Time Zone";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Windows Language";
        SystemTables.Description := 'Available windows languages';
        SystemTables."Direct Table Access" := true;
        SystemTables."MS page" := true;
        SystemTables."Page Id" := Page::"Windows Languages";
        SystemTables."Blog links" := 'https://yzhums.com/13602/';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();
        #endregion

        #region Debugging and diagnostics
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Debugging';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := 0;
        SystemTables.Description := 'Capture a user flow from within the web client and view high-level information about time spent in the web client itself';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := true;
        SystemTables."Page Id" := Page::"Performance Profiler";
        SystemTables."Blog links" := 'https://demiliani.com/2022/03/22/dynamics-365-business-central-introducing-the-in-client-performance-profiler/';
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Performance Profiler");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := 0;
        SystemTables.Description := 'Last known error that occurred in the session';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := true;
        SystemTables."Page Id" := Page::"Latest Error";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Latest Error");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Event Subscription";
        SystemTables.Description := 'Check who subscribed where';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Event Subscriptions";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Scheduled Task";
        SystemTables.Description := 'Currently scheduled tasks';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := true;
        SystemTables."Page Id" := Page::"Scheduled Tasks";
        SystemTables."Blog links" := 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-task-scheduler';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();



        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Recorded Event Buffer";
        SystemTables.Description := 'Tool to record events';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Event Recorder";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Event Recorder");
        SystemTables."Blog links" := 'https://demiliani.com/2018/09/11/dynamics-365-business-central-using-the-event-recorder-for-developing/';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Active Session";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Session Event";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Database Locks";
        SystemTables.Description := 'Snapshot of all current database locks';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Blog links" := 'https://learn.microsoft.com/en-us/dynamics365/business-central/admin-view-database-locks';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Database Wait Statistics";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Database Wait Statistics";
        SystemTables."Blog links" := 'https://www.linkedin.com/pulse/analyzing-database-performance-issues-dynamics-365-wait-pontoppidan';
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Database Missing Indexes";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Database Missing Indexes";
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        #endregion

        #region Apps
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Apps';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Published Application";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := Page::"Extension Management";
        SystemTables."Table Caption" := GetPageCaptionAsText(Page::"Extension Management");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"NAV App Installed App";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"NAV App Tenant Add-In";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"NAV App Tenant Operation";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"NAV App Setting";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        #endregion

        #region Undefined
        // Init group
        Clear(SystemTables);
        SystemTables.Init();
        SystemTables.Indentation := 0;
        SystemTables."Table Caption" := 'Other';
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"License Permission";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := true;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Access Control";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Record Link";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"User Personalization";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Page Data Personalization";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();

        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Tenant Media"; //TODO add viewer
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();



        Clear(SystemTables);
        SystemTables.Init();
        SystemTables."Object ID" := Database::"Report Layout List";
        SystemTables.Description := '';
        SystemTables."Direct Table Access" := false;
        SystemTables."MS page" := false;
        SystemTables."Page Id" := 0;
        SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
        SystemTables.Insert();
        #endregion

    end;

    local procedure GetTableCaptionAsText(ObjectID: Integer): Text[249]
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Table, ObjectID);
        exit(AllObjWithCaption."Object Caption");
    end;

    local procedure GetPageCaptionAsText(ObjectID: Integer): Text[249]
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Page, ObjectID);
        exit(AllObjWithCaption."Object Caption");
    end;

#if TEST

    internal procedure FillSystemTables()
    var
        ListOfTables: List of [Integer];
        AllObj: Record AllObj;
        SystemTables: Record "System Tables";
        PageControlField: Record "Page Control Field";
        RecRef: RecordRef;
        EffectivePermissionsMgt: Codeunit "Effective Permissions Mgt.";
        Permission: Record Permission temporary;
        ExpandedPermission: Record "Expanded Permission";
        TableNo: Integer;
    begin
        ListOfTables.Add(Database::"Date");
        ListOfTables.Add(Database::"AllObj");
        ListOfTables.Add(Database::"Field");
        ListOfTables.Add(Database::"License Permission");
        ListOfTables.Add(Database::"Windows Language");
        ListOfTables.Add(Database::"AllObjWithCaption");
        ListOfTables.Add(Database::"Key");
        ListOfTables.Add(Database::"Access Control");
        ListOfTables.Add(Database::"Record Link");
        ListOfTables.Add(Database::"Add-in");
        ListOfTables.Add(Database::"User Personalization");
        ListOfTables.Add(Database::"Page Data Personalization");
        ListOfTables.Add(Database::"API Webhook Subscription");
        ListOfTables.Add(Database::"Session Event");
        ListOfTables.Add(Database::"Table Metadata");
        ListOfTables.Add(Database::"CodeUnit Metadata");
        ListOfTables.Add(Database::"Page Metadata");
        ListOfTables.Add(Database::"Report Metadata");
        ListOfTables.Add(Database::"Table Relations Metadata");
        ListOfTables.Add(Database::"Query Metadata");
        ListOfTables.Add(Database::"Page Action");
        ListOfTables.Add(Database::"NAV App Installed App");
        ListOfTables.Add(Database::"Database Locks");
        ListOfTables.Add(Database::"Time Zone");
        ListOfTables.Add(Database::"Tenant Web Service");
        ListOfTables.Add(Database::"NAV App Tenant Add-In");
        ListOfTables.Add(Database::"Scheduled Task");
        ListOfTables.Add(Database::"OData Edm Type");
        ListOfTables.Add(Database::"Tenant Media"); //TODO add viever
        ListOfTables.Add(Database::"Page Control Field");
        ListOfTables.Add(Database::"Api Web Service");
        ListOfTables.Add(Database::"NAV App Tenant Operation");
        ListOfTables.Add(Database::"NAV App Setting");
        ListOfTables.Add(Database::"Object Access Intent Override");
        ListOfTables.Add(Database::"All Control Fields");
        ListOfTables.Add(Database::"Report Data Items");
        ListOfTables.Add(Database::"Active Session");
        ListOfTables.Add(Database::"Report Layout List");
        ListOfTables.Add(Database::"Database Wait Statistics");
        ListOfTables.Add(Database::"Database Missing Indexes");
        ListOfTables.Add(Database::"External Event Subscription");
        ListOfTables.Add(Database::"Ext. Business Event Definition");

        if not SystemTables.IsEmpty then
            SystemTables.DeleteAll();

        foreach TableNo in ListOfTables do begin
            Clear(SystemTables);
        SystemTables.Init();
            SystemTables."Object ID" := TableNo;
           SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
SystemTables.Insert();
        end;

        EffectivePermissionsMgt.PopulateEffectivePermissionsBuffer(Permission, UserSecurityId(), CompanyName, 0, 0, true);

        AllObj.SetRange("Object Type", AllObj."Object Type"::Table);
        AllObj.SetFilter("Object ID", '>%1', 2000000001);

        AllObj.FindSet();
        repeat

            Clear(SystemTables);
        SystemTables.Init();
            SystemTables."Object ID" := AllObj."Object ID";
            if TryOpen(AllObj) then
                SystemTables."Can open for RecRef" := true;
            ExpandedPermission.SetRange("Object ID", AllObj."Object ID");
            ExpandedPermission.SetRange("Object Type", ExpandedPermission."Object Type"::"Table Data");
            if ExpandedPermission.FindFirst() then
                if ExpandedPermission."Read Permission" <> ExpandedPermission."Read Permission"::" " then
                    SystemTables."Read Permissions" := true;

           SystemTables."Table Caption" := GetTableCaptionAsText(SystemTables."Object ID");
SystemTables.Insert();

        until AllObj.Next() = 0;

    end;

    [TryFunction]
    local procedure TryOpen(var AllObj: Record AllObj)
    var
        RecRef: RecordRef;
    begin
        RecRef.Open(AllObj."Object ID");
        RecRef.Close();
    end;
#endif
}