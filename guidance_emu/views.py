from django.shortcuts import render

def toppen(request):
    return render(request, 'guidance_emu/top.html', {})