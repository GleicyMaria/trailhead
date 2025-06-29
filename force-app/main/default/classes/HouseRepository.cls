public class HouseRepository extends Repository {
   
    public List<House__c> listLatestHouses(String fields, Integer limitCount) {
        if (String.isBlank(fields)) {
            fields = 'Id';
        }

        if (limitCount == null || limitCount <= 0) {
            limitCount = 10;
        }

        String query = 'SELECT ' + fields + ' FROM House__c WITH USER_MODE ORDER BY CreatedDate LIMIT ' + limitCount;

        List<House__c> results = Database.query(query);

        return results.isEmpty() ? null : results;
    }

}