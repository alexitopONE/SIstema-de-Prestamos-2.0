from rest_framework import serializers
from .models import Estatus, Prestamo, EquipoPrestamo, Mensajes

class EstatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estatus
        fields = '__all__'

class PrestamoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prestamo
        fields = '__all__'

class EquipoPrestamoSerializer(serializers.ModelSerializer):
    class Meta:
        model = EquipoPrestamo
        fields = '__all__'

class MensajesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mensajes
        fields = '__all__'