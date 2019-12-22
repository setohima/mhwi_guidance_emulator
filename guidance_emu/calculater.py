
def calcGuidanceLevel(rows):
    resultList = [1,1,1,1,1,1]
    for row in rows:
        #print(row['id'])
        kind = row['kind'].replace(" ","").split(',')
        minlevel = row['min'].replace(" ","").split(',')
        # split後の中の数字の種類数が同じになるはず
        if len(kind) == len(minlevel):
            #print('len ok')
            tmpkind = 0
            tmpmin = 0
            difflevel = 0
            # kindの中身の種類数 = minlevelの中身の種類数 回forループする
            for i in range(len(kind)):
                #print('roop start:' + str(i))
                #print('kind:' + kind[i])
                #print(' min:' + minlevel[i])
                #print(' resultList[int(kind[i])]:' + str(resultList[int(kind[i])-1]) )
                # kindとminlevelは文字列なので数字に修正
                if int(minlevel[i]) > resultList[int(kind[i])-1]:
                    #print('min > resultList[int(kind[i])]')
                    #ある組み合わせのkindに対応するminがtmp導きのレベルより高いなら
                    if difflevel < (int(minlevel[i]) - resultList[int(kind[i])-1]):
                        #print('difflevel <')
                        difflevel = int(minlevel[i]) - resultList[int(kind[i])-1]
                        tmpkind = int(kind[i])
                        tmpmin = int(minlevel[i])
                    elif difflevel != 0 and difflevel == (int(minlevel[i]) - resultList[int(kind[i])-1]):
                        #print('kind:' + kind[i], 'tmpkind:' + str(tmpkind))
                        # tmpkindとkind[i]が[1,2,5,3,6,4]のどこに属するか比較
                        priority = {"1":1, "2":2, "3":4, "4":6, "5":3, "6":5}
                        if priority[str(tmpkind)] < priority[kind[i]]:
                            difflevel = int(minlevel[i]) - resultList[int(kind[i])-1]
                            tmpkind = int(kind[i])
                            tmpmin = int(minlevel[i])
                        # end if
                else:
                    #print('min <= resultList[kind[i]] ')
                    #ある組み合わせのkindに対応するminは既に現在のtmp導きレベルで満たせる
                    tmpkind = 0
                    tmpmin = 0
                    difflevel = 0
                    break
                #end if
            #end for
            #print('tmpkind:' + str(tmpkind) + ' tmpmin:' + str(tmpmin) + ' difflevel:' + str(difflevel))
            if tmpkind != 0 and tmpmin != 0 and difflevel != 0:
                resultList[tmpkind - 1] = tmpmin
                #print("print:" + str(resultList))
            #end if
    return resultList