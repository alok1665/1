public with sharing class CaseCustomListController {
    
    public List<Case> getCaseList () {
        return [SELECT Id, CaseNumber, Status, Priority, Account.Name, Contact.Name
                    FROM Case
                    WHERE IsClosed = false];
    }
}