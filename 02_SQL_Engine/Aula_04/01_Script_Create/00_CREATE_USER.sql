CREATE LOGIN [rodrigo.charles] 
WITH PASSWORD=N'RodCha(äsd86Q!2024>'
GO
CREATE USER [rodrigo.charles] FOR LOGIN [rodrigo.charles]
GO

CREATE LOGIN [nathan.arrais] 
WITH PASSWORD=N'NatArr(äsd86Q!2024>'
GO
CREATE USER [nathan.arrais] FOR LOGIN [nathan.arrais]
GO


CREATE LOGIN [flavia.castro] 
WITH PASSWORD=N'FlaCas(äsd86Q!2024>'
GO
CREATE USER [flavia.castro] FOR LOGIN [flavia.castro]
GO


CREATE LOGIN [wesley.mical] 
WITH PASSWORD=N'WesMic(äsd86Q!2024>'
GO
CREATE USER [wesley.mical] FOR LOGIN [wesley.mical]
GO

CREATE LOGIN [marielle.miziara] 
WITH PASSWORD=N'MarMiz(äsd86Q!2024>'
GO
CREATE USER [marielle.miziara] FOR LOGIN [marielle.miziara]
GO


CREATE LOGIN [daniela.braganca] 
WITH PASSWORD=N'DanBra(äsd86Q!2024>'
GO
CREATE USER [daniela.braganca] FOR LOGIN [daniela.braganca]
GO

GRANT ROLE db_ddladmin ADD MEMBER TO [rodrigo.charles]

GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [rodrigo.charles];
GO

server: srv-mba-engenharia-dados.database.windows.net
database: db-mba-engenharia-dados
username: rodrigo.charles
password: RodCha(äsd86Q!2024>

server: srv-mba-engenharia-dados.database.windows.net
database: db-mba-engenharia-dados
username: nathan.arrais
password: NatArr(äsd86Q!2024>

server: srv-mba-engenharia-dados.database.windows.net
database: db-mba-engenharia-dados
username: flavia.castro
password: FlaCas(äsd86Q!2024>

server: srv-mba-engenharia-dados.database.windows.net
database: db-mba-engenharia-dados
username: wesley.mical
password: WesMic(äsd86Q!2024>

server: srv-mba-engenharia-dados.database.windows.net
database: db-mba-engenharia-dados
username: marielle.miziara
password: MarMiz(äsd86Q!2024>



GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [rodrigo.charles];
GO
GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [marielle.miziara];
GO
GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [wesley.mical];
GO
GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [flavia.castro];
GO
GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [nathan.arrais];
GO
GRANT CONTROL ON DATABASE::[db-mba-engenharia-dados] TO [daniela.braganca];
GO
