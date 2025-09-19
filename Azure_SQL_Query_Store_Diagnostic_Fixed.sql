-- Azure SQL Database: Query Store Diagnostic and Setup Commands

-- Enable Query Store
ALTER DATABASE [YourDatabaseName] SET QUERY_STORE = ON;

-- Configure Query Store Options
ALTER DATABASE [YourDatabaseName] SET QUERY_STORE ( 
    OPERATION_MODE = READ_WRITE, 
    QUERY_CAPTURE_MODE = AUTO, 
    MAX_SIZE_MB = 100, 
    INTERVAL_LENGTH_MINUTES = 60, 
    SIZE_BASED_CLEANUP_MODE = AUTO 
);

-- Force Query Store Capture
EXEC sys.sp_query_store_force_flush;

-- View Query Store Information
SELECT * FROM sys.query_store_query;
SELECT * FROM sys.query_store_query_text;
SELECT * FROM sys.query_store_plan;