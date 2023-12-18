from django.views.generic import TemplateView


def about_view(request):
    print("about_view")
    return TemplateView.as_view(template_name="about.html")(request)
