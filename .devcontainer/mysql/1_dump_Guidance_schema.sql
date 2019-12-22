SET CHARSET UTF8;

--CREATE SCHEMA IF NOT EXISTS `setohima$Guidance` DEFAULT CHARACTER SET utf8;

ALTER DATABASE setohima$Guidance CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS setohima$Guidance.Guidance_area (
    id integer NOT NULL,
    name varchar(30) NOT NULL,
    level integer NOT NULL,
    kind integer NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.monsters (
    id integer NOT NULL,
    name varchar(60)  NOT NULL,
    isVeteran tinyint(1) NOT NULL,
    material_name varchar(30)  NOT NULL,
    isAlchemize tinyint(1) DEFAULT false NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.reference_custom_rare_monsters (
    rare_id integer NOT NULL,
    custom_id integer NOT NULL,
    monster_id integer NOT NULL,
    mate_num integer DEFAULT 0 NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.reference_monsters_area (
    monsters_id integer NOT NULL,
    area_id integer NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.reference_parts_wepname_monsters (
    wepname_id integer,
    partseffect_id integer,
    monster_id integer,
    name varchar(30) ,
    mate_num integer DEFAULT 0 NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.reference_upgrade_materials (
    id_upgrade integer,
    id_monsters integer,
    id_rare integer,
    mate_num integer DEFAULT 0 NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.reference_weapons_frame (
    id_rare integer NOT NULL,
    id_upgrade integer NOT NULL,
    frame_nums integer NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.weapons_custom (
    id integer NOT NULL,
    name varchar(30)  NOT NULL,
    grade integer NOT NULL,
    effect varchar(30)  NOT NULL,
    frame_num integer DEFAULT 0 NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.weapons_rare (
    id integer NOT NULL,
    name varchar(30)  NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.weapons_upgrade (
    id integer NOT NULL,
    name varchar(30) 
) DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS setohima$Guidance.weapons_name (
    id integer NOT NULL,
    name varchar(30)  NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS setohima$Guidance.weapons_parts_effect (
    id integer NOT NULL,
    level integer NOT NULL,
    effect varchar(30)  NOT NULL
) DEFAULT CHARSET=utf8;

ALTER TABLE setohima$Guidance.monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (id);

ALTER TABLE setohima$Guidance.weapons_custom
    ADD CONSTRAINT weapons_custom_pkey PRIMARY KEY (id);

ALTER TABLE setohima$Guidance.weapons_upgrade
    ADD CONSTRAINT weapons_frame_pkey PRIMARY KEY (id);

ALTER TABLE setohima$Guidance.weapons_parts_effect
    ADD CONSTRAINT weapons_parts_pkey PRIMARY KEY (id);

ALTER TABLE setohima$Guidance.weapons_name
    ADD CONSTRAINT wepons_name_pkey PRIMARY KEY (id);

ALTER TABLE setohima$Guidance.weapons_rare
    ADD CONSTRAINT wepons_rare_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX id_pkey USING btree ON setohima$Guidance.Guidance_area (id);

CREATE UNIQUE INDEX rare_custom_pkey USING btree ON setohima$Guidance.reference_custom_rare_monsters (rare_id, custom_id, monster_id);

CREATE UNIQUE INDEX ref_monsters_area_pkey USING btree ON setohima$Guidance.reference_monsters_area (monsters_id, area_id);

CREATE UNIQUE INDEX ref_upg_mat_pkey USING btree ON setohima$Guidance.reference_upgrade_materials (id_upgrade, id_monsters, id_rare);

CREATE UNIQUE INDEX ref_wep_frame_pkey USING btree ON setohima$Guidance.reference_weapons_frame (id_rare, id_upgrade);

CREATE UNIQUE INDEX ref_wepname_parts_pnkey USING btree ON setohima$Guidance.reference_parts_wepname_monsters (wepname_id, partseffect_id);

ALTER TABLE setohima$Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_custom_id_fkey FOREIGN KEY (custom_id) REFERENCES setohima$Guidance.weapons_custom(id);

ALTER TABLE setohima$Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_monster_id_fkey FOREIGN KEY (monster_id) REFERENCES setohima$Guidance.monsters(id);

ALTER TABLE setohima$Guidance.reference_custom_rare_monsters
    ADD CONSTRAINT reference_custom_rare_monsters_rare_id_fkey FOREIGN KEY (rare_id) REFERENCES setohima$Guidance.weapons_rare(id);

ALTER TABLE setohima$Guidance.reference_monsters_area
    ADD CONSTRAINT reference_monsters_area_area_id_fkey1 FOREIGN KEY (area_id) REFERENCES setohima$Guidance.Guidance_area(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE setohima$Guidance.reference_monsters_area
    ADD CONSTRAINT reference_monsters_area_monsters_id_fkey FOREIGN KEY (monsters_id) REFERENCES setohima$Guidance.monsters(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE setohima$Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_monster_id_fkey FOREIGN KEY (monster_id) REFERENCES setohima$Guidance.monsters(id);

ALTER TABLE setohima$Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_parts_id_fkey FOREIGN KEY (partseffect_id) REFERENCES setohima$Guidance.weapons_parts_effect(id);

ALTER TABLE setohima$Guidance.reference_parts_wepname_monsters
    ADD CONSTRAINT reference_parts_wepname_monsters_wepname_id_fkey FOREIGN KEY (wepname_id) REFERENCES setohima$Guidance.weapons_name(id);

ALTER TABLE setohima$Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_monsters_fkey FOREIGN KEY (id_monsters) REFERENCES setohima$Guidance.monsters(id);

ALTER TABLE setohima$Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_rare_fkey FOREIGN KEY (id_rare) REFERENCES setohima$Guidance.weapons_rare(id);

ALTER TABLE setohima$Guidance.reference_upgrade_materials
    ADD CONSTRAINT reference_upgrade_materials_id_upgrade_fkey FOREIGN KEY (id_upgrade) REFERENCES setohima$Guidance.weapons_upgrade(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE setohima$Guidance.reference_weapons_frame
    ADD CONSTRAINT reference_weapons_frame_id_rare_fkey FOREIGN KEY (id_rare) REFERENCES setohima$Guidance.weapons_rare(id);

ALTER TABLE setohima$Guidance.reference_weapons_frame
    ADD CONSTRAINT reference_weapons_frame_id_upgrade_fkey FOREIGN KEY (id_upgrade) REFERENCES setohima$Guidance.weapons_upgrade(id);
