# NATIVE API also for InterSystems ObjectScript    
Native API exists not just for Java, Python, Node.JS, :Net  
### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and
[Docker desktop](https://www.docker.com/products/docker-desktop) installed.
### Installation
Clone/git pull the repo into any local directory
```
git clone https://github.com/r-cemper/ObjectScript-Native-API.git
```
To build and start the container run:
```
docker compose up -d && docker compose logs -f
```
To open IRIS Terminal do:
```
docker-compose exec iris iris session iris
USER>
```
or using **Iterm**
```
http://localhost:42773/iterm/
```
To access IRIS System Management Portal
```
http://localhost:42773/csp/sys/UtilHome.csp
```
### the Demo
> Warning: Just use Docker for testing.    
> The Version from IPM is outdated and has a bug.    
    
The demo is based on the raw class descriptions.  
The data classes used are Address, Person, Employee, Company.  
For a more attractive demo, a JSONtoString method by ID was added.  

Run from Terminal  
~~~
zn "USER"
USER>do ##class(ONAPI.demo).Run()
Adjust Parameters
host[127.0.0.1]:
port[1972]:
namespace[USER]:
user[_SYSTEM]:
pwd[SYS]:
timeout[5]:
****** connected ********
~~~
Next, you get a list of possible demo actions.  
No input means no action.  
The menu loops until you exit.
~~~  
Populate Person by:100
     100
Populate Company by:10
     10
Populate Employee by:50
     50
Show Person by ID:3
{
  "Name":"Xiang,Zeke O.",
  "SSN":"870-92-7734",
  "DOB":"1941-03-31",
  "Home":{
    "Street":"6908 Second Court",
    "City":"Gansevoort",
    "State":"AL",
    "Zip":"47402"
  },
  "Office":{
    "Street":"2693 Madison Court",
    "City":"Albany",
    "State":"NM",
    "Zip":"18632"
  },
  "FavoriteColors":[
    "Yellow"
  ],
  "Age":84
}

Show Company by ID:3
 {
  "Name":"BioMatix Partners",
  "Mission":"Building shareholder value by delivering sustainable distributed cold-fusion powered productivity tools for capital markets.",
  "TaxID":"A1141",
  "Revenue":554773133
}

Show Employee by ID:103
 {
  "Name":"Hanson,Mary X.",
  "SSN":"358-94-2440",
  "DOB":"1951-08-24",
  "Home":{
    "Street":"4225 First Street",
    "City":"Tampa",
    "State":"CA",
    "Zip":"21937"
  },
  "Office":{
    "Street":"4340 First Drive",
    "City":"Miami",
    "State":"SD",
    "Zip":"14436"
  },
  "Spouse":{
    "Name":"Marks,Mario W.",
    "SSN":"129-46-7209",
    "DOB":"2008-08-18",
    "Home":{
      "Street":"244 Franklin Place",
      "City":"Washington",
      "State":"RI",
      "Zip":"23833"
    },
    "Office":{
      "Street":"8192 Oak Blvd",
      "City":"Queensbury",
      "State":"MD",
      "Zip":"52583"
    },
    "FavoriteColors":[
      "Red"
    ],
    "Age":17
  },
  "FavoriteColors":[
    "Orange"
  ],
  "Age":74,
  "Title":"Sales Rep.",
  "Salary":82795
}

Show Global PersonD by ID:4
     $Data()=1
     Value=$lb("","Eastman,Mary C.","887-18-3730",44711,$lb("3889 Ash Blvd","Washington","TX",67862),$lb("5709 Oak Blvd","Chicago","IL",30845),"","")

Index list for Person & Employee (n,y):y
     $Employee
     $Person
     NameIDX
     SSNKey
     ZipCode
Exit Demo (n,y,*):y
****** done ********
USER>
~~~

[Article in DC](https://community.intersystems.com/post/iris-native-api-objectscript)
