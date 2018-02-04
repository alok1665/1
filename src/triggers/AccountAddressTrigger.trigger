trigger AccountAddressTrigger on Account (before Insert, before Update)
{
    for (Account a : trigger.New )
     {
        If(a.Match_Billing_Address__c == True && a.BillingPostalCode != Null)
        {
            a.ShippingPostalCode =a.BillingPostalCode;
        }
    }
}