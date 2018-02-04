/*
*Create an Apex trigger for Opportunity 
*that adds a task to any opportunity set 
*to 'Closed Won'.
*Created By Alok Singh.
*Created Date: 16/10/2017
*https://trailhead.salesforce.com/modules/apex_triggers/units/apex_triggers_bulk
*/

trigger ClosedOpportunityTrigger on opportunity (after Insert, after Update){
    list <Task> tasklist = new list <Task>();

    for(Opportunity opp : [SELECT Id, StageName FROM Opportunity
                            WHERE StageName='Closed Won' And Id In: trigger.new])
    {
        tasklist.add(new Task (Subject ='Follow Up Test Task',
                                WhatId= opp.Id));

    }
    If (tasklist.size()>0)
    {
        insert tasklist;
    }
}