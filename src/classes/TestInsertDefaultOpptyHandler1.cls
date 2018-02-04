@isTest
private class TestInsertDefaultOpptyHandler1 {
	static testMethod void testAccountTrigger()
	{
		Account cc = new Account (Name ='test', AnnualRevenue = 5000000);
		insert cc;
		opportunity Oppty = [SELECT id, Name, CloseDate,StageName
								FROM Opportunity
								WHERE AccountId = :cc.id 
								LIMIT 1];

		System.assertEquals ('Qualification', Oppty.Name);
		System.assertEquals (Date.today() + 30, Oppty.CloseDate);						
	}
}