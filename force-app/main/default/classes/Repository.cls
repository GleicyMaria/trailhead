public abstract inherited sharing class Repository {

   
    public virtual SObject save(SObject aggregate) {
        if (aggregate == null) return null;
        return save(new List<SObject>{ aggregate }).get(0);
    }

    
    public virtual List<SObject> save(List<SObject> aggregates) {
        if (aggregates == null || aggregates.isEmpty()) return new List<SObject>();
        upsert aggregates;
        return aggregates;
    }

    
    public virtual List<SObject> save(List<SObject> aggregates, Schema.SObjectField externalField) {
        if (aggregates == null || aggregates.isEmpty()) return new List<SObject>();
        Database.upsert(aggregates, externalField);
        return aggregates;
    }

   
    public virtual SObject save(SObject aggregate, Schema.SObjectField externalField) {
        if (aggregate == null) return null;
        save(new List<SObject>{ aggregate }, externalField);
        return aggregate;
    }

   
    public virtual List<SObject> saveRelated(SObject masterRecord, String lookupFieldName, List<SObject> aggregates) {
        if (aggregates == null || aggregates.isEmpty()) return new List<SObject>();

        SObjectMapper.applyMasterRecord(masterRecord, lookupFieldName, aggregates);
        return save(aggregates);
    }

    
    public virtual List<SObject> saveRelated(SObject masterRecord, String lookupFieldName, List<SObject> aggregates, Schema.SObjectField externalField) {
        if (aggregates == null || aggregates.isEmpty()) return new List<SObject>();

        SObjectMapper.applyMasterRecord(masterRecord, lookupFieldName, aggregates);
        return save(aggregates, externalField);
    }

    
    public virtual void remove(SObject record) {
        if (record == null) return;
        remove(new List<SObject>{ record });
    }

    public virtual void remove(List<SObject> records) {
        if (records == null || records.isEmpty()) return;
        delete records;
    }

    
    public virtual List<Database.SaveResult> updateAll(List<SObject> aggregates) {
        if (aggregates == null || aggregates.isEmpty()) return new List<Database.SaveResult>();
        return Database.update(aggregates, false);
    }

   
    public virtual List<Database.SaveResult> insertAll(List<SObject> aggregates) {
        if (aggregates == null || aggregates.isEmpty()) return new List<Database.SaveResult>();
        return Database.insert(aggregates, false);
    }

   
    public virtual List<Database.UpsertResult> upsertAll(List<SObject> aggregates) {
        if (aggregates == null || aggregates.isEmpty()) return new List<Database.UpsertResult>();
        return Database.upsert(aggregates, false);
    }

    
    public virtual List<Database.UpsertResult> upsertAll(List<SObject> aggregates, Schema.SObjectField externalField) {
        if (aggregates == null || aggregates.isEmpty()) return new List<Database.UpsertResult>();
        return Database.upsert(aggregates, externalField, false);
    }
}
