public with sharing class ToDoListController {

   
    @AuraEnabled(cacheable=true)
    public static List<Task> getTasks() {
        List<Task> tasks;
        
        if(
            Task.SObjectType.getDescribe().isAccessible() &&
            Schema.SObjectType.Task.fields.Subject.isAccessible()
        ) {
            tasks=[SELECT Subject FROM Task WHERE OwnerId =:UserInfo.getUserId()];
        }
        return tasks;
    }
}