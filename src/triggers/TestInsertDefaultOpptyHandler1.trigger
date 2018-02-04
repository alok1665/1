/**
 * Description: This trigger is creating child
 * opportunity record whenever an account is created
 * with AnnualRevenue >= 500000
 *
 * Created By: Siddharth Pandit
 * Created Date: 11/11/2017
 **/
trigger TestInsertDefaultOpptyHandler1 on Account (after insert) {
    List<Opportunity> opptyList = new List<Opportunity> ();
    for (Account acc : Trigger.new) {
            System.debug ('acc == '+ acc);
        if (acc.AnnualRevenue >= 500000) {
            Opportunity oppty = new Opportunity ();
            oppty.Name = acc.Name + ' - Default Oppty';
            oppty.CloseDate = Date.today () + 30;
            oppty.StageName = 'Qualification';
            oppty.AccountId = acc.Id;
            opptyList.add (oppty);
            System.debug ('oppty == '+ oppty);
        } // End if
    } // End for
    if (opptyList.size () > 0)
        insert opptyList; // inserting new record
}