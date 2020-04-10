$(function(){
    // 問題文用
    var allHidden = $('.btn-invisible'),
    allButton = $('.btn-outline-light'),
    forestBtn = $('#forestBtn'),
    forestHidden = $('#forestHidden'),
    successBtn = $('.new-inner-success'),
    // モーダル用
    innerHintWindow = $('.new-inner-Hint'),
    innerAnsWindow = $('.new-inner-Ans'),
    innerWindow = $('.new-inner-window'),
    windowSpan = $('.new-inner-text span');

    // ページ読み込み時、localStrageからクリア状況を読み取り反映
    $(window).on('load', function(){
        if(isLocalStorageAvlbl() == true){
            if(localStorage.getItem('forest') == '1'){
                showPerfect();
            }
        }
    });

    // エリアごとのボタンをクリックするとそのエリアの問題文を表示する
    allButton.on('click', function(){
        onAreaClicked($(this), $('#'+$(this).attr('name')+'Hidden'));
    });

    // 問題文表示中に画面リサイズすると縦横幅が変わらない不具合に対応
    $(window).resize(function(){
        allHidden.css('width', 'auto');
        allHidden.css('height', 'auto');
    });

    // 問題文表示用ボタンクリック時の挙動
    function onAreaClicked(btn, hidden){
        if(hidden.css('display')=='none'){
            allButton.text('▷');
            btn.text('×');
            allHidden.hide('fast', function(){
                hidden.show('normal');
            });
            hidden.stop(false, false);
        }else{
            btn.text('▷');
            hidden.hide('fast');
        }
    };

    // デバッグ用：successをクリックで森セッション追加
    successBtn.on('click',function(){
        if (isLocalStorageAvlbl() == true){
            /// localStorageに対応済み
            localStorage.setItem('forest', '1');
        }else{
            /// localStorageには未対応
            console.error('cannot use localStorage');
        }
        showPerfect();
    });

    // 森にパーフェクトマークを表示
    function showPerfect(){
        forestBtn.text('▷');
        forestHidden.hide('fast', function(){
            $('.forest .perfect').show('fast');
        });
    };

    //show-windowクラスでモーダルを開く
    $('.show-window').on('click',function(){
        var area = $(this).attr('area');
        var func = $(this).attr('func');
        if(func == 'Hint'){
            // ヒント内容切り替え用関数
            showHintOf(area);
            innerHintWindow.fadeIn();
        }else if(func == 'Ans'){
            // 回答画面内容切り替え用関数
            showAnsOf(area);
            innerAnsWindow.fadeIn();
        }
    });

    //CLOSEをクリックでモーダルを閉じる
    $('.new-inner-close').on('click',function(){
        innerWindow.fadeOut();
    });
    
    //モーダルの周りをクリックで閉じる
    $('.new-inner-overlay').on('click',function(){
        innerWindow.fadeOut();
    });

    function showHintOf(area){
        windowSpan.text('HintOf'+area);
        if(area == 'forest'){
            $('.new-inner-div').html('<p>森のヒント</p>');
        } else {
            $('.new-inner-div').html('<p>荒地のヒント</p>');
        }
    }

    function showAnsOf(area){
        windowSpan.text('AnsOf'+area);
    }
});

// localStrageが利用できるかどうかを判別
function isLocalStorageAvlbl(){
    if (typeof localStorage !== 'undefined') {
        try {
            localStorage.setItem('dummy', '1');
            if (localStorage.getItem('dummy') === '1') {
                localStorage.removeItem('dummy');
                return true;
            } else {
                return false;
            }
        } catch(e) {
            return false;
        }
    } else {
        return false;
    }
}