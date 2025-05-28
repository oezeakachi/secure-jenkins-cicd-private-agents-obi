import jenkins.model.*
import hudson.model.*
import hudson.slaves.*
import jenkins.slaves.*

String nodeName = "slave-01"

// Create a JNLP agent node
DumbSlave agent = new DumbSlave(
  nodeName,
  "/home/jenkins/agent",        // Remote FS
  new JNLPLauncher()
)
agent.setNumExecutors(1)
agent.setMode(Node.Mode.NORMAL)
agent.setLabelString("jnlp")
agent.setRetentionStrategy(new RetentionStrategy.Always())

Jenkins.instance.addNode(agent)

// Get the secret
def computer = Jenkins.instance.getNode(nodeName).toComputer()
def secret = computer.getJnlpMac()
new File("/var/jenkins_home/agent-secret.txt").text = secret
