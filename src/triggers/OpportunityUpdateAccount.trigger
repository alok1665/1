trigger OpportunityUpdateAccount on Opportunity (before insert) {
	List <Account> accsToUpdate = new List<Account>();
    for(Opportunity opp : trigger.new)
    {
        if(opp.IsPrivate = True)
        {
            accsToUpdate.add(new Account(Id=opp.Account.Id));
            
        }
        
    }
    if(accsToUpdate != null && !accsToUpdate.isEmpty())
    {
        update(accsToUpdate);
    }
}