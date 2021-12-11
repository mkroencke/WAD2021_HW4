const express = require('express');
const pool = require('./database'); 
 
const app = express(); 
 
app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/res'));
app.use(express.json());
 
app.listen(3000);

app.get('/', async(req, res) => {
    res.render('login');
});

app.get('/posts', async(req, res) => {
    try {
        const posts = await pool.query(
            "SELECT * FROM posts ORDER BY datetime DESC"
        );
        res.render('posts', { posts: posts.rows });
    } catch (err) {
        console.error(err.message);
    }
});

app.get('/singlepost/:id', async(req, res) => {
    try {
        const id = req.params.id;
        const post = await pool.query(
            "SELECT * FROM posts WHERE id = $1", [id]
        );
        res.render('singlepost', { post: post.rows[0] });
    } catch (err) {
        console.error(err.message);
    }
});

app.put('/posts/:id', async(req, res) => { 
    try { 
        const id = req.params.id;
        const likes = req.body.likes;
        await pool.query( 
            "UPDATE posts SET likes = $1 WHERE id = $2", [likes, id] 
        );
        const newlikes = await pool.query(
            "SELECT likes FROM posts WHERE id = $1", [id]
        );
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.write(JSON.stringify({ 
            status: "OK",
            id: req.params.id, 
            likes: newlikes.rows[0].likes
        }));
        res.end();
    } catch (err) { 
        console.error(err.message); 
    } 
});

app.get('/addnewpost', (req, res) => {
    res.render('addnewpost');
});
 
app.use((req, res) => { 
    res.status(404).render('404');
});