-- Active: 1706513222872@@127.0.0.1@6969
-- remove any existing database if that database exists
DROP DATABASE IF EXISTS commonplace;

CREATE DATABASE IF NOT EXISTS commonplace;

USE commonplace;

DROP TABLE IF EXISTS Articles;

DROP TABLE IF EXISTS Authors;

CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(15) NOT NULL,
    MiddleName VARCHAR(15),
    LastName VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PRIMARY KEY (AuthorID)
);

INSERT INTO
    Authors (FirstName, MiddleName, LastName, Email)
VALUES
    (
        'Hazari',
        'Prasad',
        'Dwivedi',
        'hazari.prasad.dwivedi@gmail.com'
    ),
    (
        'Chetan',
        NULL,
        'Bhagat',
        'chetan.bhagat@gmail.com'
    ),
    (
        'Jhumpa',
        NULL,
        ' Lahiri',
        'jhumpa.lahiri@yahoo.com'
    );

CREATE TABLE IF NOT EXISTS Articles (
    AuthorID INT NOT NULL,
    ArticleName VARCHAR(100) NOT NULL,
    Content TEXT NOT NULL,
    PublishedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ModifiedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (AuthorID) REFERENCES Authors (AuthorID),
    PRIMARY KEY (AuthorID, ArticleName)
);

-- Inserting more data into Articles table with realistic content
-- Modified INSERT statements for the updated schema
INSERT INTO
    Articles (AuthorID, ArticleName, Content)
VALUES
    (
        1,
        "Inspiration from Indian Heritage",
        "India, with its diverse cultural heritage, has always been a source of inspiration for writers and poets. In this article, we explore the rich tapestry of Indian art and literature, delving into the centuries-old traditions that continue to shape the country\'s creative landscape."
    ),
    (
        2,
        'Colors of Holi',
        'The vibrant colors of Holi, the festival of colors, echo the spirit of unity and joy in Indian communities. Join us as we unravel the significance of Holi and its cultural impact, celebrating the diversity that defines the heart of India.'
    ),
    (
        3,
        'Culinary Journey through India',
        'From the bustling streets of Mumbai to the serene landscapes of Kerala, Indian cuisine is a journey through flavors and spices. In this culinary exploration, we dive into the regional delicacies that make Indian food a global sensation, enticing the taste buds with every bite.'
    ),
    (
        1,
        'Timeless Tales of Indian Mythology',
        'The timeless tales of Indian mythology have captivated audiences for centuries. Join me on a journey through the epics of Ramayana and Mahabharata, discovering the moral lessons and cultural values embedded in these ancient narratives.'
    ),
    (
        2,
        "Exploring Classical Dance Forms",
        "Exploring the roots of classical dance forms in India, we uncover the grace and storytelling inherent in Bharatanatyam, Kathak, and Odissi. These dance forms not only express artistic beauty but also carry the legacy of centuries-old traditions."
    ),
    (
        3,
        "India\'s Struggle for Independence",
        "India\'s struggle for independence was a pivotal moment in history. In this article, we delve into the lives of iconic freedom fighters like Mahatma Gandhi and Netaji Subhas Chandra Bose, examining their contributions to the nation\'s quest for freedom."
    );