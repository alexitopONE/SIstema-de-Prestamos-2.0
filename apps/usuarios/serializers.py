from rest_framework import serializers
from .models import Administrador, Carreras, Rol, Usuarios, UsuariosMensajes

class AdministradorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Administrador
        fields = '__all__'

class CarrerasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Carreras
        fields = '__all__'

class RolSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = '__all__'

class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields = '__all__'

class UsuariosMensajesSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuariosMensajes
        fields = '__all__'