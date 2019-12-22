# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class GuidanceArea(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    level = models.IntegerField()
    kind = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'guidance_area'


class Monsters(models.Model):
    name = models.CharField(max_length=50)
    isveteran = models.BooleanField(db_column='isVeteran')  # Field name made lowercase.
    material_name = models.CharField(max_length=50)
    isalchemize = models.BooleanField(db_column='isAlchemize')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'monsters'


class ReferenceCustomRareMonsters(models.Model):
    rare = models.ForeignKey('WeaponsRare', models.DO_NOTHING)
    custom = models.ForeignKey('WeaponsCustom', models.DO_NOTHING)
    monster = models.ForeignKey(Monsters, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'reference_custom_rare_monsters'
        unique_together = (('rare', 'custom', 'monster'),)


class ReferenceMonstersArea(models.Model):
    monsters = models.ForeignKey(Monsters, models.DO_NOTHING)
    area = models.ForeignKey(GuidanceArea, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'reference_monsters_area'
        unique_together = (('monsters', 'area'),)


class ReferencePartsWepnameMonsters(models.Model):
    wepname = models.ForeignKey('WeaponsName', models.DO_NOTHING, blank=True, null=True)
    partseffect = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, blank=True, null=True)
    monster = models.ForeignKey(Monsters, models.DO_NOTHING, blank=True, null=True)
    name = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reference_parts_wepname_monsters'
        unique_together = (('wepname', 'partseffect'),)


class ReferenceUpgradeMaterials(models.Model):
    id_upgrade = models.ForeignKey('WeaponsUpgrade', models.DO_NOTHING, db_column='id_upgrade', blank=True, null=True)
    id_monsters = models.ForeignKey(Monsters, models.DO_NOTHING, db_column='id_monsters', blank=True, null=True)
    id_rare = models.ForeignKey('WeaponsRare', models.DO_NOTHING, db_column='id_rare', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reference_upgrade_materials'
        unique_together = (('id_upgrade', 'id_monsters', 'id_rare'),)


class ReferenceWeaponsFrame(models.Model):
    id_rare = models.ForeignKey('WeaponsRare', models.DO_NOTHING, db_column='id_rare')
    id_upgrade = models.ForeignKey('WeaponsUpgrade', models.DO_NOTHING, db_column='id_upgrade')
    frame_nums = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'reference_weapons_frame'
        unique_together = (('id_rare', 'id_upgrade'),)


class WeaponsCustom(models.Model):
    name = models.CharField(max_length=50)
    grade = models.IntegerField()
    effect = models.CharField(max_length=50)
    frame_num = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'weapons_custom'


class WeaponsName(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'weapons_name'


class WeaponsPartsEffect(models.Model):
    level = models.IntegerField()
    effect = models.CharField(max_length=50)

    def __str__(self):
        return self.effect

    class Meta:
        managed = False
        db_table = 'weapons_parts_effect'


class WeaponsRare(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'weapons_rare'


class WeaponsUpgrade(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'weapons_upgrade'