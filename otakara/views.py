from django.shortcuts import render

def top(request):
    return render(request, 'otakara/top.html', {})

def sw(request):
    return render(request, 'sw.js')