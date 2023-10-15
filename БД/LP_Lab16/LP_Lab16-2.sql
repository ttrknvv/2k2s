------ 1 задание ----

use T_MyBase;

create xml schema collection Tovar as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="Товар">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="название" maxOccurs="1" minOccurs="1" type="xs:string" />
				<xs:element name="цена" maxOccurs="1" minOccurs="1" type="xs:decimal" />
				<xs:element name="количество_на_складе" maxOccurs="1" minOccurs="1" type="xs:unsignedInt" />
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>';

alter table ТОВАРЫ add INFO xml(Tovar);

update ТОВАРЫ set INFO = 
'<Товар>
	<название>Электрический котел</название>
	<цена>2356.83</цена>
	<количество_на_складе>500</количество_на_складе>
</Товар>' where [ID товара] = 1;

select t.INFO.value('(/Товар/название)[1]', 'varchar(50)')[Название], 
		t.INFO.value('(/Товар/цена)[1]', 'real')[Цена], t.INFO.query('(/Товар/количество_на_складе)')[Количество]
from ТОВАРЫ t where t.[ID товара] = 1