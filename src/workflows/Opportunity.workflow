<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Oppty_close_date_reminder_Email_Template_Oppty_close_date_reminder</fullName>
        <description>Oppty close date reminder</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Oppty_close_date_reminder</template>
    </alerts>
    <fieldUpdates>
        <fullName>Format_Oppty_Name</fullName>
        <field>Name</field>
        <formula>Name &amp;&quot;-&quot;&amp;
 Account.Name &amp; &quot;-&quot; &amp;
TEXT(MONTH( CloseDate ))&amp;&quot;/&quot;&amp;
TEXT(YEAR( CloseDate ))</formula>
        <name>Format ​ ​ Oppty ​ ​ Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Format Oppty Name</fullName>
        <actions>
            <name>Format_Oppty_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Oppty close date reminder</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>greaterThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Oppty_close_date_reminder_Email_Template_Oppty_close_date_reminder</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>-7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
