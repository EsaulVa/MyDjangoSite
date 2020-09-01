# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class BaseModel(models.Model):

    class Meta:
        abstract = True  # specify this model as an Abstract Model
        app_label='MyDjangoSite'

class Skippingdata(BaseModel):
    id_skip = models.IntegerField()
    index = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'SkippingData'
        app_label='MyDjangoSite'



class AuthGroup(BaseModel):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'
        app_label='MyDjangoSite'


class AuthGroupPermissions(BaseModel):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)
        app_label='MyDjangoSite'


class AuthPermission(BaseModel):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)


    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)
        app_label='MyDjangoSite'


class AuthUser(BaseModel):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'
        app_label='MyDjangoSite'


class AuthUserGroups(BaseModel):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)
        app_label='MyDjangoSite'


class AuthUserUserPermissions(BaseModel):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)
        app_label='MyDjangoSite'


class DataLog(BaseModel):
    year_construct = models.IntegerField()
    year_commiss = models.IntegerField()
    total_area = models.FloatField()
    total_area_resident = models.FloatField()
    total_area_none_resident = models.FloatField()
    total_count = models.IntegerField()
    count_resident = models.IntegerField()
    max_floors = models.IntegerField()
    min_floors = models.IntegerField()
    total_area_part = models.FloatField(blank=True, null=True)
    count_none_resident = models.IntegerField(blank=True, null=True)
    id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'data_log'
        app_label='MyDjangoSite'


class DataMain(BaseModel):
    street = models.CharField(max_length=256)
    year_construct = models.IntegerField()
    year_commiss = models.IntegerField()
    total_area = models.FloatField()
    total_area_resident = models.FloatField()
    total_area_none_resident = models.FloatField()
    total_count = models.IntegerField()
    count_resident = models.IntegerField()
    max_floors = models.IntegerField()
    min_floors = models.IntegerField()
    house = models.CharField(max_length=256, blank=True, null=True)
    cluster = models.CharField(max_length=256, blank=True, null=True)
    series = models.CharField(max_length=256, blank=True, null=True)
    total_area_part = models.FloatField(blank=True, null=True)
    label = models.IntegerField()
    status = models.IntegerField()
    count_none_resident = models.IntegerField(blank=True, null=True)
    id = models.IntegerField(primary_key=True)
    names_=['Улица','Дом','Класс данных','Серия','Год постройки','Год ввода в эксплуатацию',
            'Общая площадь','Общая площадь жилых помещений','Общая площадь нежилых помещений','Общая площадь помещений, входящих в состав общего имущества',
            'Общее количество помещений','Количество жилых помещений','Количество нежилых помещений',
            'Наибольшее количество этажей',	'Наименьшее количество этажей','Статус данных' ]

    class Meta:
        managed = False
        db_table = 'data_main'
        app_label='MyDjangoSite'



class DjangoAdminLog(BaseModel):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'
        app_label='MyDjangoSite'


class DjangoContentType(BaseModel):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)
        app_label='MyDjangoSite'


class DjangoMigrations(BaseModel):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'
        app_label='MyDjangoSite'


class DjangoSession(BaseModel):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
        app_label='MyDjangoSite'

class Neights(models.Model):
    id_neigh = models.IntegerField(blank=True, null=True)
    id_data = models.IntegerField(blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'neights'
