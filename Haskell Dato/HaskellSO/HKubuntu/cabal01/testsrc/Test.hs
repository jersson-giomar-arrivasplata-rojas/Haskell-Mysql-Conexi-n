import Control.Monad
import Database.HDBC
import Database.HDBC.MySQL
main = do conn <- connectMySQL defaultMySQLConnectInfo {
                       mysqlHost     = "127.0.0.1",
                       mysqlDatabase = "test",
                       mysqlUser     = "root",
                       mysqlPassword = ""
                    }

          rows <- quickQuery' conn "SELECT * FROM usuario where nombre='jersson'"[] -- "SELECT 1 + 3" []
          forM_ rows $ \row -> putStrLn $ show row