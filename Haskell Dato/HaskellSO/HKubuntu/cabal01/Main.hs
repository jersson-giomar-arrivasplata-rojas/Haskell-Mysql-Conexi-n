import Control.Monad
import Database.HDBC
import Database.HDBC.MySQL
main = do conn <- connectMySQL defaultMySQLConnectInfo {
                       mysqlHost     = "db1.example.com",
                       mysqlUser     = "scott",
                       mysqlPassword = "tiger"
                    }

          rows <- quickQuery' conn "SELECT 1 + 1" []
          forM_ rows $ \row -> putStrLn $ show row