/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class OpportunityPDFHelperTest {
    @isTest
    public static void testGenerateOpportunityPDF() {
        // Créer des données de test
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(Name = 'Test Opportunity', AccountId = acc.Id, CloseDate = Date.today());
        insert opp;

        // Appeler la méthode et vérifier le résultat
        String pdfContent = OpportunityPDFHelper.generateOpportunityPDF(opp.Id);
        System.assert(pdfContent.contains('Test Account'), 'Le nom du compte devrait être inclus.');
        System.assert(pdfContent.contains('Test Opportunity'), 'Le nom de l’opportunité devrait être inclus.');
    }
}