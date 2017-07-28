#!/bin/bash
cat > /tmp/wls_domain.py <<- WLS_WLST
domain_name  = os.environ.get("DOMAIN_NAME", "$DOMAIN_NAME")
admin_port   = int(os.environ.get("ADMIN_PORT", "7001"))
admin_pass   = "welcome1" 
domain_path  = '${ORACLE_HOME}/user_projects/domains/%s' % domain_name
production_mode = os.environ.get("PRODUCTION_MODE", "prod")

print('domain_name     : [%s]' % domain_name);
print('admin_port      : [%s]' % admin_port);
print('domain_path     : [%s]' % domain_path);
print('production_mode : [%s]' % production_mode);
print('admin password  : [%s]' % admin_pass);

# Open default domain template
# ======================
readTemplate("${ORACLE_HOME}/wlserver/common/templates/wls/wls.jar")

set('Name', domain_name)
setOption('DomainName', domain_name)

# Disable Admin Console
# --------------------
# cmo.setConsoleEnabled(false)

# Configure the Administration Server and SSL port.
# =========================================================
cd('/Servers/AdminServer')
set('ListenAddress', '')
set('ListenPort', admin_port)

# Define the user password for weblogic
# =====================================
cd('/Security/%s/User/weblogic' % domain_name)
cmo.setPassword(admin_pass)

# Write the domain and close the domain template
# ==============================================
setOption('OverwriteDomain', 'true')
setOption('ServerStartMode',production_mode)

cd('/NMProperties')
set('ListenAddress','')
set('ListenPort',5556)
set('CrashRecoveryEnabled', 'true')
set('NativeVersionEnabled', 'true')
set('StartScriptEnabled', 'false')
set('SecureListener', 'false')
set('LogLevel', 'FINEST')

# Set the Node Manager user name and password (domain name will change after writeDomain)
cd('/SecurityConfiguration/base_domain')
set('NodeManagerUsername', 'weblogic')
set('NodeManagerPasswordEncrypted', admin_pass)

# Write Domain
# ============
writeDomain(domain_path)
closeTemplate()

# Exit WLST
# =========
exit()

WLS_WLST