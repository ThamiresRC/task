-- DDL DimDim - SQL Server (Azure)
CREATE TABLE dbo.Task (
    id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    title        NVARCHAR(120) NOT NULL,
    description  NVARCHAR(1000) NULL,
    status       NVARCHAR(20)  NOT NULL,
    due_date     DATETIME2 NULL,
    created_at   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    updated_at   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.Audit_Log (
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    task_id     BIGINT NOT NULL,
    action      NVARCHAR(60) NOT NULL,
    details     NVARCHAR(1000) NULL,
    created_at  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Audit_Task
      FOREIGN KEY (task_id) REFERENCES dbo.Task(id) ON DELETE CASCADE
);
