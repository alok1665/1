@isTest
private class TestInsertDefaultOpptyHandler {

    static testMethod void testAccountTrigger () {
        // Create test data
        Account acc = new Account (Name= 'test', AnnualRevenue = 500000);
        insert acc;

        Opportunity oppty = [SELECT Id, Name, CloseDate, StageName
                                FROM Opportunity
                                WHERE AccountId = :acc.Id
                                LIMIT 1];
        // Assertion
        System.assertEquals ('Qualification', oppty.StageName);
        System.assertEquals (Date.today () + 30, oppty.CloseDate);
    }
}