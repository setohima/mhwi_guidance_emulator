# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils import timezone


class GuidanceArea(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    level = models.IntegerField()
    kind = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'guidance_area'


class GuidanceSendsearchLog(models.Model):
    id = models.BigAutoField(primary_key=True)
    weapons_name = models.ForeignKey('WeaponsName', models.DO_NOTHING, blank=True, null=True)
    weapons_parts_effect_id_1st = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_1st', related_name='weapons_parts_effect_id_1st', blank=True, null=True)
    weapons_parts_effect_id_2nd = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_2nd', related_name='weapons_parts_effect_id_2nd', blank=True, null=True)
    weapons_parts_effect_id_3rd = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_3rd', related_name='weapons_parts_effect_id_3rd', blank=True, null=True)
    weapons_parts_effect_id_4th = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_4th', related_name='weapons_parts_effect_id_4th', blank=True, null=True)
    weapons_parts_effect_id_5th = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_5th', related_name='weapons_parts_effect_id_5th', blank=True, null=True)
    weapons_parts_effect_id_6th = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_6th', related_name='weapons_parts_effect_id_6th', blank=True, null=True)
    weapons_parts_effect_id_7th = models.ForeignKey('WeaponsPartsEffect', models.DO_NOTHING, db_column='weapons_parts_effect_id_7th', related_name='weapons_parts_effect_id_7th', blank=True, null=True)
    weapons_rare = models.ForeignKey('WeaponsRare', models.DO_NOTHING, blank=True, null=True)
    weapons_upgrade = models.ForeignKey('WeaponsUpgrade', models.DO_NOTHING, blank=True, null=True)
    weapons_custom_id_atk = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_atk', related_name='weapons_custom_id_atk', blank=True, null=True)
    weapons_custom_id_crit = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_crit', related_name='weapons_custom_id_crit', blank=True, null=True)
    weapons_custom_id_block = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_block', related_name='weapons_custom_id_block', blank=True, null=True)
    weapons_custom_id_cure = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_cure', related_name='weapons_custom_id_cure',blank=True, null=True)
    weapons_custom_id_attr = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_attr', related_name='weapons_custom_id_attr',blank=True, null=True)
    weapons_custom_id_slot = models.ForeignKey('WeaponsCustom', models.DO_NOTHING, db_column='weapons_custom_id_slot', related_name='weapons_custom_id_slot',blank=True, null=True)
    user_id_address = models.CharField(max_length=255, blank=True, null=True)
    sendsearch_date = models.DateTimeField(blank=True, null=True, default=timezone.now)

    class Meta:
        managed = False
        db_table = 'guidance_sendsearch_log'


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
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    grade = models.IntegerField()
    effect = models.CharField(max_length=50)
    frame_num = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'weapons_custom'


class WeaponsName(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'weapons_name'


class WeaponsPartsEffect(models.Model):
    id = models.IntegerField(primary_key=True)
    level = models.IntegerField()
    effect = models.CharField(max_length=50)

    def __str__(self):
        return self.effect

    class Meta:
        managed = False
        db_table = 'weapons_parts_effect'


class WeaponsRare(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'weapons_rare'


class WeaponsUpgrade(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'weapons_upgrade'