package utils

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	"github.com/AdityaMayukhSom/go-book-management-system/pkg/models"
)

func ParseBody(r *http.Request, book *models.Book) {
	if body, err := io.ReadAll(r.Body); err == nil {
		err := json.Unmarshal([]byte(body), book)
		if err == nil {
			return
		} else {
			fmt.Println(err)
		}
	}
}
