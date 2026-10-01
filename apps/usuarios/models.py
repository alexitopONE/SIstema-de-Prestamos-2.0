from django.db import models

class Administrador(models.Model):
    codigo = models.AutoField(primary_key=True)
    usuario = models.CharField(unique=True, max_length=50)
    password = models.CharField(max_length=255)
    nombre = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=150, blank=True, null=True)
    estatus = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'administrador'

class Carreras(models.Model):
    num = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=60)
    siglas = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'carreras'

class Rol(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rol'

class Usuarios(models.Model):
    codigo = models.AutoField(primary_key=True)
    identificacion = models.CharField(unique=True, max_length=50)
    nombre = models.CharField(max_length=100)
    apellido_paterno = models.CharField(max_length=100)
    apellido_materno = models.CharField(max_length=100, blank=True, null=True)
    email = models.CharField(unique=True, max_length=150, blank=True, null=True)
    estatus = models.CharField(max_length=50)
    codigo_barras = models.CharField(unique=True, max_length=100, blank=True, null=True)
    rol = models.ForeignKey(Rol, models.DO_NOTHING, db_column='rol')
    carreras = models.ForeignKey(Carreras, models.DO_NOTHING, db_column='carreras', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuarios'

class UsuariosMensajes(models.Model):
    usuarios = models.OneToOneField(Usuarios, models.DO_NOTHING, db_column='usuarios', primary_key=True)
    mensajes = models.ForeignKey('prestamos.Mensajes', models.DO_NOTHING, db_column='mensajes')

    class Meta:
        managed = False
        db_table = 'usuarios_mensajes'
        unique_together = (('usuarios', 'mensajes'),)