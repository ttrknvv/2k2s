----- ������������� XML  -----

---- 1 ������� ---

use UNIVER;

select trim(t.TEACHER) '�����������_���', trim(t.TEACHER_NAME) '������_���', trim(t.PULPIT) '�������', t.GENDER '���' 
	from TEACHER t
		where t.PULPIT like '����' for xml path('�������������'),
		root('������_��������������'), elements;

---- 2 ������� ----

select trim(AUDITORIUM) '������������_���������', trim(AUDITORIUM_TYPENAME) '������������_����_���������', 
		AUDITORIUM_CAPACITY '�����������'
	from AUDITORIUM[���������] inner join AUDITORIUM_TYPE[���_���������]
		on [���������].AUDITORIUM_TYPE = [���_���������].AUDITORIUM_TYPE
	where [���������].AUDITORIUM_TYPE like '%��%' for xml AUTO,
	root('������_���������'), elements;

--- 3 ������� ----

declare @h int = 0;
declare @xmlDoc varchar(500) = 
'<?xml version="1.0" encoding="windows-1251" ?>
 <����������>
 <���������� ������="���" ��������="������������ ����� ��������" �������="����"/>
 <���������� ������="����" ��������="���������� ���������� ���������������� �����������" �������="����"/>
 <���������� ������="����" ��������="������������ ������� � ����" �������="����"/>
 </����������>';
 exec sp_xml_preparedocument @h output, @xmlDoc;
 select * from openxml(@h, '/����������/����������', 0)
 with([������] char(10), [��������] varchar(100), [�������] char(20))

 insert SUBJECT select [������], [��������], [�������]
						from openxml(@h, '/����������/����������', 0)
							 with([������] char(10), [��������] varchar(100), [�������] char(20))
 exec sp_xml_removedocument @h;

 select * from SUBJECT;
 delete SUBJECT where SUBJECT like '���'
  delete SUBJECT where SUBJECT like '����'
   delete SUBJECT where SUBJECT like '����'

   --- 4 ������� ----

insert into STUDENT(NAME, BDAY, IDGROUP, INFO)
	values('��������� ������ ���������', '07-02-2004', 4,	'<�������><�����>MC</�����>
																<�����>71634823</�����>
																<������_�����>787EWFJ73HD3D</������_�����>
																<����_������>07022013</����_������>
																<�����>�. �����, 2 ���. ���������� �. 4</�����></�������>')

update STUDENT set INFO = '<�������><�����>PT</�����>
							<�����>9283744</�����>
							<������_�����>94832J2H4F38D</������_�����>
							<����_������>17042016</����_������>
							<�����>�. �����, ��. ������������� �. 23</�����></�������>' where IDSTUDENT = 1059

update STUDENT set INFO = '<�������><�����>PT</�����>
							<�����>1234567</�����>
							<������_�����>94832J2H4F38D</������_�����>
							<����_������>17042016</����_������>
							<�����>�. �����, ��. ������������� �. 23</�����></�������>' where INFO.value('(/�������/�����)[1]', 'varchar(15)') = 9283744

select s.NAME, s.INFO.value('(/�������/�����)[1]', 'varchar(3)')[�����], s.INFO.value('(/�������/�����)[1]', 'varchar(15)')[����� ��������],
		s.INFO.value('(/�������/������_�����)[1]', 'varchar(20)')[������ �����], 
		s.INFO.value('(/�������/����_������)[1]', 'varchar(15)')[���� ������],
		s.INFO.query('(/�������/�����)')[�����]
	from STUDENT s
		where s.IDSTUDENT = 1059 or s.IDSTUDENT = 1081


--- 5 ������� ---

create xml schema collection checkStudent as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="�������">  
       <xs:complexType><xs:sequence>
       <xs:element name="�������" maxOccurs="1" minOccurs="1">
       <xs:complexType>
       <xs:attribute name="�����" type="xs:string" use="required" />
       <xs:attribute name="�����" type="xs:unsignedInt" use="required"/>
       <xs:attribute name="����"  use="required" >  
       <xs:simpleType>  <xs:restriction base ="xs:string">
   <xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
   </xs:restriction> 	</xs:simpleType>
   </xs:attribute> </xs:complexType> 
   </xs:element>
   <xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
   <xs:element name="�����">   <xs:complexType><xs:sequence>
   <xs:element name="������" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="���" type="xs:string" />
   <xs:element name="��������" type="xs:string" />
   </xs:sequence></xs:complexType>  </xs:element>
   </xs:sequence></xs:complexType>
   </xs:element>
</xs:schema>'
alter table STUDENT drop column INFO;
alter table STUDENT add INFO xml(checkStudent);

update STUDENT set INFO = 
'<�������>
	<������� �����="��" �����="123456" ����="07.02.2004" />
	<�������>3752574118</�������>
	<�����>
		<������>��������</������>
		<�����>�����</�����>
		<�����>����������</�����>
		<���>4</���>
		<��������>2</��������>
	</�����>
</�������>' where IDSTUDENT = 1000

update STUDENT set INFO = 
'<�������>
	<������� �����="��" �����="123456" ����="07.02.2004" />
	<�������>3752574118</�������>
	<�����>
		<������>��������</������>
		<�����>�����</�����>
		<�����>����������</�����>
		<���>4</���>
		<��������>2</��������>
		<�������>4</�������>
	</�����>
</�������>' where IDSTUDENT = 1001

create xml schema collection checkStudent2 as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
       <xs:element name="�������">  
		<xs:complexType>
			<xs:sequence>
				<xs:element name="�����" maxOccurs="1" minOccurs="1" type="xs:string" />
				<xs:element name="�����" maxOccurs="1" minOccurs="1" type="xs:unsignedInt" />
				<xs:element name="������_�����" maxOccurs="1" minOccurs="1" type="xs:string" />
				<xs:element name="����_������" maxOccurs="1" minOccurs="1" type="xs:string" />
				<xs:element name="�����" maxOccurs="1" minOccurs="1" type="xs:string" />
			</xs:sequence>
		</xs:complexType>
   </xs:element>
</xs:schema>'

alter table STUDENT drop column INFO;
alter table STUDENT add INFO xml(checkStudent2);


