SELECT ������.������������_������ /* 1 ������ */
FROM   ������ INNER JOIN
             ������ ON ������.������������ = ������.������������_������
WHERE (������.����_�������� < CONVERT(DATETIME, '2023-10-10 00:00:00', 102))
ORDER BY ������.����_��������

SELECT ������.������������ /* 2 ������ */
FROM   ������
WHERE (���� >= 50 AND ���� <= 60)
ORDER BY ����

SELECT ������.�������� /* 3 ������ */
FROM   ������
WHERE (������������_������ = N'����' OR ������������_������ = N'������')
ORDER BY ������������_������

SELECT ������.�����_������ /* 4 ������ */
FROM   ������
WHERE (�������� = N'LovelyFruits')
ORDER BY ����_��������
