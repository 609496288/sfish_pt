#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(29720);
 script_version ("$Revision: 1.4 $");
 name["english"] = "Solaris 10 (i386) : 119314-15";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is missing Sun Security Patch number 119314-15
(SunOS 5.10_x86: WBEM Patch).

Date this patch was last updated by Sun : Mon Jan 07 09:46:37 MST 2008

You should install this patch for your system to be up-to-date." );
 script_set_attribute(attribute:"solution", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-119314-15-1" );
 script_set_attribute(attribute:"risk_factor", value:"High" );


 script_end_attributes();

 
 summary["english"] = "Check for patch 119314-15"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2008 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWdclnt", version:"1.0,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWfsmgtu", version:"1.0,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWlvma", version:"3.0,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWlvmr", version:"3.0,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWmgapp", version:"1.0,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWwbapi", version:"2.6,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWwbcor", version:"2.6,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWwbcou", version:"2.6,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWwbdev", version:"2.6,REV=2005.01.09.21.19");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119314-15", obsoleted_by:"OBSOLETE", package:"SUNWwbpro", version:"2.0,REV=2005.01.09.21.19");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
