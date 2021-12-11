const express = require('express');
const pool = require('./database');
const bodyParser = require('body-parser');
  
const app = express();

app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/res'));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

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

app.post('/posts', async(req, res) => {
    try {
        payload = req.body;
        await pool.query(
            "INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES ($1, $2, $3, $4, $5);", 
            [payload.title, payload.body, payload.picurl, 0, new Date()] 
        );
        const posts = await pool.query(
            "SELECT * FROM posts ORDER BY datetime DESC"
        );
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.write(JSON.stringify({ 
            status: "OK"
        }));
        res.end();
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
        if (post.rows.length !== 0) {
            res.render('singlepost', { post: post.rows[0] });
        } else{
            res.status(404).render('404');
        }
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

app.delete('/singlepost/:id', async(req, res) => {
    try {
        const id = req.params.id;
        await pool.query(
            "DELETE FROM posts WHERE id = $1", [id]
        );
        const posts = await pool.query(
            "SELECT * FROM posts ORDER BY datetime DESC"
        );
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.write(JSON.stringify({
            status: "OK"
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