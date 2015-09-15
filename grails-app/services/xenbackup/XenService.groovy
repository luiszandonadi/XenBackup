package xenbackup

import com.xensource.xenapi.*
import grails.transaction.Transactional
import org.apache.commons.io.FileUtils
import org.apache.xmlrpc.XmlRpcException

@Transactional
class XenService {


    public Connection getConnection(String xenserverIp, String user, String password) {
        Connection connection = null;
        try {
            connection = new Connection(new URL(xenserverIp.contains('http://') ? xenserverIp : 'http://' + xenserverIp))
            Session.loginWithPassword(connection, user, password, APIVersion.latest().toString());
        } catch (MalformedURLException | Types.XenAPIException | XmlRpcException ex) {
            log.error 'Connect error!', ex
        }
        return connection
    }

    public void backupToFile(Connection connection, String serverUrl, String vmUuid, String backupName) {
        try {
            VM vm = VM.getByUuid(connection, vmUuid);
            VM snapshot = vm.snapshot(connection, backupName);
            snapshot.setIsATemplate(connection, false);
            File file = new File("/home/luis/" + backupName + ".xva");
            try {
                String sessionReference = connection.getSessionReference();
                StringBuilder url = new StringBuilder("http://");
                url.append(serverUrl.contains("http://") ? serverUrl.replace("http://", "") : serverUrl);
                url.append("/export?");
                url.append("session_id=");
                url.append(sessionReference);
                url.append("&");
                url.append("uuid=");
                url.append(snapshot.getUuid(connection));
                url.append("&");
                url.append("use_compression=true");
                System.out.println("----------------------------------");
                System.out.println(url.toString());
                System.out.println("----------------------------------");
                FileUtils.copyURLToFile(new URL(url.toString()), file);
            } catch (MalformedURLException | IOException ex) {
               log.error 'backupToFile',ex
            }

            System.out.println("Removendo snapshot.");
            snapshot.destroy(connection);
            System.out.println("Backup terminado.");
        } catch (Types.XenAPIException | XmlRpcException ex) {
            log.error 'backupToFile',ex
        }

    }


    def listVMsUuid(Connection connection, Server server) {
        def result = []
        try {
            Map<VM, VM.Record> allRecords = VM.getAllRecords(connection);
            for (Map.Entry<VM, VM.Record> e : allRecords.entrySet()) {
                if (e.value.isATemplate == false && e.value.isControlDomain == false) {
                    result << [
                            name: e.value.nameLabel,
                            uuid: e.value.uuid,
                            server:server.id

                    ]
                }
            }
        } catch (Types.XenAPIException | XmlRpcException ex) {
            log.error 'Connect error!', ex
        }

        return result;
    }


}
