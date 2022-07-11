import javax.xml.crypto.Data;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

/**
 * Class which needs to be implemented.  ONLY this class should be modified
 */
public class DatabaseDumper201 extends DatabaseDumper {
  
    /**
     * 
     * @param c connection which the dumper should use
     * @param type a string naming the type of database being connected to e.g. sqlite
     */
    public DatabaseDumper201(Connection c,String type) {
        super(c,type);
    }
    /**
     * 
     * @param c connection to a database which will have a sql dump create for
     */
    public DatabaseDumper201(Connection c) {
        super(c,c.getClass().getCanonicalName());
    }

    /**
     * Method to get list of table names from a database
     *
     * @return List<String>, list of table names from connection's database
     */
    public List<String> getTableNames() {
        List<String> result = new ArrayList<>();

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();
            String tableTypes[] = {"TABLE"};

            ResultSet tables = md.getTables(null, null, "%", tableTypes);

            while (tables.next())
            {
                String tableName = tables.getString("TABLE_NAME");
                //System.out.println(tableName);
                result.add(tableName);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Method to get the names of the views in a database
     *
     * @return List<String>, list of view names from connection's database
     */
    @Override
    public List<String> getViewNames() {
        List<String> result = new ArrayList<>();

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();
            String viewType[] = {"VIEW"};

            ResultSet tables = md.getTables(null, null, "%", viewType);

            while (tables.next())
            {
                String viewName = tables.getString("TABLE_NAME");
                //System.out.println(viewName + " " + tables.getString("TABLE_SCHEM"));
                result.add(viewName);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Method to get the primary keys of a table
     *
     * @param tableName table to get primary keys from
     * @return String, the names of primary keys in a table
     */
    private String getPrimaryKeys(String tableName)
    {
        Connection con = super.getConnection();
        String pk = "";
        try
        {
            DatabaseMetaData md = con.getMetaData();
            ResultSet primaryKeys = md.getPrimaryKeys(con.getCatalog(), null, tableName);

            while (primaryKeys.next())
            {
                String primaryKey = primaryKeys.getString(4);
                if (!primaryKeys.isFirst())
                {
                    pk = pk + ",";
                }
                pk = pk + putInDoubleQuotes(primaryKey);
            }

        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return pk;
    }

    /**
     * Method to get the foreign keys in a table
     *
     * @param tableName table to get foreign keys from
     * @return String, names of foreign keys in a table
     */
    private String getForeignKeys(String tableName)
    {
        Connection con = super.getConnection();
        String fk = "";

        try
        {
            DatabaseMetaData md = con.getMetaData();
            ResultSet rs = md.getImportedKeys(con.getCatalog(), null, tableName);

            while (rs.next())
            {
                String fkTableName = rs.getString("PKTABLE_NAME");
                String fkColumnName = rs.getString("FKCOLUMN_NAME");
                fk = fk + ",\nFOREIGN KEY (" + putInDoubleQuotes(fkColumnName) + ") REFERENCES " + putInDoubleQuotes(fkTableName) + "(" + putInDoubleQuotes(fkColumnName) + ")";
            }
        } catch (SQLException e)
        {
            //e.printStackTrace(); // produces error for some reason, but results are still fine?
            ;
        }

        return fk;
    }

    /**
     * Method for getting the DDL for a table in a database
     *
     * @param tableName to generate the create statement for
     * @return String, the ddl for the table given
     */
    @Override
    public String getDDLForTable(String tableName) {
        String result = "CREATE TABLE " + '"' + tableName + '"' + " (\n"; // beginning of ddl statement

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();

            ResultSet columns = md.getColumns(null, null, tableName, "%"); // getting result set of columns

            //System.out.println("Table = " + columns.getString(3));
            while (columns.next())
            {
                String columnName = columns.getString("COLUMN_NAME");
                String dataType = columns.getString("TYPE_NAME");

                if (!columns.isFirst()) // checking if pointer is on initial. if it isn't, add ddl to string with comma before
                {
                    result = result + ",\n" + putInDoubleQuotes(columnName) + " " + dataType;
                } else
                {
                    result = result + putInDoubleQuotes(columnName) + " " + dataType;
                }
                //System.out.println("Datatype = " + dataType + " and column = " + columnName);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        result = result + ",\nPRIMARY KEY(" + getPrimaryKeys(tableName) + ")";
        result = result + getForeignKeys(tableName);

        result = result + "\n);\n";
        return result;
    }

    /**
     * Method for getting all the names of the columns in a table
     *
     * @param tableName table to be acted on
     * @return String, the names of the columns in a table
     */
    public String getColumnNames(String tableName)
    {
        String result = "";

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();

            ResultSet columns = md.getColumns(null, null, tableName, "%");

            while (columns.next())
            {
                String columnName = columns.getString(4);
                if (!columns.isFirst())
                {
                    result = result + "," + putInDoubleQuotes(columnName);
                } else
                {
                    result = result + putInDoubleQuotes(columnName);
                }

            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * Method for generating inserts from a table in a database
     *
     * @param tableName to generate the inserts for
     * @return String, inserts for a tabel
     */
    @Override
    public String getInsertsForTable(String tableName) {
        String template = "INSERT INTO " + putInDoubleQuotes(tableName)+ " (" + getColumnNames(tableName) + ") VALUES(";
        String tmp;
        String result = "";

        Connection con = super.getConnection();

        try
        {
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM " + tableName;
            ResultSet rs = stmt.executeQuery(sql);

            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next())
            {
                tmp = "";
                tmp = tmp + template;

                int columnCount = rsmd.getColumnCount();
                for (int i = 1; i <= columnCount; i++)
                {
                    if (rs.getString(i).equals("null"))
                    {
                        tmp = tmp + "null";
                    } else if (rsmd.getColumnTypeName(i).equals("integer"))
                    {
                        tmp = tmp + rs.getInt(i);
                    } else if (rsmd.getColumnTypeName(i).equals("text"))
                    {
                        String rsString = rs.getString(i);
                        if (rsString.contains("'"))
                        {
                            rsString = doubleUpSingleQuotes(rsString);
                        }
                        tmp = tmp + putInSingleQuotes(rsString.strip());
                    }

                    if (i != columnCount)
                    {
                        tmp = tmp + ",";
                    }
                }
                tmp = tmp + ");\n";
                result = result + tmp;
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Generating the DDL for a database's view
     *
     * @param viewName the name of the view to generate the DDL for
     * @return String, the DDL for views
     */
    @Override
    public String getDDLForView(String viewName) {
        String result = "CREATE TABLE " + putInDoubleQuotes(viewName)+ " (\n"; // beginning of ddl statement

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();

            ResultSet columns = md.getColumns(null, null, viewName, "%"); // getting result set of columns

            //System.out.println("Table = " + columns.getString(3));
            while (columns.next())
            {
                String columnName = columns.getString("COLUMN_NAME");
                String dataType = columns.getString("TYPE_NAME");

                if (!columns.isFirst()) // checking if pointer is on initial. if it isn't, add ddl to string with comma before
                {
                    result = result + ",\n" + putInDoubleQuotes(columnName) + " " + dataType;
                } else
                {
                    result = result + putInDoubleQuotes(columnName) + " " + dataType;
                }
                //System.out.println("Datatype = " + dataType + " and column = " + columnName);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        result = result + "\n);\n";
        return result;
    }

    /**
     * Method to get continuous string full of all the results that can then be dumped
     *
     * @return String, full textual backup of database
     */
    @Override
    public String getDumpString() {
        String result = "";

        // Getting driver version and driver name
        try
        {
            DatabaseMetaData md = super.getConnection().getMetaData();
            result = result + "/\n" + md.getDriverName() + "\n" + md.getDriverVersion() + "\n/\n/\n" + md.getDatabaseProductName() + "\n" + md.getDatabaseProductVersion() + "\n/\n\n";
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        List<String> tableNames = getTableNames();
        List<String> viewNames = getViewNames();

        // CREATE TABLE DDL
        for (int i = 0; i < tableNames.size(); i++)
        {
            result = result + "DROP TABLE " + tableNames.get(i) + ";\n"; // dropping table if it already exists in preparation for the backup
            String tableDDL = getDDLForTable(tableNames.get(i));
            result = result + tableDDL;
        }

        // CREATE VIEW DDL
        for (int i = 0; i < viewNames.size(); i++)
        {
            result = result + "DROP TABLE " + viewNames.get(i) + ";\n"; // dropping table if it already exists in preparation for the backup
            String viewDDL = getDDLForView(viewNames.get(i));
            result = result + viewDDL;
        }

        // INSERT STATEMENTS
        for (int i = 0; i < tableNames.size(); i++)
        {
            String insert = getInsertsForTable(tableNames.get(i));
            result = result + insert;
        }

        // DATABASE INDEXES
        String indexes = getDatabaseIndexes();
        result = result + indexes;

        return result;
    }

    /**
     * Method to dump database backup to a specific file
     *
     * @param fileName dump the dumpString to the named file
     */
    @Override
    public void dumpToFileName(String fileName) {
        String text = getDumpString();

        try (PrintWriter out = new PrintWriter(fileName))
        {
            out.println(text);
        } catch (FileNotFoundException e)
        {
            System.out.println("Incorrect filename");
            e.printStackTrace();
        }
    }

    /**
     * Method to dump database backup to system out, either going directly to the console or echoed into a file
     */
    @Override
    public void dumpToSystemOut() {
        List<String> tableNames = getTableNames();
        List<String> viewNames = getViewNames();
        //System.out.println(tableNames);

        // Getting driver name and version
        try
        {
            DatabaseMetaData md = super.getConnection().getMetaData();
            System.out.println("/\n" + md.getDriverName() + "\n" + md.getDriverVersion() + "\n/\n/\n" + md.getDatabaseProductName() + "\n" + md.getDatabaseProductVersion() + "\n/\n\n");
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        // CREATE TABLE DDL
        for (int i = 0; i < tableNames.size(); i++)
        {
            System.out.println("DROP TABLE " + tableNames.get(i) + ";"); // dropping table if it already exists in preparation for the backup
            String tableDDL = getDDLForTable(tableNames.get(i));
            System.out.println(tableDDL);
        }

        // CREATE VIEW DDL
        for (int i = 0; i < viewNames.size(); i++)
        {
            System.out.println("DROP TABLE " + viewNames.get(i) + ";"); // dropping view if it already exists in preparation for the backup
            String viewDDL = getDDLForView(viewNames.get(i));
            System.out.println(viewDDL);
        }

        // INSERT STATEMENTS
        for (int i = 0; i < tableNames.size(); i++)
        {
            //System.out.println("Table name: " + tableNames.get(i));
            String insert = getInsertsForTable(tableNames.get(i));
            System.out.println(insert);
        }

        // DATABASE INDEXES
        String indexes = getDatabaseIndexes();
        System.out.println(indexes);
    }

    /**
     * Overridden method to get the indexes held in a database, if any
     *
     * @return String, the indexes contained in a database
     */
    @Override
    public String getDatabaseIndexes()
    {
        String result = "";
        String template = "CREATE INDEX ";

        String indexedColumns;
        String indexName;

        List<String> tableNames = getTableNames();

        Connection con = super.getConnection();

        try
        {
            DatabaseMetaData md = con.getMetaData();

            for (int i = 0; i < tableNames.size(); i++)
            {
                String tableName = tableNames.get(i);
                ResultSet rs = md.getIndexInfo(con.getCatalog(), null, tableName, false, false);

                indexedColumns = "";
                indexName = rs.getString("INDEX_NAME");

                if (indexName.contains(" "))
                {
                    indexName = makeSpacesIntoUnderscores(indexName);
                }

                if (indexName.contains("autoindex")) // ignore autoindex
                {
                    //System.out.println("Autoindex detected");
                    continue;
                }

                while (rs.next())
                {
                    if (!rs.isFirst())
                    {
                        indexedColumns = indexedColumns + "," + rs.getString("COLUMN_NAME");
                    } else
                    {
                        indexedColumns = indexedColumns + rs.getString("COLUMN_NAME");
                    }
                }
                result = result + template + indexName + " ON " + tableName + "(" + indexedColumns + ");\n";
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * Method that takes a string and turns its spaces into underscores.
     *
     * @param text the text with spaces that needs underscores
     * @return String, text with underscores instead of spaces
     */
    private String makeSpacesIntoUnderscores(String text)
    {
        String tmp = text.substring(0, text.indexOf(" "));
        String tmp2 = text.substring(text.indexOf(" ")+1);
        if (tmp2.contains(" "))
        {
            tmp2 = makeSpacesIntoUnderscores(tmp2);
        }
        text = tmp + "_" + tmp2;
        //System.out.println(text);
        return text;
    }

    /**
     * Method for putting a string in double quotes, because I can't type double quotes in a string for some reason
     *
     * @param text the text to be put in double quotes
     * @return String, the text given now in double quotes
     */
    private String putInDoubleQuotes(String text)
    {
        return '"' + text + '"';
    }

    /**
     * Method for putting a string in single quotes for completeness and cleanliness
     *
     * @param text text to be put in single quotes
     * @return String, the text in single quotes
     */
    private String putInSingleQuotes(String text)
    {
        return "'" + text + "'";
    }

    /**
     * Method for doubling up single quotes, escaping a single quote that may exist in a string and preventing it
     * messing up my formatting.
     * Recursive
     *
     * @param text text that contains a single quote
     * @return String, text given with all contained single quotes being doubled up
     */
    private String doubleUpSingleQuotes(String text)
    {
        String tmp = text.substring(0, text.indexOf("'"));
        String tmp2 = text.substring(text.indexOf("'")+1);
        if (tmp2.contains("'"))
        {
            tmp2 = doubleUpSingleQuotes(tmp2);
        }
        text = tmp + "''" + tmp2;
        //System.out.println(text);
        return text;
    }
}