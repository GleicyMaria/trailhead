public with sharing class HouseService {

    public static HouseRepository houseRepository;

    static  {
        houseRepository = new HouseRepository();
    }
    

    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords() {
        try {
            String fields = 'Id, Name, Address__c, State__c, City__c, Zip__c';
            return houseRepository.listLatestHouses( fields , 10 ); 
        }
        catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
        }
    }
}