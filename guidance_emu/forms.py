from django import forms
from .models import WeaponsCustom, WeaponsName, WeaponsRare, WeaponsUpgrade, ReferencePartsWepnameMonsters

class NameForm(forms.Form):
    name = forms.ChoiceField(
        label='武器種',
        required=True,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'name',
        })
    )

class CustomForm(forms.Form):
    rare = forms.ChoiceField(
        label='武器レア度',
        required=True,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'rare',
        })
    )

    upgrade = forms.ChoiceField(
        label='カスタム枠拡張',
        required=True,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'upg',
        })
    )

    attack = forms.ChoiceField(
        label='攻撃力強化',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'att',
        })
    )

    crit = forms.ChoiceField(
        label='会心率強化',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'crit',
        })
    )

    block = forms.ChoiceField(
        label='防御力強化',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'block',
        })
    )

    cure = forms.ChoiceField(
        label='回復能力付与',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'cure',
        })
    )

    attribute = forms.ChoiceField(
        label='属性・状態異常強化',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'att',
        })
    )


class PartsForm(forms.Form):
    part1 = forms.ChoiceField(
        label='強化パーツ1',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect1',
        })
    )

    part2 = forms.ChoiceField(
        label='強化パーツ2',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect2',
        })
    )

    part3 = forms.ChoiceField(
        label='強化パーツ3',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect3',
        })
    )

    part4 = forms.ChoiceField(
        label='強化パーツ4',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect4',
        })
    )

    part5 = forms.ChoiceField(
        label='強化パーツ5',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect5',
        })
    )

    part6 = forms.ChoiceField(
        label='強化パーツ6',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect6',
        })
    )

    part7 = forms.ChoiceField(
        label='強化パーツ7',
        required=False,
        disabled=False,
        widget=forms.Select(attrs={
            'id': 'effect7',
        })
    )
