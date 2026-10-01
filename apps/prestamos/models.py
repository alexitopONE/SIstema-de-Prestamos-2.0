from django.db import models

class Estatus(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'estatus'

class Prestamo(models.Model):
    num = models.AutoField(primary_key=True)
    folio = models.CharField(unique=True, max_length=50)
    credencial = models.IntegerField()
    fecha_inicio = models.DateTimeField()
    fecha_final = models.DateTimeField(blank=True, null=True)
    comentarios = models.TextField(blank=True, null=True)
    usuarios = models.ForeignKey('usuarios.Usuarios', models.DO_NOTHING, db_column='usuarios')
    estatus = models.ForeignKey(Estatus, models.DO_NOTHING, db_column='estatus')
    sanciones = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'prestamo'

class EquipoPrestamo(models.Model):
    prestamo = models.OneToOneField(Prestamo, models.DO_NOTHING, db_column='prestamo', primary_key=True)
    equipo = models.ForeignKey('inventario.Equipo', models.DO_NOTHING, db_column='equipo')

    class Meta:
        managed = False
        db_table = 'equipo_prestamo'
        unique_together = (('prestamo', 'equipo'),)

class Mensajes(models.Model):
    codigo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)
    prestamo = models.ForeignKey(Prestamo, models.DO_NOTHING, db_column='prestamo')

    class Meta:
        managed = False
        db_table = 'mensajes'