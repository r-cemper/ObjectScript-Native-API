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
     {"Name":"Rogers,Norbert V.","SSN":"990-11-9806","DOB":"1962-04-23","Home":{"Street":"867 Oak Street","City":"Denver","State":"NH","Zip":"64647"},"Office":{"Street":"3309 Oak Court","City":"Denver","State":"NY","Zip":"76436"},"FavoriteColors":["Green","Green"],"Age":58}

Show Company by ID:3
     {"Name":"CompuComp Corp.","Mission":"Specializing in the development and manufacturing of open-source object-oriented models for additive manufacturing.","TaxID":"Y8155","Revenue":819493934,"Employees":[{"Name":"Ahmed,Sophia P.","SSN":"936-73-5161","DOB":"1933-08-08","Home":{"Street":"8758 Elm Street","City":"Fargo","State":"OH","Zip":"40652"},"Office":{"Street":"1578 Maple Street","City":"Larchmont","State":"IA","Zip":"89021"},"Spouse":{"Name":"Olsen,William A.","SSN":"912-52-4809","DOB":"2010-01-26","Home":{"Street":"2933 Main Street","City":"Bensonhurst","State":"WA","Zip":"51960"},"Office":{"Street":"4994 Ash Street","City":"Gansevoort","State":"OR","Zip":"89750"},"Spouse":{"Name":"Adam,Brian D.","SSN":"799-82-3083","DOB":"2005-11-04","Home":{"Street":"1264 Oak Avenue","City":"Chicago","State":"WV","Zip":"34943"},"Office":{"Street":"7443 Second Avenue","City":"Zanesville","State":"CO","Zip":"30478"},"Spouse":{"Name":"Cooke,Diane C.","SSN":"754-49-5729","DOB":"1984-01-12","Home":{"Street":"9624 Maple Place","City":"Albany","State":"MS","Zip":"60948"},"Office":{"Street":"4711 Second Place","City":"Youngstown","State":"VA","Zip":"31250"},"Age":36},"FavoriteColors":["Orange"],"Age":14},"FavoriteColors":["Green","Green"],"Age":10,"Title":"Senior Systems Engineer","Salary":61511},"Age":87,"Title":"Product Manager","Salary":59127},{"Name":"Ng,Elmo S.","SSN":"201-15-3259","DOB":"1954-10-14","Home":{"Street":"2437 Main Avenue","City":"Xavier","State":"KY","Zip":"10156"},"Office":{"Street":"2770 Oak Drive","City":"Tampa","State":"OH","Zip":"18459"},"Spouse":{"Name":"Eastman,Linda M.","SSN":"110-41-1818","DOB":"1980-03-19","Home":{"Street":"5309 Ash Drive","City":"Xavier","State":"RI","Zip":"36964"},"Office":{"Street":"4288 Washington Place","City":"Xavier","State":"HI","Zip":"41889"},"Spouse":{"Name":"Huff,Dave C.","SSN":"559-32-3838","DOB":"1973-05-05","Home":{"Street":"6216 First Avenue","City":"Tampa","State":"WA","Zip":"68628"},"Office":{"Street":"2896 Clinton Drive","City":"Elmhurst","State":"UT","Zip":"97796"},"FavoriteColors":["Purple"],"Age":47},"FavoriteColors":["Purple","Blue"],"Age":40},"FavoriteColors":["Red","Purple"],"Age":65,"Title":"Laboratory Marketing Manager","Salary":35888}]}

Show Employee by ID:103
     {"Name":"Faust,Buzz H.","SSN":"979-41-6347","DOB":"1938-02-07","Home":{"Street":"6231 Madison Avenue","City":"Gansevoort","State":"TX","Zip":"49085"},"Office":{"Street":"6402 Main Street","City":"Elmhurst","State":"RI","Zip":"82976"},"Spouse":{"Name":"Joyce,Chad C.","SSN":"199-86-8085","DOB":"1974-11-17","Home":{"Street":"6229 Main Street","City":"Reston","State":"FL","Zip":"16922"},"Office":{"Street":"8509 Elm Blvd","City":"Bensonhurst","State":"HI","Zip":"90665"},"Spouse":{"Name":"Cooke,Diane C.","SSN":"754-49-5729","DOB":"1984-01-12","Home":{"Street":"9624 Maple Place","City":"Albany","State":"MS","Zip":"60948"},"Office":{"Street":"4711 Second Place","City":"Youngstown","State":"VA","Zip":"31250"},"Age":36},"FavoriteColors":["Purple"],"Age":45},"Age":82,"Title":"Global Administrator","Salary":13813}

Show Global PersonD by ID:4
     $Data()=1
     Value=$lb("","Eastman,Mary C.","887-18-3730",44711,$lb("3889 Ash Blvd","Washington","TX",67862),$lb("5709 Oak Blvd","Chicago","IL",30845),"","")

Index list for Person & Employee (n,y):y
     $Employee
     $Person
     NameIDX
     SSNKey
     ZipCode
Exit Demo (n,y,*):
Populate Person by:
Populate Company by:
Populate Employee by:
Show Person by ID:
Show Company by ID:
Show Employee by ID:104
     {"Name":"Novello,Emily I.","SSN":"411-35-4234","DOB":"1943-01-07","Home":{"Street":"3353 Washington Court","City":"Hialeah","State":"MT","Zip":"22403"},"Office":{"Street":"9743 Clinton Blvd","City":"Xavier","State":"OH","Zip":"89038"},"Spouse":{"Name":"Goldman,Usha T.","SSN":"465-59-4053","DOB":"1987-07-16","Home":{"Street":"2578 Second Blvd","City":"Gansevoort","State":"FL","Zip":"77552"},"Office":{"Street":"6986 Main Street","City":"Elmhurst","State":"VT","Zip":"48713"},"Spouse":{"Name":"Rogers,Norbert V.","SSN":"990-11-9806","DOB":"1962-04-23","Home":{"Street":"867 Oak Street","City":"Denver","State":"NH","Zip":"64647"},"Office":{"Street":"3309 Oak Court","City":"Denver","State":"NY","Zip":"76436"},"FavoriteColors":["Green","Green"],"Age":58},"Age":33},"FavoriteColors":["Green","White"],"Age":77,"Title":"Senior Product Specialist","Salary":96469}

Show Global PersonD by ID:
Index list for Person & Employee (n,y):
Exit Demo (n,y,*):y
****** done ********
 
USER>
~~~

[Article in DC](https://community.intersystems.com/post/iris-native-api-objectscript)
