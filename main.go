/*
package main

import (

	"fmt"
	"io"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	// "github.com/robfig/cron"

)

// router
func main() {

	go RunCron()
	initiateGin()

}

//cron job

// func Runcron() {
// 	c := cron.New()

// 	c.AddFunc("@very 3s", sentMessage)

// 	c.Start()

// }

	func initiateGin() {
		r := gin.Default()

		r.GET("/sent", SenHelloMessage)
		r.Run(":8080")
	}

// controller

	func SenHelloMessage(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "hello"})
	}

	func RunCron() {
		ticker := time.NewTicker(3 * time.Second) // Har 3 second me chalega
		defer ticker.Stop()

		for range ticker.C {
			sentMessage()
		}
	}

	func sentMessage() {
		resp, err := http.Get("http://localhost:8080/sent")

		if err != nil {
			fmt.Println("error from cron", err)
		}
		defer resp.Body.Close()

		body, err := io.ReadAll(resp.Body)
		if err != nil {
			fmt.Println("error from from read all in cron", err)
		}

		fmt.Println(string(body))
	}
*/
package main

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

const (
	dbUser     = "root"
	dbPassword = "root"
	dbName     = "croneJOBS"
	dbHost     = "localhost"
)

func main() {
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s", dbUser, dbPassword, dbHost, dbName)
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal("Error connecting to database:", err)
	}
	defer db.Close()

	ticker := time.NewTicker(3 * time.Second) // Har 3 second me chalega
	defer ticker.Stop()

	log.Println("Ticker started, moving data every 3 seconds...")

	for range ticker.C {
		moveData(db)
	}
}

func moveData(db *sql.DB) {
	log.Println("Moving data from source_table to destination_table...")

	tx, err := db.Begin()
	if err != nil {
		log.Println("Transaction begin error:", err)
		return
	}

	insertQuery := `INSERT INTO destination_table (name, age) SELECT name, age FROM source_table`
	_, err = tx.Exec(insertQuery)
	if err != nil {
		tx.Rollback()
		log.Println("Error inserting data:", err)
		return
	}

	deleteQuery := `DELETE FROM source_table`
	_, err = tx.Exec(deleteQuery)
	if err != nil {
		tx.Rollback()
		log.Println("Error deleting data:", err)
		return
	}

	err = tx.Commit()
	if err != nil {
		log.Println("Transaction commit error:", err)
	} else {
		log.Println("Data moved successfully!")
	}
}
