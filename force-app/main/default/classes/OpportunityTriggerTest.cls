@isTest
public class OpportunityTriggerTest {
    // Test pour une opportunité avec un compte
    @isTest
    public static void testOpportunityNameWithAccount() {
        // Étape 1 : Créer un compte fictif
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Étape 2 : Créer une opportunité liée au compte
        Opportunity opp = new Opportunity(
            Name = 'Temporary Name',
            AccountId = acc.Id,        // Lien avec le compte
            CloseDate = Date.today(), // Date de clôture
            StageName = 'Prospecting' // Stade de l'opportunité
        );
        insert opp;

        // Étape 3 : Vérifier le nom de l'opportunité
        Opportunity insertedOpp = [SELECT Name FROM Opportunity WHERE Id = :opp.Id];
        System.assert(insertedOpp.Name.contains('Test Account'),
            'Le nom de l’opportunité doit contenir le nom du compte.');
    }

    // Test pour une opportunité sans compte
    @isTest
    public static void testOpportunityNameWithoutAccount() {
        // Étape 1 : Créer une opportunité sans compte
        Opportunity opp = new Opportunity(
            Name = 'Temporary Name',
            CloseDate = Date.today(),
            StageName = 'Prospecting'
        );
        insert opp;

        // Étape 2 : Vérifier le nom de l'opportunité
        Opportunity insertedOpp = [SELECT Name FROM Opportunity WHERE Id = :opp.Id];
        System.assert(insertedOpp.Name.contains('Unassigned Account'),
            'Le nom de l’opportunité doit être "Unassigned Account".');
    }
}
