/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OpportunityTrigger on Opportunity (before insert) {
    // Collect Account IDs from opportunities
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null) {
            accountIds.add(opp.AccountId);
        }
    }

    // Query Account Names
    Map<Id, Account> accountMap = new Map<Id, Account>(
        [SELECT Id, Name FROM Account WHERE Id IN :accountIds]
    );

    // Update Opportunity names
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null && accountMap.containsKey(opp.AccountId)) {
            opp.Name = accountMap.get(opp.AccountId).Name + '-' + Date.today().format();
        } else {
            opp.Name = 'Unassigned Account';
        }
    }
}