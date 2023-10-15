------ 1 ������� ----

use T_MyBase;

create xml schema collection Tovar as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="�����">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="��������" maxOccurs="1" minOccurs="1" type="xs:string" />
				<xs:element name="����" maxOccurs="1" minOccurs="1" type="xs:decimal" />
				<xs:element name="����������_��_������" maxOccurs="1" minOccurs="1" type="xs:unsignedInt" />
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>';

alter table ������ add INFO xml(Tovar);

update ������ set INFO = 
'<�����>
	<��������>������������� �����</��������>
	<����>2356.83</����>
	<����������_��_������>500</����������_��_������>
</�����>' where [ID ������] = 1;

select t.INFO.value('(/�����/��������)[1]', 'varchar(50)')[��������], 
		t.INFO.value('(/�����/����)[1]', 'real')[����], t.INFO.query('(/�����/����������_��_������)')[����������]
from ������ t where t.[ID ������] = 1