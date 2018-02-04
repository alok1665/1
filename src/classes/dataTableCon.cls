public with sharing class dataTableCon {
    list <account> accounts = new list <account>();
    public list<Account> getAccounts() {
        if(accounts==null)
            {
                accounts=[select name,owner.name from account limit 10];
            }
        return accounts;
    }

}