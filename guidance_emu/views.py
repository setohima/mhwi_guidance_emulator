from django.shortcuts import render
from .models import WeaponsCustom, WeaponsName, WeaponsRare, WeaponsPartsEffect, WeaponsUpgrade, GuidanceSendsearchLog
from .forms import NameForm, PartsForm, CustomForm
from .sqlconnect import getNeedLevel, getNeedNarutalMaterial
from .calculater import calcGuidanceLevel
from ipware import get_client_ip

def top(request):
    wepName = WeaponsName.objects.order_by('id')
    wepParts = WeaponsPartsEffect.objects.order_by('level','id')
    wepRare = WeaponsRare.objects.order_by('id')
    wepUpg = WeaponsUpgrade.objects.order_by('id')
    wepCus = WeaponsCustom.objects.order_by('id','grade')

    searchName = getNameForm(wepName)
    searchUpg = getPartsForm(wepParts)
    searchCustom = getCustomForm(wepRare, wepUpg, wepCus)

    if request.method == "POST":
        test1=request.POST["name"]
        test2=request.POST["part1"]
        test3=request.POST["rare"]
        test4=request.POST["upgrade"]
        test5=request.POST["attack"]
        GuidanceSendsearchLog(weapons_name=WeaponsName(id=request.POST["name"]),
                                weapons_parts_effect_id_1st=WeaponsPartsEffect(id=request.POST["part1"]),
                                weapons_parts_effect_id_2nd=WeaponsPartsEffect(id=request.POST["part2"]),
                                weapons_parts_effect_id_3rd=WeaponsPartsEffect(id=request.POST["part3"]),
                                weapons_parts_effect_id_4th=WeaponsPartsEffect(id=request.POST["part4"]),
                                weapons_parts_effect_id_5th=WeaponsPartsEffect(id=request.POST["part5"]),
                                weapons_parts_effect_id_6th=WeaponsPartsEffect(id=request.POST["part6"]),
                                weapons_parts_effect_id_7th=WeaponsPartsEffect(id=request.POST["part7"]),
                                weapons_rare=WeaponsRare(id=request.POST["rare"]),
                                weapons_upgrade=WeaponsUpgrade(id=request.POST["upgrade"]),
                                weapons_custom_id_atk=WeaponsCustom(id=request.POST["attack"]),
                                weapons_custom_id_crit=WeaponsCustom(id=request.POST["crit"]),
                                weapons_custom_id_block=WeaponsCustom(id=request.POST["block"]),
                                weapons_custom_id_cure=WeaponsCustom(id=request.POST["cure"]),
                                weapons_custom_id_attr=WeaponsCustom(id=request.POST["attribute"]),
                                weapons_custom_id_slot=WeaponsCustom(id=request.POST["slot"]),
                                user_id_address=get_client_ip(request),
                                ).save()
        # 必要な素材を持つモンスターの一覧を取得
        rows = getNeedLevel(request.POST["name"], (
                                request.POST["part1"],
                                request.POST["part2"],
                                request.POST["part3"],
                                request.POST["part4"],
                                request.POST["part5"],
                                request.POST["part6"],
                                request.POST["part7"],
                            ),
                            request.POST["rare"],
                            request.POST["upgrade"],(
                                request.POST["attack"],
                                request.POST["crit"],
                                request.POST["block"],
                                request.POST["cure"],
                                request.POST["attribute"],
                                request.POST["slot"],
                            ))
        # 必要なモンスターの一覧から必要導きレベルを取得
        resultLevel = calcGuidanceLevel(rows)
        naturalrows = getNeedNarutalMaterial(request.POST["name"], (
                                request.POST["part1"],
                                request.POST["part2"],
                                request.POST["part3"],
                                request.POST["part4"],
                                request.POST["part5"],
                                request.POST["part6"],
                                request.POST["part7"],
                            ),
                            request.POST["rare"],
                            request.POST["upgrade"],(
                                request.POST["attack"],
                                request.POST["crit"],
                                request.POST["block"],
                                request.POST["cure"],
                                request.POST["attribute"],
                                request.POST["slot"],
                            ))

        searchName.fields['name'].initial = request.POST['name']
        for i in [1,2,3,4,5,6,7]:
            tmp = 'part' + str(i)
            searchUpg.fields[tmp].initial = request.POST[tmp]
        searchCustom.fields['rare'].initial = request.POST['rare']
        searchCustom.fields['upgrade'].initial = request.POST['upgrade']
        searchCustom.fields['attack'].initial = request.POST['attack']
        searchCustom.fields['crit'].initial = request.POST['crit']
        searchCustom.fields['block'].initial = request.POST['block']
        searchCustom.fields['cure'].initial = request.POST['cure']
        searchCustom.fields['attribute'].initial = request.POST['attribute']
        searchCustom.fields['slot'].initial = request.POST['slot']

        return render(request, 'guidance_emu/top.html', {
                'searchName':searchName, 'searchUpg':searchUpg, 'searchRare': searchCustom, 'resultLevel':resultLevel, 'materialDict':rows, 'naturalDict':naturalrows
            })
    return render(request, 'guidance_emu/top.html', {'searchName':searchName, 'searchUpg':searchUpg, 'searchRare': searchCustom})

