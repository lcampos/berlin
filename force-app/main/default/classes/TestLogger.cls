@isTest
private class TestLogger {

    public static String getTimeStamp(){
        DateTime dtimenow = DateTime.now();
        String ts = dtimenow.second()+''+dtimenow.millisecond();
        return ts;
    }

    static testMethod void testLoggerLog() {
        Logger.log('waaaaaaaaa');
    }

    static testMethod void testAccountTrigger() {
        Account acc = new Account();
        acc.Name = 'Test' + getTimeStamp();
        insert acc;
    }

}