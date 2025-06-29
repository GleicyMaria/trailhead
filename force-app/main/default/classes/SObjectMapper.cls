public class SObjectMapper {
     public static void applyMasterRecord(SObject masterRecord, String lookupFieldName, List<SObject> aggregates) {

        if (masterRecord == null || String.isBlank(lookupFieldName) || aggregates == null) {
            return;
        }

        for (SObject aggregate : aggregates) {
            aggregate.put(lookupFieldName, masterRecord.Id);
        }
    }
}