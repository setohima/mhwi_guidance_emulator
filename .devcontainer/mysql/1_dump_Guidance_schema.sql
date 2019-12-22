--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

SET CHARSET UTF8;

--
-- Name: Guidance; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA IF NOT EXISTS `Guidance` DEFAULT CHARACTER SET utf8;

--
-- Name: guidance_area; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.guidance_area (
    id integer NOT NULL,
    name varchar(30) NOT NULL,
    level integer NOT NULL,
    kind integer NOT NULL
);

--
-- Name: monsters; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.monsters (
    id integer NOT NULL,
    name varchar(60)  NOT NULL,
    isVeteran tinyint(1) NOT NULL,
    material_name varchar(30)  NOT NULL,
    isAlchemize tinyint(1) DEFAULT false NOT NULL
);

--
-- Name: reference_custom_rare_monsters; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.reference_custom_rare_monsters (
    rare_id integer NOT NULL,
    custom_id integer NOT NULL,
    monster_id integer NOT NULL,
    mate_num integer DEFAULT 0 NOT NULL
);


--
-- Name: reference_monsters_area; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.reference_monsters_area (
    monsters_id integer NOT NULL,
    area_id integer NOT NULL
);


--
-- Name: reference_parts_wepname_monsters; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.reference_parts_wepname_monsters (
    wepname_id integer,
    partseffect_id integer,
    monster_id integer,
    name varchar(30) ,
    mate_num integer DEFAULT 0 NOT NULL
);


--
-- Name: reference_upgrade_materials; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.reference_upgrade_materials (
    id_upgrade integer,
    id_monsters integer,
    id_rare integer,
    mate_num integer DEFAULT 0 NOT NULL
);


--
-- Name: reference_weapons_frame; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.reference_weapons_frame (
    id_rare integer NOT NULL,
    id_upgrade integer NOT NULL,
    frame_nums integer NOT NULL
);


--
-- Name: weapons_custom; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.weapons_custom (
    id integer NOT NULL,
    name varchar(30)  NOT NULL,
    grade integer NOT NULL,
    effect varchar(30)  NOT NULL,
    frame_num integer DEFAULT 0 NOT NULL
);


--
-- Name: weapons_rare; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.weapons_rare (
    id integer NOT NULL,
    name varchar(30)  NOT NULL
);

--
-- Name: weapons_upgrade; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.weapons_upgrade (
    id integer NOT NULL,
    name varchar(30) 
);


CREATE TABLE IF NOT EXISTS Guidance.weapons_name (
    id integer NOT NULL,
    name varchar(30)  NOT NULL
);


--
-- Name: weapons_parts_effect; Type: TABLE; Schema: Guidance; Owner: -
--

CREATE TABLE IF NOT EXISTS Guidance.weapons_parts_effect (
    id integer NOT NULL,
    level integer NOT NULL,
    effect varchar(30)  NOT NULL
);


--
-- Name: monsters monsters_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (id);


--
-- Name: weapons_custom weapons_custom_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.weapons_custom
    ADD CONSTRAINT weapons_custom_pkey PRIMARY KEY (id);


--
-- Name: weapons_upgrade weapons_frame_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.weapons_upgrade
    ADD CONSTRAINT weapons_frame_pkey PRIMARY KEY (id);


--
-- Name: weapons_parts_effect weapons_parts_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.weapons_parts_effect
    ADD CONSTRAINT weapons_parts_pkey PRIMARY KEY (id);


--
-- Name: weapons_name wepons_name_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.weapons_name
    ADD CONSTRAINT wepons_name_pkey PRIMARY KEY (id);


--
-- Name: weapons_rare wepons_rare_pkey; Type: CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.weapons_rare
    ADD CONSTRAINT wepons_rare_pkey PRIMARY KEY (id);


--
-- Name: id_pkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX id_pkey USING btree ON Guidance.guidance_area (id);


