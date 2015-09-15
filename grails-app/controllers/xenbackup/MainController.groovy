package xenbackup

class MainController {


    def xenService

    def index() {}

    def listServers() {
        def s = Server.list()
        [servers: s]
    }

    def showVMs() {
        def s = Server.get(params.id as Long)
        def connection = xenService.getConnection(s.ip, s.user, s.password)
        def vms = xenService.listVMsUuid(connection, s)
        [vms: vms]
    }

    def exportXva() {
        def s = Server.get(params.server as Long)
        def connection = xenService.getConnection(s.ip, s.user, s.password)
        xenService.backupToFile(connection, s.ip, params.uuid, "backup-${params.uuid}-${new Date().format('dd-MM-yyyy-HH-mm')}")
        redirect(action: 'showVMs', id: s.id)
    }
}
