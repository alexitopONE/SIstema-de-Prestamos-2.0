from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AdministradorViewSet, CarrerasViewSet, RolViewSet, UsuariosViewSet, UsuariosMensajesViewSet

router = DefaultRouter()
router.register(r'administradores', AdministradorViewSet)
router.register(r'carreras', CarrerasViewSet)
router.register(r'roles', RolViewSet)
router.register(r'usuarios', UsuariosViewSet)
router.register(r'usuarios-mensajes', UsuariosMensajesViewSet)

urlpatterns = [
    path('', include(router.urls)),
]