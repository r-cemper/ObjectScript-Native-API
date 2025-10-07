/// This sample persistent class represents an employee.<br>
Class ONAPI.Employee Extends Person
{

/// The employee's job title.
Property Title As %String(MAXLEN = 50, POPSPEC = "Title()");

/// The employee's current salary.
Property Salary As %Integer(MAXVAL = 100000, MINVAL = 0);

/// A character stream containing notes about this employee.
Property Notes As %Stream.GlobalCharacter;

/// A picture of the employee
Property Picture As %Stream.GlobalBinary;

/// The company this employee works for.
Relationship Company As Company [ Cardinality = one, Inverse = Employees ];

Storage Default
{
<Data name="EmployeeDefaultData">
<Subscript>"Employee"</Subscript>
<Value name="1">
<Value>Title</Value>
</Value>
<Value name="2">
<Value>Salary</Value>
</Value>
<Value name="3">
<Value>Notes</Value>
</Value>
<Value name="4">
<Value>Picture</Value>
</Value>
<Value name="5">
<Value>Company</Value>
</Value>
</Data>
<DefaultData>EmployeeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

