trigger NumberOfContact on Account (after insert, after update,after Delete) {
    set <id> AccountIds = new set<id>();
    List <Account> lstAccountsToUpdate = new List<Account>();
}