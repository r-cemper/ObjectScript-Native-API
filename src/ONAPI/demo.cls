/// show basic operation of IRIS Native API for ObjectScript
Class ONAPI.demo Extends %RegisteredObject
{

Property host As %String(MAXLEN = "") [ InitialExpression = "127.0.0.1" ];

Property port As %Integer [ InitialExpression = 1972 ];

Property namespace As %String(MAXLEN = "") [ InitialExpression = "USER" ];

Property user As %String(MAXLEN = "") [ InitialExpression = "_SYSTEM" ];

Property pwd As %String(MAXLEN = "") [ InitialExpression = "SYS" ];

Property timeout As %Integer [ InitialExpression = 5 ];

Property logfile As %String(MAXLEN = 255) [ InitialExpression = "ONAPI.demo.log" ];

Property connection As %Net.DB.Connection;

Property iris As %Net.DB.Iris;

Method %OnNew() As %Status [ Private, ServerOnly = 1 ]
{
	set tSC=..Init()
	quit:'tSC tSC
	set ..connection=##class(%Net.DB.DataSource).CreateConnection(
		..host,..port,..namespace,..user,..pwd,..timeout)
	set ..iris=..connection.CreateIris()
	quit $$$OK
}

Method Init() As %Status
{
	write "Adjust Parameters",!
	for prop="host","port","namespace","user","pwd","timeout" {
		do {
			write prop_"["_$property($this,prop)_"]: ",?10 read nw,!
			if $l(nw) set $property($this,prop)=nw  ;for code Quality !!
			} while $test
		}
	write "****** connected ********",!	
	quit $$$OK
}

ClassMethod Run()
{
	set DB=##class(ONAPI.demo).%New()
		,go=1
	while go { do DB.Menu(.go) }
	set DB.iris=""
	do DB.connection.Close()
	kill DB
	write "****** done ********",!	
	quit
}

/// list of prepared tests	
Method Menu(ByRef go As %Boolean = 1)
{
	read "Populate Person by:",pop,!
	if pop write ?5,..iris.ClassMethodValue("ONAPI.Person","Populate",pop),!
	read "Populate Company by:",pop,!
	if pop write ?5,..iris.ClassMethodValue("ONAPI.Company","Populate",pop),!
	read "Populate Employee by:",pop,!
	if pop write ?5,..iris.ClassMethodValue("ONAPI.Employee","Populate",pop),!
	read "Show Person by ID:",pop,!
    if pop write ?5,..iris.ClassMethodValue("ONAPI.Person","JSON",pop),!
	read "Show Company by ID:",pop,!
    if pop write ?5,..iris.ClassMethodValue("ONAPI.Company","JSON",pop),!
	read "Show Employee by ID:",pop,!
    if pop write ?5,..iris.ClassMethodValue("ONAPI.Employee","JSON",pop),!
    read "Show Global PersonD by ID:",pop,!
    if $l(pop) {
	    set d=..iris.IsDefined("ONAPI.PersonD",$s(pop:pop,1:""))
	    write ?5,"$Data()=",d,!
	    if d#10 {
		    set Value=..iris.Get("ONAPI.PersonD",pop)
		    write ?5 zwrite Value  
    		}
		}
	read "Index list for Person & Employee (n,y):",pop,! 		
	if $l(pop),"Yy"[$e(pop) {
		set idx=""
		for  { 
			set idx=..iris.GetNext(1,,,"ONAPI.PersonI",idx)
			if $l(idx) write ?5,idx,!
			else  quit	
			} 
		}
	read "Exit Demo (n,y,*):",pop,!		
	if $l(pop),"*Yy"[$e(pop) set go=0
	quit
}

}

