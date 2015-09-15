package xenbackup

class Share {

    String name
    String directory
    String user
    String password
    ShareType type

    static constraints = {
        user nullable: true
        password nullable: true
    }
}
