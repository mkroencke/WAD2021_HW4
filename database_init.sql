DROP DATABASE IF EXISTS wadhw; 

CREATE DATABASE wadhw TEMPLATE template0
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Europe.1252'
    LC_CTYPE = 'English_Europe.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS public.posts;

CREATE TABLE public.posts (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    body text NOT NULL,
    picurl text,
    likes integer NOT NULL DEFAULT 0,
    datetime timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

DELETE FROM public.posts;

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    '???', 
    'Which weighs more, a pound of feathers or a pound of bricks?', 
    null, 
    0,
    TIMESTAMP '2021-12-02 10:13:34'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Weather report', 
    'I think it is going to rain.', 
    'https://cdn.pixabay.com/photo/2021/05/29/20/20/hot-air-balloon-6294208_1280.jpg', 
    0,
    TIMESTAMP '2021-11-29 09:45:56'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Historic moments', 
    'That’s one small step for a man, a giant leap for mankind.', 
    'https://cdn.pixabay.com/photo/2012/10/10/11/05/space-station-60615_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-28 08:13:32'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Food', 
    'Lunchtime.', 
    'https://cdn.pixabay.com/photo/2017/09/28/18/22/tarte-flambee-2796419_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-27 13:02:12'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Literature', 
    'To thine own self, be true.', 
    null, 
    0,
    TIMESTAMP '2021-11-25 19:27:55'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Get rich now.', 
    'Bitcoin has hit a new record high after the launch of a new exchange-traded fund (ETF) linked to the cryptocurrency.', 
    'https://cdn.pixabay.com/photo/2017/01/25/12/31/bitcoin-2007769_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-25 14:15:14'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Popular quotes #4', 
    'Life is what happens to us while we are making other plans.', 
    null, 
    0,
    TIMESTAMP '2021-11-25 13:47:36'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Eternal space', 
    'Looking up to the stars tonight.', 
    'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg', 
    0,
    TIMESTAMP '2021-11-21 23:49:16'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Software development', 
    'It is not a bug — it is an undocumented feature.', 
    'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-19 17:46:58'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Work life', 
    'Working from home.', 
    'https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-18 07:42:16'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Popular quotes', 
    'You must be the change you wish to see in the world.', 
    null, 
    0,
    TIMESTAMP '2021-11-18 06:59:18'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Furry friend', 
    'Got a new friend today.', 
    'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-13 09:45:56'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Popular quotes #3', 
    'Die with memories, not dreams.', 
    null, 
    0,
    TIMESTAMP '2021-11-09 16:36:17'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Popular quotes #2', 
    'Without music, life would be a mistake.', 
    'https://cdn.pixabay.com/photo/2014/11/26/15/20/saxophone-546303_960_720.jpg', 
    0,
    TIMESTAMP '2021-11-09 12:16:33'
);

INSERT INTO public.posts(title, body, picurl, likes, datetime) VALUES (
    'Popular quotes #1', 
    'Three can keep a secret, if two of them are dead.', 
    null, 
    0,
    TIMESTAMP '2021-11-04 11:56:15'
);