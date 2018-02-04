<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>auto_Select</fullName>
        <description>auto update experience field</description>
        <field>Pi__c</field>
        <literalValue>Experienced</literalValue>
        <name>auto Select</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Atteched name wd ex</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Teacher__c.Age__c</field>
            <operation>greaterThan</operation>
            <value>35</value>
        </criteriaItems>
        <criteriaItems>
            <field>Teacher__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Seen like name with exp</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Techer_age_Ex</fullName>
        <actions>
            <name>auto_Select</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Teacher__c.Age__c</field>
            <operation>greaterThan</operation>
            <value>35</value>
        </criteriaItems>
        <criteriaItems>
            <field>Teacher__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>In this field will update as like Teacher name, Age and Experience</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
