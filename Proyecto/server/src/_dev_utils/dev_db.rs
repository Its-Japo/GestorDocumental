use std::{fs, time::Duration};

use sqlx::{postgres::PgPoolOptions, Pool, Postgres};
use tracing::info;

type Db = Pool<Postgres>;


const PG_DEV_POSTGRES_URL: &str = "postgres://postgres:root@db:54328/postgres";
const PG_DEV_APP_URL: &str = "postgres://app_user:dev_password@db:54328/gestor_documental";

// SQL Files
const SQL_RECREATE_DB: &str = "sql/dev_initial/00-recreate-db.sql";
const SQL_DIR: &str = "sql/dev_initial";

async fn pexec(db: &Db, file: &str) -> Result<(), sqlx::Error> {
    info!("{:<12} - pexec: {file}","FOR-DEV-ONLY");

    let content = fs::read_to_string(file)?;

    // FIXME:
    let sqls: Vec<&str> = content.split(';').collect();

    for sql in sqls {
        if sql.is_empty() {
            continue;
        }
        sqlx::query(sql).execute(db);
    }

    todo!() 
}

async fn new_db_pool(db_con_url: &str) -> Result<Db, sqlx::Error> {
    PgPoolOptions::new()
    .max_connections(1)
    .acquire_timeout(Duration::from_millis(500))
    .connect(db_con_url)
    .await
}