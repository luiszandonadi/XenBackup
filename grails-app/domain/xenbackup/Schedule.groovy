package xenbackup

class Schedule {

    Server server
    String vmUuid
    String cronString
    String cronJobId

    static constraints = {
        cronJobId(nullable: true)
    }
}
