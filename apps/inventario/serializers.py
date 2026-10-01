from rest_framework import serializers
from .models import EstadoEquipo, Marca, Modelo, TipoEquipo, Equipo

class EstadoEquipoSerializer(serializers.ModelSerializer):
    class Meta:
        model = EstadoEquipo
        fields = '__all__'

class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

class ModeloSerializer(serializers.ModelSerializer):
    class Meta:
        model = Modelo
        fields = '__all__'

class TipoEquipoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoEquipo
        fields = '__all__'

class EquipoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipo
        fields = '__all__'