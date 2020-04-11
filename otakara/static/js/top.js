$(function(){
    // 問題文用
    var allHidden = $('.btn-invisible'),
    allButton = $('.btn-outline-light'),
    // モーダル用
    innerHintWindow = $('.new-inner-Hint'),
    innerAnsWindow = $('.new-inner-Ans'),
    innerWindow = $('.new-inner-window'),
    windowDecideBtn = $('.new-inner-decide'),
    windowSpan = $('.new-inner-text span'),
    windowArea = '', // 表示中の地域
    windowFunc = '', // 表示中の機能 Ans or Hint
    windowSelectedAns = '', // 表示中に選択している回答
    // 進捗管理
    numAreaQuiz = {'forest':0, 'wasteland':0, 'plateau':0, 'valley':0, 'crystal':0, 'frozen':0}, // 0スタート、数値はクリアした問題数;
    numMaxAreaQuiz = {'forest':1,'wasteland':2,'plateau':3,'valley':3, 'crystal':3, 'frozen':2}, // 全問正解に必要な問題数;
    strArea = ['forest', 'wasteland', 'plateau', 'valley', 'crystal', 'frozen'];

    // ページ読み込み時、localStrageからクリア状況を読み取り反映
    $(window).on('load', function(){
        if(isLocalStorageAvlbl() == true){
            strArea.forEach(area => {
                if(localStorage.getItem(area) != null){
                    numAreaQuiz[area] = parseInt(localStorage.getItem(area));
                    console.log(numAreaQuiz);
                }
                if(numAreaQuiz[area] == numMaxAreaQuiz[area]){
                    showPerfect(area);
                }else if(numAreaQuiz[area] != 0){
                    console.log(area+' is not 0')
                    showSuccess(area);
                }
            });
        }
        console.log(numAreaQuiz);
    });

    // 問題文表示中に画面リサイズすると縦横幅が変わらない不具合に対応
    $(window).resize(function(){
        adjust();
    });

    function adjust(){
        allHidden.css('width', 'auto');
        allHidden.css('height', 'auto');
    }

    // エリアごとのボタンをクリックするとそのエリアの問題文を表示する
    allButton.on('click', function(){
        onAreaClicked($(this), $('#'+$(this).attr('name')+'Hidden'));
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

    //show-windowクラスでモーダルを開く
    $('.show-window').on('click',function(){
        windowArea = $(this).attr('area');
        windowFunc = $(this).attr('func');
        if(windowFunc == 'Hint'){
            // ヒント内容切り替え用関数
            showHintOf(windowArea);
            innerHintWindow.fadeIn();
        }else if(windowFunc == 'Ans'){
            // 回答画面内容切り替え用関数
            showAnsOf(windowArea);
            innerAnsWindow.fadeIn();
        }
    });

    // ヒント表示時のウィンドウ内容切り替え
    function showHintOf(area){
        windowSpan.text('HintOf'+area);
        if(area == 'forest'){
            $('.new-inner-div').html('<p>森のヒント</p>');
        } else {
            $('.new-inner-div').html('<p>荒地のヒント</p>');
        }
    }

    // 回答表示時のウィンドウ内容切り替え
    function showAnsOf(area){
        windowSpan.text('AnsOf'+area);
        console.log(numAreaQuiz);
    }

    // 回答選択肢ボタンをクリックした時
    $('.ansbtn').on('click',function(){
        windowSelectedAns = $(this).text();
        console.log(windowSelectedAns);
        $('.ansbtn').removeClass('ansbtn-selected');
        $(this).addClass('ansbtn-selected');
        windowDecideBtn.removeClass('btn-outline-secondary');
        windowDecideBtn.addClass('btn-danger');
    });

    // 回答決定ボタンをクリックした時
    windowDecideBtn.on('click',function(){
        console.log(windowSelectedAns);
        if(windowSelectedAns == 'success'){
            $('.new-inner-Success').fadeIn();
            pushedSuccess();
        }else{
            $('.new-inner-Failed').fadeIn();
        }
    });

    // 正解を選んだ際にセッション追加
    function pushedSuccess(){
        if(windowArea != ''){
            // 進捗管理をインクリメント
            numAreaQuiz[windowArea] = numAreaQuiz[windowArea]+1;
            
            // localSessionが利用可能なら進捗保存
            if (isLocalStorageAvlbl() == true){
                /// localStorageに対応済み
                localStorage.setItem(windowArea, numAreaQuiz[windowArea]);
            }else{
                /// localStorageには未対応
                console.error('cannot use localStorage');
            }

            // 進捗の値=最大値ならperfect処理
            // そうでなければsuccess処理
            if(numAreaQuiz[windowArea] == numMaxAreaQuiz[windowArea]){
                showPerfect(windowArea);
            }else{
                showSuccess(windowArea);
            }
            console.log(numAreaQuiz);
        }else{
            console.error('windowArea is none');
        }
    };

    // 全問正解時処理
    function showPerfect(area){
        $('#'+area+'Btn').text('▷');
        $('#'+area+'Hidden').hide('fast', function(){
            $('.'+area+' .mark-success').show('fast');
            $('.'+area+' .perfect').show('fast');
            $('.'+area+' .show-window').hide('fast');
        });
    };

    // 途中正解時処理
    function showSuccess(area){
        //全問正解してたら処理飛ばす
        if(numAreaQuiz[area] == numMaxAreaQuiz[area]){
            console.log('success but perfect');
            showPerfect();
            return;
        }
        if(numAreaQuiz[area] != 0){
            $('#'+area+'-'+numAreaQuiz[area]+' > .mark-success').show('fast');
            var tmp = numAreaQuiz[area] + 1;
            $('#'+area+'-'+tmp).show('fast');
            adjust();
        }
    }

    //回答を選び直すボタン
    $('.new-inner-return').on('click',function(){
        $('.new-inner-Failed').fadeOut();
    });

    //CLOSEをクリックでモーダルを閉じる
    $('.new-inner-close').on('click',function(){
        closeInner();
    });
    
    //モーダルの周りをクリックで閉じる
    $('.new-inner-overlay').on('click',function(){
        closeInner();
    });

    // new-innerを閉じる際の挙動
    function closeInner(){
        innerWindow.fadeOut();
        $('.ansbtn-selected').removeClass('ansbtn-selected');
        $('.new-inner-decide').removeClass('btn-danger');
        $('.new-inner-decide').addClass('btn-outline-secondary');
    }
    
    //りせっとぼたん
    $('.btn-reset').on('click',function(){
        console.log('reset');
        numAreaQuiz = {'forest':0, 'wasteland':0, 'plateau':0, 'valley':0, 'crystal':0, 'frozen':0};
        if(isLocalStorageAvlbl() == true){
            localStorage.removeItem('forest');
            localStorage.removeItem('wasteland');
        }
        $('.mark-success').hide('fast');
        $('.perfect').hide('fast');
        $('.show-window').show('fast');
        adjust();
    });
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