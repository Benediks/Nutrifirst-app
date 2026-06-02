--
-- PostgreSQL database dump
--

\restrict wrZvnHcq9ip0g9qsslgVF0dunVFkughMYDo1cwMGeIeUSEha0VdGaSdLnmMbprR

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Prediction; Type: TABLE; Schema: public; Owner: nutrifirst_app
--

CREATE TABLE public."Prediction" (
    id text NOT NULL,
    "userId" text NOT NULL,
    ingredient text NOT NULL,
    "priceRange" text NOT NULL,
    "menuName" text NOT NULL,
    "menuImage" text NOT NULL,
    skor double precision NOT NULL,
    kategori text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Prediction" OWNER TO nutrifirst_app;

--
-- Name: User; Type: TABLE; Schema: public; Owner: nutrifirst_app
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO nutrifirst_app;

--
-- Data for Name: Prediction; Type: TABLE DATA; Schema: public; Owner: nutrifirst_app
--

COPY public."Prediction" (id, "userId", ingredient, "priceRange", "menuName", "menuImage", skor, kategori, "createdAt") FROM stdin;
cmpjw4tkg0003ifj46n5iv1jl	cmpjve1it0001ifcwg5qwb6yd	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-24 14:46:38.511
cmpjw5c450005ifj4311op1ea	cmpjve1it0001ifcwg5qwb6yd	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-24 14:47:02.548
cmpjw63ni0007ifj4h2onhgv4	cmpjve1it0001ifcwg5qwb6yd	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-24 14:47:38.238
cmpjw7pet0009ifj4d2uehk1e	cmpjve1it0001ifcwg5qwb6yd	Telur	16000 - 20000	Telur Bebek dadar	https://cdn0-production-images-kly.akamaized.net/1WivGEoDIspEllYaxZHrpqkjEYQ=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2468104/original/014966900_1543254943-resep-dadar-telur-bebek-sayur-enak-dan-tidak-amis.jpg	35.93	2. Kurang Layak	2026-05-24 14:48:53.008
cmpjw7yyj000bifj4li8dj1rb	cmpjve1it0001ifcwg5qwb6yd	Telur	<= 10000	Telur Terubuk	https://lovepeaceveggiefood.files.wordpress.com/2020/09/screenshot_2020-09-18-19-57-07-39.jpg	58.25	3. Layak	2026-05-24 14:49:05.467
cmpjw8zdq000difj4zvzfmj82	cmpjve1it0001ifcwg5qwb6yd	Ayam	16000 - 20000	Ayam  goreng Kentuckysayap	https://img-global.cpcdn.com/recipes/2ecb088a495ef73a/680x482cq70/ayam-goreng-kentucky-foto-resep-utama.jpg	46.16	2. Kurang Layak	2026-05-24 14:49:52.67
cmpjw9b4k000fifj4mymqanl8	cmpjve1it0001ifcwg5qwb6yd	Telur	16000 - 20000	Telur Bebek dadar	https://cdn0-production-images-kly.akamaized.net/1WivGEoDIspEllYaxZHrpqkjEYQ=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2468104/original/014966900_1543254943-resep-dadar-telur-bebek-sayur-enak-dan-tidak-amis.jpg	35.93	2. Kurang Layak	2026-05-24 14:50:07.891
cmpjw9enr000hifj4qewvjasm	cmpjve1it0001ifcwg5qwb6yd	Telur	<= 10000	Telur Terubuk	https://lovepeaceveggiefood.files.wordpress.com/2020/09/screenshot_2020-09-18-19-57-07-39.jpg	58.25	3. Layak	2026-05-24 14:50:12.472
cmpjwabhf000jifj47x3zx5jv	cmpjve1it0001ifcwg5qwb6yd	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-24 14:50:55.011
cmpjwaek7000lifj43cpqakjv	cmpjve1it0001ifcwg5qwb6yd	Sapi	>= 25000	Sapi paru dendeng mentah	https://img-global.cpcdn.com/recipes/e709be83be77515c/680x482cq70/dendeng-paru-kering-foto-resep-utama.jpg	59.03	3. Layak	2026-05-24 14:50:59
cmpjwazge000nifj4x3ryuy0e	cmpjve1it0001ifcwg5qwb6yd	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-24 14:51:26.078
cmpjwbkcm000pifj4amra8w1b	cmpjve1it0001ifcwg5qwb6yd	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-24 14:51:53.157
cmpjwbys7000rifj4mvlfrtck	cmpjve1it0001ifcwg5qwb6yd	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-24 14:52:11.862
cmpjwc68t000tifj4cye49zxb	cmpjve1it0001ifcwg5qwb6yd	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-24 14:52:21.532
cmpjwd21u000vifj4ilcjh2ww	cmpjve1it0001ifcwg5qwb6yd	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-24 14:53:02.753
cmpjwdcce000xifj46a3tn9da	cmpjve1it0001ifcwg5qwb6yd	Ayam	16000 - 20000	Ayam  goreng Kentuckysayap	https://img-global.cpcdn.com/recipes/2ecb088a495ef73a/680x482cq70/ayam-goreng-kentucky-foto-resep-utama.jpg	46.16	2. Kurang Layak	2026-05-24 14:53:16.094
cmpjwdq7i000zifj4d4hgzt03	cmpjve1it0001ifcwg5qwb6yd	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-24 14:53:34.062
cmpjwdst40011ifj4u6ei9jd2	cmpjve1it0001ifcwg5qwb6yd	Telur	11000 - 15000	Kacang Telur 	https://img-global.cpcdn.com/recipes/18de1fa4c4094900/400x400cq70/photo.jpg	70.62	3. Layak	2026-05-24 14:53:37.433
cmpjwfid50013ifj4dqnw3787	cmpjve1it0001ifcwg5qwb6yd	Telur	16000 - 20000	Telur Bebek dadar	https://cdn0-production-images-kly.akamaized.net/1WivGEoDIspEllYaxZHrpqkjEYQ=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2468104/original/014966900_1543254943-resep-dadar-telur-bebek-sayur-enak-dan-tidak-amis.jpg	35.93	2. Kurang Layak	2026-05-24 14:54:57.132
cmpjwfjm20015ifj4rg95outv	cmpjve1it0001ifcwg5qwb6yd	Telur	16000 - 20000	Telur Bebek dadar	https://cdn0-production-images-kly.akamaized.net/1WivGEoDIspEllYaxZHrpqkjEYQ=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2468104/original/014966900_1543254943-resep-dadar-telur-bebek-sayur-enak-dan-tidak-amis.jpg	35.93	2. Kurang Layak	2026-05-24 14:54:58.826
cmpjwflo10017ifj42jbxs011	cmpjve1it0001ifcwg5qwb6yd	Telur	<= 10000	Telur Terubuk	https://lovepeaceveggiefood.files.wordpress.com/2020/09/screenshot_2020-09-18-19-57-07-39.jpg	58.25	3. Layak	2026-05-24 14:55:01.49
cmpjwii7p0019ifj4zlp2zod2	cmpjve1it0001ifcwg5qwb6yd	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-24 14:57:16.981
cmpjwjc3t001bifj4sarp69f4	cmpjve1it0001ifcwg5qwb6yd	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-24 14:57:55.721
cmpjwq1eb001difj445wbs5gp	cmpjve1it0001ifcwg5qwb6yd	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-24 15:03:08.366
cmpjwzf5o001gifj4r4hw2kez	cmpjwz7av001eifj4y83uc3by	Ayam	16000 - 20000	Ayam  goreng Kentuckysayap	https://img-global.cpcdn.com/recipes/2ecb088a495ef73a/680x482cq70/ayam-goreng-kentucky-foto-resep-utama.jpg	46.16	2. Kurang Layak	2026-05-24 15:10:26.173
cmpjxbu5m001iifj4j8s0o8wy	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-24 15:20:05.417
cmpnog9gk0001ifvkgsutqmgg	cmpjwz7av001eifj4y83uc3by	Ayam	16000 - 20000	Ayam  goreng Kentuckysayap	https://img-global.cpcdn.com/recipes/2ecb088a495ef73a/680x482cq70/ayam-goreng-kentucky-foto-resep-utama.jpg	46.16	2. Kurang Layak	2026-05-27 06:22:40.046
cmpnp9qsn0003ifvkr6xts7af	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-27 06:45:35.553
cmpnpxpa90001ifgsac03rvog	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-27 07:04:13.378
cmpnpyh7o0003ifgsrdqf8gdd	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-27 07:04:49.573
cmpnrp18t0001if3o2u5fv8jg	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-27 07:53:28.201
cmpnzqkao0001if14cfnhsf9x	cmpjwz7av001eifj4y83uc3by	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-27 11:38:36.477
cmpnzruco0003if14xexi5322	cmpjwz7av001eifj4y83uc3by	Sapi	>= 25000	Sapi paru dendeng mentah	https://img-global.cpcdn.com/recipes/e709be83be77515c/680x482cq70/dendeng-paru-kering-foto-resep-utama.jpg	59.03	3. Layak	2026-05-27 11:39:36.168
cmpo1pzk60005if14kt5k2qo4	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-27 12:34:08.838
cmpo1qlhf0007if148m1sh7xl	cmpjwz7av001eifj4y83uc3by	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-27 12:34:37.25
cmpo316ck0001iflsyhtyn7lv	cmpjwz7av001eifj4y83uc3by	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-27 13:10:50.464
cmpp4av340001if6wwn2u0pul	cmpjwz7av001eifj4y83uc3by	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-28 06:34:08.203
cmpqqncmv0002if28k2jat9c3	cmpqqn6jj0000if28v9i8zy52	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-29 09:47:28.566
cmpqqnjkw0004if28xxm4zw22	cmpqqn6jj0000if28v9i8zy52	Sapi	21000 - 25000	Dendeng Daging Sapi	https://awsimages.detik.net.id/community/media/visual/2022/02/20/resep-dendeng-sapi-medan_43.jpeg?w=700&q=90	64.61	3. Layak	2026-05-29 09:47:37.568
cmpqqnoab0006if284fjlicxx	cmpqqn6jj0000if28v9i8zy52	Telur	16000 - 20000	Telur Bebek dadar	https://cdn0-production-images-kly.akamaized.net/1WivGEoDIspEllYaxZHrpqkjEYQ=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2468104/original/014966900_1543254943-resep-dadar-telur-bebek-sayur-enak-dan-tidak-amis.jpg	35.93	2. Kurang Layak	2026-05-29 09:47:43.667
cmpqqprmq0008if28svlfpvi9	cmpjwz7av001eifj4y83uc3by	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-29 09:49:21.314
cmpqqpvak000aif281ue7i80k	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-29 09:49:26.06
cmpqqpzpt000cif28y2zj3iof	cmpjwz7av001eifj4y83uc3by	Telur	11000 - 15000	Kacang Telur 	https://img-global.cpcdn.com/recipes/18de1fa4c4094900/400x400cq70/photo.jpg	70.62	3. Layak	2026-05-29 09:49:31.793
cmpr1z7g40001ifto848qgyas	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-29 15:04:37.49
cmpr4qtqh0004ifto2m7rm0z5	cmpjwz7av001eifj4y83uc3by	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-29 16:22:05.28
cmptioy0z0001ifcgsxk0fxf7	cmpr39l120002iftoti0t1b0n	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-05-31 08:28:04.544
cmptip5nn0003ifcg2xer9ai5	cmpr39l120002iftoti0t1b0n	Ayam	11000 - 15000	Ayam usus goreng	https://img-global.cpcdn.com/recipes/fa7c9443ce9efcb5/1200x630cq70/photo.jpg	68.4	3. Layak	2026-05-31 08:28:14.435
cmpux3d1q0001if58cr9duaeu	cmpuw400f0000iffk05vtutzw	Sapi	16000 - 20000	Sapi daging sosis (Worst)	https://images.tokopedia.net/img/cache/700/product-1/2020/7/3/1982472/1982472_d7e37ee9-0836-4eb7-9d26-fe0b1f602bd3_300_300	43.27	2. Kurang Layak	2026-06-01 07:58:57.996
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: nutrifirst_app
--

COPY public."User" (id, email, password, name, "createdAt", "updatedAt") FROM stdin;
cmpjve1it0001ifcwg5qwb6yd	User1@gmail.com	$2b$10$wv.H7.PhqHn/k7FYDw3G1uBR4MpHrvCoOYzfuTZ8KM2QHOReFWsym	User1	2026-05-24 14:25:49.11	2026-05-24 14:25:49.11
cmpjwz7av001eifj4y83uc3by	jose@gmail.com	$2b$10$66wy3IdAyGqzSBqwjlWrnubZV08e/5haD8eztqDbgaFmrm5zmKiy6	jose	2026-05-24 15:10:15.991	2026-05-24 15:10:15.991
cmpqqn6jj0000if28v9i8zy52	pascal@gmail.com	$2b$10$Q0RNo6SL9MDTzQHBx1Me0uX3LI1pL.uhDO041a7RFFI7G/vebAtvi	Pascal	2026-05-29 09:47:20.671	2026-05-29 09:47:20.671
cmpr39l120002iftoti0t1b0n	johnsmith@gmail.com	$2b$10$IBcsbHbxnccdtjGny6TKWuzUr11wRVB/BbFcXUvOOe0gQK.G9LJxa	John smith	2026-05-29 15:40:41.27	2026-05-29 15:40:41.27
cmpuw400f0000iffk05vtutzw	johndoe@gmail.com	$2b$10$AESFjweh0StIwQz0mahyX.FMnVbdSPCp/EeTjrze2iuzmbgJ10/wy	john doe	2026-06-01 07:31:28.143	2026-06-01 07:31:28.143
\.


--
-- Name: Prediction Prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: nutrifirst_app
--

ALTER TABLE ONLY public."Prediction"
    ADD CONSTRAINT "Prediction_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: nutrifirst_app
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Prediction_userId_createdAt_idx; Type: INDEX; Schema: public; Owner: nutrifirst_app
--

CREATE INDEX "Prediction_userId_createdAt_idx" ON public."Prediction" USING btree ("userId", "createdAt");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: nutrifirst_app
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Prediction Prediction_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nutrifirst_app
--

ALTER TABLE ONLY public."Prediction"
    ADD CONSTRAINT "Prediction_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO nutrifirst_app;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,USAGE ON SEQUENCES  TO nutrifirst_app;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO nutrifirst_app;


--
-- PostgreSQL database dump complete
--

\unrestrict wrZvnHcq9ip0g9qsslgVF0dunVFkughMYDo1cwMGeIeUSEha0VdGaSdLnmMbprR

