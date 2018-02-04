trigger CountContactOnAccount on Contact (after insert, after update,after Delete) {
    set <id> accountIds = new set<id>();
    List <Account> lstAccountsToUpdate = new List<Account>();
    if(Trigger.isInsert)
    {
        for(Contact con : Trigger.New)
        {
            accountIds.add(con.accountID);
        }
    }
    if(Trigger.isUpdate || Trigger.isDelete)
    {
        for(Contact con : Trigger.old)
        {
            accountIds.add(con.accountId);
        }
    }
    FOR(Account acc : [SELECT Id, Name,
                       (Select Id FROM Contacts) FROM Account 
                       WHERE Id IN : accountIds])
    {
        Account accObj = new Account();
        accobj.Id =acc.Id;
        lstAccountsToUpdate.add(accObj);
        
    } 
    Update lstAccountsToUpdate;
}