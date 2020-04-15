$(function(){
    // 問題文用
    var allHidden = $('.btn-invisible'),
    allButton = $('.btn-outline-light'),
    // モーダル用
    innerHintWindow = $('.new-inner-Hint'),
    innerAnsWindow = $('.new-inner-Ans'),
    innerChoiceWindow = $('.new-inner-Choice'),
    innerWindow = $('.new-inner-window'),
    windowDecideBtn = $('.new-inner-decide'),
    windowSpan = $('.new-inner-text span'),
    windowArea = '', // 表示中の地域
    windowFunc = '', // 表示中の機能 Ans or Hint
    windowSelectedAns = '', // 表示中に選択している回答
    // 進捗管理
    numAreaQuiz = {'forest':0, 'wasteland':0, 'plateau':0, 'valley':0, 'crystal':0, 'frozen':0}, // 0スタート、数値はクリアした問題数;
    numMaxAreaQuiz = {'forest':1,'wasteland':2,'plateau':3,'valley':3, 'crystal':2, 'frozen':2}, // 全問正解に必要な問題数;
    strAnsAreaQuiz = {
        'forest': ['A'],
        'wasteland':['A','A'],
        'plateau':['A','A','A'],
        'valley': ['A','A','A'],
        'crystal':['A','A'],
        'frozen':['A','A'],
    };
    strArea = ['forest', 'wasteland', 'plateau', 'valley', 'crystal', 'frozen'];

    // ページ読み込み時、localStrageからクリア状況を読み取り反映
    $(window).on('load', function(){
        if(isLocalStorageAvlbl() == true){
            strArea.forEach(area => {
                if(localStorage.getItem(area) != null){
                    numAreaQuiz[area] = parseInt(localStorage.getItem(area));
                }
                if(numAreaQuiz[area] == numMaxAreaQuiz[area]){
                    showPerfect(area);
                }else if(numAreaQuiz[area] != 0){
                    showSuccess(area);
                }
            });
        }
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
        }else if(windowFunc == 'Choice'){
            showChoiceOf(windowArea);
            innerChoiceWindow.fadeIn();
        }
    });

    // ヒント表示時のウィンドウ内容切り替え
    function showHintOf(area){
        windowSpan.text('ヒント');
        switch(area){
            case 'forest':
                $('.new-inner-div').html('<p>本編にも登場した「滝隠し洞窟」から、滝の水源を上流へと辿って行くと…？</p><img src="/static/image/forest-1-Hint.jpg" class="forest-1-hint image-hint" />');
                break;
            case 'wasteland':
                if(numAreaQuiz[area] == 0){
                    $('.new-inner-div').html('<p>キノコは他部族とのぶつぶつ交換に使う予定だった。シビれる旨さが病みつきなのだという。</p>');
                }else if(numAreaQuiz[area] == 1){
                    $('.new-inner-div').html('<p>「石頭の竜」は泥に潜って眠る…見たことがあるか？</p>');
                }
                break;
            case 'valley':
                if(numAreaQuiz[area] == 0){
                    $('.new-inner-div').html('<p>ドスギルオスの住処</p>');
                }else if(numAreaQuiz[area] == 1){
                    $('.new-inner-div').html('<p>ねぐらから東に出るのが「ひげの口」</p>');
                }else if(numAreaQuiz[area] == 2){
                    $('.new-inner-div').html('<p>「白しっぽ草」は本編にも登場したキーワードだ。</p>');
                }
                break;
            case 'plateau':
                if(numAreaQuiz[area] == 0){
                    $('.new-inner-div').html('<p>三又滑り台は真ん中の滑り台が一番低くて、両側の滑り台を潜り抜けて「蜜玉広場」に続くんだ。「切り傷注意の実」は十個くらい実がなってた。近くに「爆発注意の実」もあったよ。</p>');
                }else if(numAreaQuiz[area] == 1){
                    $('.new-inner-div').html('<p>「ゲコゲコ」は触ると危ない。眠くなるのとシビれて動けなくなるのがいる。ぶつかりそうだったのはシビれるほう。「パチパチの実」は赤くて、ちょっと叩くとすぐに地面に落ちてくる。</p>');
                }else if(numAreaQuiz[area] == 2){
                    $('.new-inner-div').html('<p>「空飛ぶ謎の家」はチョウサダンの船だって仲間が言ってたな。キネンヒンの近くには赤い実がなってる草と、ピカピカ虫もいたっけ。それと、ドデカピンク竜は毒を持ってるから気を付けること。</p>');
                }
                break;
            case 'crystal':
                if(numAreaQuiz[area] == 0){
                    $('.new-inner-div').html('<p>そこは知恵の神の地だ。</p>');
                }else if(numAreaQuiz[area] == 1){
                    $('.new-inner-div').html('<p>我々が名付けた「隠されし王の道」は、炎の龍が姿を現わす時にだけ開かれる。</p>');
                }
                break;
            case 'frozen':
                if(numAreaQuiz[area] == 0){
                    $('.new-inner-div').html('<p>獣纏族の大いなる挑戦……『氷の海の渦』に飛び込んで、『△壁画』のある入り江まで泳いで戻ってくる。挑戦の場から身を翻せば修練の場がある。修練の場の傍に『◎むくろの小口』あり。</p>');
                }else if(numAreaQuiz[area] == 1){
                    $('.new-inner-div').html('<p>『□道』はワレらの領域とチョウサダンの領域を絆ぐ幻の一本道。来た道戻ること叶わず。</p>');
                }
                break;
            default:
                $('.new-inner-div').html('<p>'+area+'のヒント</p>');
                break;
        }
    }

    // 回答表示時のウィンドウ内容切り替え
    function showAnsOf(area){
        windowSpan.text('オタカラの場所の画像を選んでください');
        shuffleImages(area);
    }

    // 回答画像の入れ替え
    function shuffleImages(area){
        var tmp = 'jpg'
        if(area=='wasteland'){
            tmp = 'png'
        }
        const tmpArray = ['A','B','C','D'];
        var shuffledArray = shuffle(tmpArray);
        var src1 = '/static/image/'+area+'-'+numAreaQuiz[area]+'-'+shuffledArray[0]+'.'+tmp,
            src2 = '/static/image/'+area+'-'+numAreaQuiz[area]+'-'+shuffledArray[1]+'.'+tmp,
            src3 = '/static/image/'+area+'-'+numAreaQuiz[area]+'-'+shuffledArray[2]+'.'+tmp,
            src4 = '/static/image/'+area+'-'+numAreaQuiz[area]+'-'+shuffledArray[3]+'.'+tmp;
        $('#ans1').attr('src',src1);
        $('#ans2').attr('src',src2);
        $('#ans3').attr('src',src3);
        $('#ans4').attr('src',src4);
    }

    // プルダウン型選択肢表示
    function showChoiceOf(area){
        if(area=='crystal'){
            if(numAreaQuiz[area]==0){
                $('.new-inner-Choice .new-inner-text').text('場所を示す単語の正しい組み合わせを選んでください');
            }else if(numAreaQuiz[area]==1){
                $('.new-inner-Choice .new-inner-text').text('あなたがたどり着いたのは');
                $('#choice1').empty();
                $('#choice1').append($('<option>').val('0').text('選択してください'));
                $('#choice1').append($('<option>').val('1').text('天井のある場所の'));
                $('#choice1').append($('<option>').val('2').text('天井のない場所の'));
                $('#choice2').empty();
                $('#choice2').append($('<option>').val('0').text('選択してください'));
                $('#choice2').append($('<option>').val('1').text('段差の上にある'));
                $('#choice2').append($('<option>').val('2').text('段差の下にある'));
                $('#choice2').append($('<option>').val('3').text('坂道にある'));
                $('#choice3').css('display','inline');
            }
        }
    }

    // 回答選択肢ボタンをクリックした時
    $('.ansimg').on('click', function(){
        windowSelectedAns = $(this).attr('src');
        $('.ansimg').removeClass('ansbtn-selected');
        $(this).addClass('ansbtn-selected');
        windowDecideBtn.removeClass('btn-outline-secondary');
        windowDecideBtn.addClass('btn-danger');
    });

    // 回答決定ボタンをクリックした時
    windowDecideBtn.on('click',function(){
        if(windowSelectedAns != ''){
            var tmp = 'jpg';
            if(windowArea=='wasteland'){
                tmp = 'png';
            }
            var tmpCollectAnswer = '/static/image/'+windowArea+'-'+numAreaQuiz[windowArea]+'-'+strAnsAreaQuiz[windowArea][numAreaQuiz[windowArea]]+'.'+tmp;
            if(windowSelectedAns == tmpCollectAnswer){
                $('.new-inner-Success').fadeIn();
                pushedSuccess();
            }else{
                $('.new-inner-Failed').fadeIn();
            }
        }
    });

    // プルダウン型選択肢の値が変わった時
    $('.new-inner-choicer').change(function(){
        if(windowArea=='crystal'){
            switch(numAreaQuiz[windowArea]){
                case 0:
                    if($('#choice1').val()!='0' && $('#choice2').val()!='0'){
                        $('.new-inner-ChoiceDec').removeClass('btn-outline-secondary');
                        $('.new-inner-ChoiceDec').addClass('btn-danger');
                    }else{
                        $('.new-inner-ChoiceDec').removeClass('btn-danger');
                        $('.new-inner-ChoiceDec').addClass('btn-outline-secondary');
                    }
                    break;
                case 1:
                    if($('#choice1').val()!='0'&&$('#choice2').val()!='0'&&$('#choice3').val()!='0'){
                        $('.new-inner-ChoiceDec').removeClass('btn-outline-secondary');
                        $('.new-inner-ChoiceDec').addClass('btn-danger');
                    }else{
                        $('.new-inner-ChoiceDec').removeClass('btn-danger');
                        $('.new-inner-ChoiceDec').addClass('btn-outline-secondary');
                    }
                    break;
                default:
                    console.error('choicerError');
                    break;
            }
        }
    });

    // プルダウン型決定ボタンをクリックした時
    $('.new-inner-ChoiceDec').on('click',function(){
        if(windowArea=='crystal'){
            switch (numAreaQuiz[windowArea]) {
                case 0:
                    if($('#choice1').val()=='3'&&$('#choice2').val()=='3'){
                        $('.new-inner-Success').fadeIn();
                        pushedSuccess();
                    }else{
                        $('.new-inner-Failed').fadeIn();
                    }
                    break;
                case 1:
                    if($('#choice1').val()=='1'&&$('#choice2').val()=='3'&&$('#choice3').val()=='2'){
                        $('.new-inner-Success').fadeIn();
                        pushedSuccess();
                    }else{
                        $('.new-inner-Failed').fadeIn();
                    }
                    break;
                default:
                    console.error('choiceError');
                    break;
            }
        }
    });

    // 正解を選んだ際にセッション追加
    function pushedSuccess(){
        if(windowArea != ''){
            //正解時時文章があれば設定
            switch(windowArea){
                case 'plateau':
                    if(numAreaQuiz[windowArea] == 0){
                        $('.new-inner-div').html('<p>【チャーム：かなで族の小さな笛】GET!!</p>');
                    }else if(numAreaQuiz[windowArea] == 1){
                        $('.new-inner-div').html('<p>【チャーム：かなで族のスカーフ】GET!!</p>');
                    }else if(numAreaQuiz[windowArea] == 2){
                        $('.new-inner-div').html('<p>【チャーム：蒼雷の武器飾り】GET!!</p>');
                    }
                    break;
                case 'frozen':
                    if(numAreaQuiz[windowArea] == 0){
                        $('.new-inner-div').html('<p>【家具：獣纏族の三本槍】GET!!</p>');
                    }else if(numAreaQuiz[windowArea] == 1){
                        $('.new-inner-div').html('<p>【家具：巨大魚の丸焼き】GET!!</p>');
                    }
                    break;
                default:
                        $('.new-inner-div').html('');
                    break;
            }

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
        shuffleImages(windowArea);
        $('.ansbtn-selected').removeClass('ansbtn-selected');
        $('.new-inner-decide').removeClass('btn-danger');
        $('.new-inner-decide').addClass('btn-outline-secondary');
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
        windowSelectedAns = '';
        innerWindow.fadeOut();
        $('.ansimg').attr('src','#');
        $('.ansbtn-selected').removeClass('ansbtn-selected');
        $('.new-inner-decide').removeClass('btn-danger');
        $('.new-inner-ChoiceDec').removeClass('btn-danger');
        $('.new-inner-decide').addClass('btn-outline-secondary');
        $('.new-inner-ChoiceDec').addClass('btn-outline-secondary');
        $('#choice1 option:first').prop('selected', true);
        $('#choice2 option:first').prop('selected', true);
        $('#choice3 option:first').prop('selected', true);
    }
    
    //りせっとぼたん
    $('.btn-reset').on('click',function(){
        numAreaQuiz = {'forest':0, 'wasteland':0, 'plateau':0, 'valley':0, 'crystal':0, 'frozen':0};
        if(isLocalStorageAvlbl() == true){
            strArea.forEach(area => {
                localStorage.removeItem(area);
            });
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

const shuffle = ([...array]) => {
    for (let i = array.length - 1; i >= 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }