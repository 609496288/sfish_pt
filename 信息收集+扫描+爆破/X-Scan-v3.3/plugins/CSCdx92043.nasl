#
# This script was written by Renaud Deraison <deraison@cvs.nessus.org>
#
# See the Nessus Script License for details
#


include("compat.inc");

if(description)
{
 script_id(11379);
 script_bugtraq_id(6823);
 script_cve_id("CVE-2003-1398");
 script_xref(name:"OSVDB", value:"51475");

 script_version("$Revision: 1.8 $");

 script_name(english:"Cisco IOS ICMP Redirect Message Spoofing Remote DoS (CSCdx92043)");

 script_set_attribute(attribute:"synopsis", value:
"The remote device is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"Sending bogus ICMP redirect packets, a malicious
user can either disrupt or intercept communication
from a router.

This vulnerability is documented with the CISCO
bug ID CSCdx92043" );
 script_set_attribute(attribute:"solution", value:
"Upgrade your version of IOS" );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/311336" );
 script_set_attribute(attribute:"risk_factor", value:"High" );
 script_end_attributes();


 summary["english"] = "Uses SNMP to determine if a flaw is present";
 script_summary(english:summary["english"]);

 script_category(ACT_GATHER_INFO);

 script_copyright(english:"This script is (C) 2003-2009 Tenable Network Security, Inc.");

 script_family(english:"CISCO");

 script_dependencie("snmp_sysDesc.nasl",
			 "snmp_cisco_type.nasl");
 script_require_keys("SNMP/community",
			  "SNMP/sysDesc",
			  "CISCO/model");
 exit(0);
}


# The code starts here
ok=0;
os = get_kb_item("SNMP/sysDesc"); if(!os)exit(0);
hardware = get_kb_item("CISCO/model"); if(!hardware)exit(0);




# Check for the required operating system...
#----------------------------------------------------------------
# Is this IOS ?
if(!egrep(pattern:".*(Internetwork Operating|IOS).*", string:os))exit(0);
# 11.0
if(egrep(string:os, pattern:"(11\.0\([0-9]*\)|11\.0),"))ok=1;

# 11.1
if(egrep(string:os, pattern:"(11\.1\([0-9]*\)|11\.1),"))ok=1;

# 11.2
if(egrep(string:os, pattern:"(11\.2\([0-9]*\)|11\.2),"))ok=1;

# 11.3
if(egrep(string:os, pattern:"(11\.3\([0-9]*\)|11\.3),"))ok=1;

# 12.0
if(egrep(string:os, pattern:"(12\.0\([0-9]*\)|12\.0),"))ok=1;

# 12.1
if(egrep(string:os, pattern:"(12\.1\([0-9]*\)|12\.1),"))ok=1;

# 12.2B
if(egrep(string:os, pattern:"(12\.2\((([0-9]|1[0-2])[^0-9]|13.[0-2])\)|12\.2)B[0-9]*,"))ok=1;

# 12.2T
if(egrep(string:os, pattern:"(12\.2\((([0-9]|1[0-1])[^0-9]|12.[0-4])\)|12\.2)T[0-9]*,"))ok=1;

# 12.2S
if(egrep(string:os, pattern:"(12\.2\((([0-9]|1[0-1])[^0-9]|12.[0-4])\)|12\.2)S[0-9]*,"))ok=1;

# 12.2
if(egrep(string:os, pattern:"(12\.2\((([0-9]|1[0-1])[^0-9]|12.[0-4])\)|12\.2),"))ok=1;

# 12.2T
if(egrep(string:os, pattern:"(12\.2\((([0-9]|1[0-1])[^0-9]|12.[0-1])\)|12\.2)T[0-9]*,"))ok=1;


#----------------------------------------------

if(ok)security_hole(port:161, proto:"udp");
