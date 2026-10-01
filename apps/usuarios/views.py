from rest_framework import viewsets
from .models import Administrador, Carreras, Rol, Usuarios, UsuariosMensajes
from .serializers import AdministradorSerializer, CarrerasSerializer, RolSerializer, UsuariosSerializer, UsuariosMensajesSerializer

class AdministradorViewSet(viewsets.ModelViewSet):
    queryset = Administrador.objects.all()
    serializer_class = AdministradorSerializer

class CarrerasViewSet(viewsets.ModelViewSet):
    queryset = Carreras.objects.all()
    serializer_class = CarrerasSerializer

class RolViewSet(viewsets.ModelViewSet):
    queryset = Rol.objects.all()
    serializer_class = RolSerializer

class UsuariosViewSet(viewsets.ModelViewSet):
    queryset = Usuarios.objects.all()
    serializer_class = UsuariosSerializer

class UsuariosMensajesViewSet(viewsets.ModelViewSet):
    queryset = UsuariosMensajes.objects.all()
    serializer_class = UsuariosMensajesSerializer