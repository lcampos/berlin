global with sharing class Logger {
    global static String logLevel = 'INFO';

    global static void log(String str) {
        logLevel = 'INFO_LOG';
        System.debug(logginglevel.INFO, str);
    }

    global static void logException(Exception e, String source){
        System.debug('--- Exception Source : ' + source);
        System.debug(logginglevel.INFO, '--- Message : ' + e.getMessage());
        System.debug(logginglevel.INFO, '--- Cause : ' + e.getCause());
        System.debug(logginglevel.INFO, '--- Type : ' + e.getTypeName());
        System.debug(logginglevel.INFO, '--- Line number : ' + e.getLineNumber());
        System.debug(logginglevel.INFO, '--- Stack trace : ' + e.getStackTraceString());
    }
}