/// This sample persistent class represents a company<br>
Class ONAPI.Company Extends (%Persistent, %Populate, %XML.Adaptor, %JSON.Adaptor)
{

/// Define an index for <property>Name</property>.
Index NameIdx On Name [ Type = index ];

/// Define a unique index for <property>TaxID</property>.
Index TaxIDIdx On TaxID [ Type = index, Unique ];

/// The company's name.
Property Name As %String(MAXLEN = 80, POPSPEC = "Company()") [ Required ];

/// The company's mission statement.
Property Mission As %String(MAXLEN = 200, POPSPEC = "Mission()");

/// The unique Tax ID number for the company.
Property TaxID As %String [ Required ];

/// The last reported revenue for the company.
Property Revenue As %Integer;

/// The <class>Employee</class> objects associated with this <class>Company</class>.
Relationship Employees As Employee [ Cardinality = many, Inverse = Company ];

ClassMethod JSON(id As %Integer) As %String(MAXLEN="") [ CodeMode = objectgenerator ]
{
 set class=%class.%Id()
 do %code.WriteLine(" try {")
 do %code.WriteLine(" do ##class("_class_").%OpenId(id).%JSONExportToString(.jsn)")
 do %code.WriteLine(" } catch ex { set jsn=ex.Name}")
 do %code.WriteLine(" quit jsn")
 quit 1   ; for code Quality
}

Storage Default
{
<Data name="CompanyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Mission</Value>
</Value>
<Value name="4">
<Value>TaxID</Value>
</Value>
<Value name="5">
<Value>Revenue</Value>
</Value>
</Data>
<DataLocation>^ONAPI.CompanyD</DataLocation>
<DefaultData>CompanyDefaultData</DefaultData>
<IdLocation>^ONAPI.CompanyD</IdLocation>
<IndexLocation>^ONAPI.CompanyI</IndexLocation>
<StreamLocation>^ONAPI.CompanyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

