#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(11156);
 script_version ("$Revision: 1.10 $");
 
 script_name(english:"IRC Daemon Version Detection");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is an IRC Server." );
 script_set_attribute(attribute:"description", value:
"This script determines the version of the IRC daemon." );
 script_set_attribute(attribute:"solution", value:
"N/A" );
 script_set_attribute(attribute:"risk_factor", value:"None" );

script_end_attributes();

 script_summary(english:"IRCD version");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2002-2009 Tenable Network Security, Inc.");
 script_family(english:"Service detection");
 script_dependencie("find_service1.nasl", "find_service2.nasl");
 script_require_ports("Services/irc", 6667);
 exit(0);
}

#

port = get_kb_item("Services/irc");
if (!port) port = 6667;
if(! get_port_state(port)) exit(0);

soc = open_sock_tcp(port);
if (! soc) exit(0);

nick = NULL;
for (i=0;i<9;i++)
 nick += raw_string (0x41 + (rand() % 10));

user = nick;

req = string("NICK ", nick, "\r\n", 
	"USER ", nick, " ", this_host_name(), " ", get_host_name(), 
	" :", user, "\r\n");
send(socket: soc, data: req);
while ( a = recv_line(socket:soc, length:4096) )
{
 #display(a);
 if ( a =~ "^PING." )
 {
  a = ereg_replace(pattern:"PING", replace:"PONG", string:a);
  send(socket:soc, data:a);
 }
}

send(socket: soc, data: string("VERSION\r\n"));
v = "x";
while ((v) && ! (" 351 " >< v)) v = recv_line(socket: soc, length: 256);
#display(v);
send(socket: soc, data: string("QUIT\r\n"));
close(soc);

if (!v) exit(0);

k = string("irc/banner/", port);
set_kb_item(name: k, value: v);

# Answer looks like:
# :irc.sysdoor.com 351 nessus123 2.8/csircd-1.13. irc.sysdoor.com :http://www.codestud.com/ircd
v2 = ereg_replace(string: v, pattern: ": *[^ ]+ +[0-9]+ +[a-zA-Z0-9]+ +([^ ]+) +[^ ]+ *:(.*)", replace: "\1 \2");
# display(v2);
if (v == v2) exit(0);

m = string("The IRC server version is : ", v2);
security_note(port: port, data: m);

