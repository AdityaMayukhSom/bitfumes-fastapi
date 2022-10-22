package models

import (
	"github.com/AdityaMayukhSom/go-book-management-system/pkg/config"
	"github.com/jinzhu/gorm"
)

var db *gorm.DB

type Book struct {
	gorm.Model
	Name        string `gorm:"" json:"name"`
	Author      string `json:"author"`
	Publication string `json:"publication"`
}

func init() {
	config.Connect()
	db = config.GetDB()
	db.AutoMigrate(&Book{})
}

func CreateNewBook(b *Book) *Book {
	db.NewRecord(b)
	db.Create(&b)
	return b
}
func GetAllBooks() []Book {
	var Books []Book
	db.Find(&Books)
	return Books
}
func GetBookById(Id int64) (*Book, *gorm.DB) {
	var getBook Book
	db := db.Where("ID=?", Id).Find(&getBook)
	return &getBook, db
}
func DeleteBook(ID int64) Book {
	var book Book
	deletedBookRef, _ := GetBookById(ID)
	deletedBook := *deletedBookRef
	db.Where("ID=?", ID).Unscoped().Delete(book)
	return deletedBook
}

func UpdateBook(ID int64, newData Book) *Book {
	book, db := GetBookById(ID)
	if newData.Name != "" {
		book.Name = newData.Name
	}
	if newData.Author != "" {
		book.Author = newData.Author
	}
	if newData.Publication != "" {
		book.Publication = newData.Publication
	}
	db.Save(&book)
	return book
}