--
-- Name: rare_custom_pkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX rare_custom_pkey USING btree ON Guidance.reference_custom_rare_monsters (rare_id, custom_id, monster_id);


--
-- Name: ref_monsters_area_pkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX ref_monsters_area_pkey USING btree ON Guidance.reference_monsters_area (monsters_id, area_id);


--
-- Name: ref_upg_mat_pkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX ref_upg_mat_pkey USING btree ON Guidance.reference_upgrade_materials (id_upgrade, id_monsters, id_rare);


--
-- Name: ref_wep_frame_pkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX ref_wep_frame_pkey USING btree ON Guidance.reference_weapons_frame (id_rare, id_upgrade);


--
-- Name: ref_wepname_parts_pnkey; Type: INDEX; Schema: Guidance; Owner: -
--

CREATE UNIQUE INDEX ref_wepname_parts_pnkey USING btree ON Guidance.reference_parts_wepname_monsters (wepname_id, partseffect_id);

--
-- Name: reference_custom_rare_monsters reference_custom_rare_monsters_custom_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_custom_id_fkey FOREIGN KEY (custom_id) REFERENCES Guidance.weapons_custom(id);


--
-- Name: reference_custom_rare_monsters reference_custom_rare_monsters_monster_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_monster_id_fkey FOREIGN KEY (monster_id) REFERENCES Guidance.monsters(id);


--
-- Name: reference_custom_rare_monsters reference_custom_rare_monsters_rare_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_rare_id_fkey FOREIGN KEY (rare_id) REFERENCES Guidance.weapons_rare(id);


--
-- Name: reference_monsters_area reference_monsters_area_area_id_fkey1; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_monsters_area
    ADD CONSTRAINT reference_monsters_area_area_id_fkey1 FOREIGN KEY (area_id) REFERENCES Guidance.guidance_area(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: reference_monsters_area reference_monsters_area_monsters_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_monsters_area
    ADD CONSTRAINT reference_monsters_area_monsters_id_fkey FOREIGN KEY (monsters_id) REFERENCES Guidance.monsters(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: reference_parts_wepname_monsters reference_parts_wepname_monsters_monster_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_monster_id_fkey FOREIGN KEY (monster_id) REFERENCES Guidance.monsters(id);


--
-- Name: reference_parts_wepname_monsters reference_parts_wepname_monsters_parts_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_parts_id_fkey FOREIGN KEY (partseffect_id) REFERENCES Guidance.weapons_parts_effect(id);


--
-- Name: reference_parts_wepname_monsters reference_parts_wepname_monsters_wepname_id_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_wepname_id_fkey FOREIGN KEY (wepname_id) REFERENCES Guidance.weapons_name(id);


--
-- Name: reference_upgrade_materials reference_upgrade_materials_id_monsters_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_monsters_fkey FOREIGN KEY (id_monsters) REFERENCES Guidance.monsters(id);


--
-- Name: reference_upgrade_materials reference_upgrade_materials_id_rare_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_rare_fkey FOREIGN KEY (id_rare) REFERENCES Guidance.weapons_rare(id);


--
-- Name: reference_upgrade_materials reference_upgrade_materials_id_upgrade_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_upgrade_fkey FOREIGN KEY (id_upgrade) REFERENCES Guidance.weapons_upgrade(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: reference_weapons_frame reference_weapons_frame_id_rare_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_weapons_frame
    ADD CONSTRAINT reference_weapons_frame_id_rare_fkey FOREIGN KEY (id_rare) REFERENCES Guidance.weapons_rare(id);


--
-- Name: reference_weapons_frame reference_weapons_frame_id_upgrade_fkey; Type: FK CONSTRAINT; Schema: Guidance; Owner: -
--

ALTER TABLE Guidance.reference_weapons_frame
    ADD CONSTRAINT reference_weapons_frame_id_upgrade_fkey FOREIGN KEY (id_upgrade) REFERENCES Guidance.weapons_upgrade(id);


--
-- PostgreSQL database dump complete
--

