from django.db import connection

def getNeedNarutalMaterial(name, parts, rare, upgrade, custom):
    params = []

    params.append(str(rare))
    params.append(str(upgrade))
    for cus in custom:
        params.append(str(cus))
    params.append(str(rare))
    params.append(str(name))
    for part in parts:
        params.append(str(part))

    cursor = connection.cursor()

    try:
        cursor.execute(""" 
            SELECT matenum.id_natural id, 
                MAX(mat.`name`) name, 
                MAX(mat.obtain) obtain, 
                sum(matenum.mate_num) mate_num
            FROM (
                SELECT ref1.id_natural, ref1.mate_num
                FROM reference_upgrade_natural ref1
                WHERE ref1.id_natural > 0
                AND ref1.id_rare = %s
                AND ref1.id_upgrade <= %s
                UNION ALL
                SELECT ref2.natural_id AS id_natural, ref2.mate_num
                FROM reference_custom_natural ref2
                JOIN(
                    SELECT base.id
                    FROM weapons_custom AS base
                    JOIN (
                        SELECT id, name
                        FROM weapons_custom
                        WHERE id IN (%s,%s,%s,%s,%s,%s)
                    ) AS back
                    ON base.name = back.name AND base.id <= back.id
                ) AS reverseid
                ON ref2.custom_id = reverseid.id
                WHERE ref2.natural_id > 0
                AND ref2.rare_id = %s
                UNION ALL
                SELECT ref3.natural_id AS id_natural, ref3.mate_num
                FROM reference_parts_natural ref3
                WHERE ref3.natural_id > 0
                AND ref3.wepname_id = %s
                AND ref3.partseffect_id IN (%s,%s,%s,%s,%s,%s,%s)
            ) matenum
            JOIN natural_materials mat
            ON matenum.id_natural = mat.id
            GROUP BY id_natural
        """, params)
        row = dictfetchall(cursor)
    finally:
        cursor.close()
        connection.close()

    return row

def getNeedLevel(name, parts, rare, upgrade, custom):
    params = []
    
    for cus in custom:
        params.append(str(cus))

    params.append(str(rare))
    
    params.append(str(rare))
    params.append(str(upgrade))

    params.append(str(name))
    for part in parts:
        params.append(str(part))

    cursor = connection.cursor()

    try:
        cursor.execute("""
						SELECT sum_mate.id,
					sum_mate.kind,
					sum_mate.min,
					sum_mate.priority,
					TRUNCATE(SUM(sum_mate.mate_num), 0) AS mate_num,
					mate_name.name,
					mate_name.material_name,
					mate_name.isAlchemize
			FROM (
                SELECT res.id, 
                	GROUP_CONCAT(res.kind) AS kind, 
                	GROUP_CONCAT(res.min) AS min,
                	mobprior.priority, res.mate_num
                FROM (
                    SELECT
                        mob.id,
                        are.kind,
                        MIN(are.level) AS min,
                        AVG(ref1.mate_num) AS mate_num
                    FROM (((setohima$Guidance.reference_custom_rare_monsters ref1
                        JOIN setohima$Guidance.monsters mob ON ((ref1.monster_id = mob.id)))
                        JOIN setohima$Guidance.reference_monsters_area ref2 ON ((mob.id = ref2.monsters_id)))
                        JOIN setohima$Guidance.Guidance_area are ON ((ref2.area_id = are.id)))
                        JOIN(
                        	SELECT base.id
                        	FROM setohima$Guidance.weapons_custom AS base
                        	JOIN (
                        		SELECT id, name
                        		FROM setohima$Guidance.weapons_custom
                        		WHERE id IN (%s,%s,%s,%s,%s,%s)
                        	) AS back
                        	ON base.name = back.name AND base.id <= back.id
                        ) AS reverseid
                        ON ref1.custom_id = reverseid.id
                    WHERE ref1.rare_id = %s
                    group by mob.id, are.kind
                    UNION
                    select
                        mob.id,
                        area.kind,
                        MIN(area.level) AS min,
                        AVG(ref3.mate_num) AS mate_num
                    from setohima$Guidance.reference_upgrade_materials ref3
                        inner join setohima$Guidance.monsters mob
                        on ref3.id_monsters = mob.id
                        inner join setohima$Guidance.reference_monsters_area ref4
                        on mob.id = ref4.monsters_id
                        inner join setohima$Guidance.Guidance_area area
                        on ref4.area_id = area.id
                    where ref3.id_rare = %s and ref3.id_upgrade <= %s
                    group by mob.id, area.kind
                    UNION
                    select
                        mob.id,
                        area.kind,
                        MIN(area.level) AS min,
                        AVG(ref5.mate_num) AS mate_num
                    from setohima$Guidance.reference_parts_wepname_monsters ref5
                        inner join setohima$Guidance.monsters mob
                        on ref5.monster_id = mob.id
                        inner join setohima$Guidance.reference_monsters_area ref6
                        on mob.id = ref6.monsters_id
                        inner join setohima$Guidance.Guidance_area area
                        on ref6.area_id = area.id
                    where ref5.wepname_id = %s and ref5.partseffect_id IN (%s,%s,%s,%s,%s,%s,%s)
                    group by mob.id, area.kind
                    order by id, kind desc
                ) AS res
                inner join (
                    select monsters_id, COUNT(kind) AS priority
                    from (
                        select monsters_id, kind
                        from setohima$Guidance.reference_monsters_area refmob
                            inner join setohima$Guidance.Guidance_area area
                            on refmob.area_id = area.id
                        group by monsters_id, kind
                    ) AS mobtemp
                    group by monsters_id
                ) AS mobprior
                on res.id = mobprior.monsters_id
                group by id, priority, mate_num
            	order by priority, id, kind
            ) AS sum_mate
            JOIN setohima$Guidance.monsters AS mate_name
            on sum_mate.id = mate_name.id
            GROUP BY sum_mate.id, sum_mate.kind, sum_mate.min, sum_mate.priority,
            		mate_name.name, mate_name.material_name, mate_name.isAlchemize
            ORDER BY sum_mate.priority, sum_mate.id, sum_mate.kind
        """, params)
        row = dictfetchall(cursor)
    finally:
        cursor.close()
        connection.close()

    return row

def dictfetchall(cursor):
    #カーソルのすべての行を辞書として返す
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]