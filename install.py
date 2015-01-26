from ConfigParser import SafeConfigParser
import os, errno

pwd = os.path.dirname(os.path.realpath(__file__))
print pwd
parser = SafeConfigParser()
parser.read("config.ini")
for f in parser.defaults():
    nf = parser.get('targets',f)
    of = "%s/%s"%(pwd,f)
    print "Symlink %s -> %s"%(of,nf)
    try:
        os.symlink(of,nf)
    except OSError, e:
        if e.errno == errno.EEXIST:
            os.remove(nf)
            os.symlink(of,nf)

