/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class DataPurgeScheduler implements Schedulable {
    public void execute(SchedulableContext context) {
        List<Account> oldAccounts = [SELECT Id FROM Account WHERE LastModifiedDate < LAST_N_YEARS:3];
        delete oldAccounts;
    }
}