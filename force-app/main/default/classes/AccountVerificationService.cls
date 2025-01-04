/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountVerificationService {
    @AuraEnabled
    public static String verifyAccount(String accountSiren) {
        if (accountSiren.startsWith('75')) {
            return 'Compte vérifié avec succès pour le SIREN : ' + accountSiren;
        } else {
            return 'Erreur : Le SIREN est invalide.';
        }
    }
}