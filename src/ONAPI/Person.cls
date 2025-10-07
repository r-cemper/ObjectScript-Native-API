/// This sample persistent class represents a person.
Class ONAPI.Person Extends (%Persistent, %Populate, %XML.Adaptor, %JSON.Adaptor)
{

/// Define a unique index for <property>SSN</property>.
Index SSNKey On SSN [ Type = index, Unique ];

/// Define an index for <property>Name</property>.
Index NameIDX On Name [ Data = Name ];

/// Define an index for embedded object property <b>ZipCode</b>.
Index ZipCode On Home.Zip [ Type = bitmap ];

// define properties for this class

/// Person's name.
Property Name As %String(POPSPEC = "Name()") [ Required ];

/// Person's Social Security number. This is validated using pattern match.
Property SSN As %String(PATTERN = "3N1""-""2N1""-""4N") [ Required ];

/// Person's Date of Birth.
Property DOB As %Date(POPSPEC = "Date()");

/// Person's home address. This uses an embedded object.
Property Home As Address;

/// Person's office address. This uses an embedded object.
Property Office As Address;

/// Person's spouse. This is a reference to another persistent object.
Property Spouse As Person;

/// A collection of strings representing the person's favorite colors.
Property FavoriteColors As list Of %String(POPSPEC = "ValueList("",Red,Orange,Yellow,Green,Blue,Purple,Black,White""):2");

/// Person's age.<br>
/// This is a calculated field whose value is derived from <property>DOB</property>.
Property Age As %Integer [ Calculated, SqlComputeCode = { Set {Age}=$Select({DOB}="":"",1:($ZD($H,8)-$ZD({DOB},8)\10000))}, SqlComputed, SqlComputeOnChange = DOB ];

ClassMethod JSON(id As %Integer) As %String(MAXLEN="") [ CodeMode = objectgenerator ]
{
 set class=%class.%Id()
 do %code.WriteLine(" try {")
 do %code.WriteLine(" do ##class("_class_").%OpenId(id).%JSONExportToString(.jsn)")
 do %code.WriteLine(" } catch ex { set jsn=ex.Name}")
 do %code.WriteLine(" quit jsn")
 quit 1   ; for Code Quality
}

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>SSN</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Home</Value>
</Value>
<Value name="6">
<Value>Office</Value>
</Value>
<Value name="7">
<Value>Spouse</Value>
</Value>
<Value name="8">
<Value>FavoriteColors</Value>
</Value>
</Data>
<DataLocation>^ONAPI.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^ONAPI.PersonD</IdLocation>
<IndexLocation>^ONAPI.PersonI</IndexLocation>
<StreamLocation>^ONAPI.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

