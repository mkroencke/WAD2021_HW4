const express = require('express');
const pool = require('./database'); 
 
const app = express(); 
 
app.set('view engine', 'ejs');
 
app.listen(3000);

app.get('/', async(req, res) => {
    try {
        const posts = await pool.query(
            "SELECT * FROM posts ORDER BY datetime DESC"
        );
        res.render('posts', { posts: posts.rows });
    } catch (err) {
        console.error(err.message);
    }
});
 
app.use((req, res) => { 
    res.status(404).render('404');
});