def help(request):
    return render(request, 'guidance_emu/help.html')

def privacypolicy(request):
    return render(request, 'guidance_emu/privacypolicy.html')

def sw(request):
    return render(request, 'sw.js')

def getNameForm(wepname):
    searchName = NameForm()
    nameChoice = []

    for name in wepname:
        nameChoice.append((name.id, name.name))
    searchName.fields['name'].choices = nameChoice
    return searchName

def getCustomForm(weprare, wepupg, wepcus):
    searchCustom = CustomForm()
    rareChoice = []
    upgChoice = []
    attackChoice = [('0','なし')]
    critChoice = [('0','なし')]
    blockChoice = [('0','なし')]
    cureChoice = [('0','なし')]
    attributeChoice = [('0','なし')]
    slotChoice = [('0','なし')]

    for rare in weprare:
        if rare.id == 1:
            rareChoice.append((rare.id, rare.name + ' (枠数：5/7/9/10)'))
        if rare.id == 2:
            rareChoice.append((rare.id, rare.name + ' (枠数：4/5/6/8)'))
        if rare.id == 3:
            rareChoice.append((rare.id, rare.name + ' (枠数：3/4/5/6)'))
    for upg in wepupg:
        upgChoice.append((upg.id, upg.name))
    for cus in wepcus:
        tmp = str(cus.grade) + ' (必要枠数：' + str(cus.frame_num) + ')'
        if cus.name == '攻撃力強化':
            attackChoice.append((cus.id, tmp ))
        if cus.name == '会心率強化':
            critChoice.append((cus.id, tmp))
        if cus.name == '防御力強化':
            blockChoice.append((cus.id, tmp))
        if cus.name == '回復能力付与':
            cureChoice.append((cus.id, tmp))
        if cus.name == '属性・状態異常強化':
            attributeChoice.append((cus.id, tmp))
        if cus.name == 'スロット強化':
            slotChoice.append((cus.id, tmp))
    
    searchCustom.fields['rare'].choices = rareChoice
    searchCustom.fields['upgrade'].choices = upgChoice
    searchCustom.fields['attack'].choices = attackChoice
    searchCustom.fields['crit'].choices = critChoice
    searchCustom.fields['block'].choices = blockChoice
    searchCustom.fields['cure'].choices = cureChoice
    searchCustom.fields['attribute'].choices = attributeChoice
    searchCustom.fields['slot'].choices = slotChoice
    return searchCustom

def getPartsForm(wepparts):
    searchUpgrade = PartsForm()
    upg1Choice = [('0', 'なし')]
    upg2Choice = [('0', 'なし')]
    upg3Choice = [('0', 'なし')]
    upg4Choice = [('0', 'なし')]
    upg5Choice = [('0', 'なし')]
    upg6Choice = [('0', 'なし')]
    upg7Choice = [('0', 'なし')]

    for part in wepparts:
        if part.level == 1:
            upg1Choice.append((part.id, part.effect))
        elif part.level == 2:
            upg2Choice.append((part.id, part.effect))
        elif part.level == 3:
            upg3Choice.append((part.id, part.effect))
        elif part.level == 4:
            upg4Choice.append((part.id, part.effect))
        elif part.level == 5:
            upg5Choice.append((part.id, part.effect))
        elif part.level == 6:
            upg6Choice.append((part.id, part.effect))
        elif part.level == 7:
            upg7Choice.append((part.id, part.effect))
    searchUpgrade.fields['part1'].choices = upg1Choice
    searchUpgrade.fields['part2'].choices = upg2Choice
    searchUpgrade.fields['part3'].choices = upg3Choice
    searchUpgrade.fields['part4'].choices = upg4Choice
    searchUpgrade.fields['part5'].choices = upg5Choice
    searchUpgrade.fields['part6'].choices = upg6Choice
    searchUpgrade.fields['part7'].choices = upg7Choice
    return searchUpgrade
