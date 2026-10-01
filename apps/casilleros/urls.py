from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import EstadoCasilleroViewSet, CasilleroViewSet, TipoMovimientoViewSet, TipoPeriodoViewSet, PeriodoEscolarViewSet, AsignacionCasilleroViewSet

router = DefaultRouter()
router.register(r'estados-casillero', EstadoCasilleroViewSet)
router.register(r'casilleros', CasilleroViewSet)
router.register(r'tipos-movimiento', TipoMovimientoViewSet)
router.register(r'tipos-periodo', TipoPeriodoViewSet)
router.register(r'periodos-escolares', PeriodoEscolarViewSet)
router.register(r'asignaciones', AsignacionCasilleroViewSet)

urlpatterns = [
    path('', include(router.urls)),
]