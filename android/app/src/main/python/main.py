import pandas as pd
from os.path import dirname, join
filename = join(dirname(__file__), "libs/input_chat.csv")

df = pd.read_csv(filename)

chat_dic = {0: ['ㅎㅇ'], 1: ['하이'], 2: ['하위'], 3: ['하잉'], 4: ['하윙'], 5: ['해윙'], 6: ['해위'], 7: ['안녕'], 8: ['안농'], 9: ['안녕', '하세요'], 10: ['안녕', '하세여'], 11: ['안농', '하세요'], 12: ['ㄴㅆ'], 13: ['날씨'], 14: ['날씨', '어때'], 15: ['날씨', '어떤가'], 16: ['날씨', '궁금해'], 17: ['날씨', '뭔가요'], 18: ['날씨', '알려'], 19: ['날씨', '물어'], 20: ['ㅈㅂ'], 21: ['주변'], 22: ['주변', '관광지'], 23: ['주변', '뭐', '있나'], 24: ['주변', '먹을'], 25: ['주변', '볼거'], 26: ['주변', '할', '만한'], 27: ['주변', '추천']}
def chat(request):
    for k, v in chat_dic.items():
        chat_flag = False
        for word in v:
            if word in request:
                chat_flag = True
            else:
                chat_flag = False
                break
        if chat_flag:
            return df['response'][k]
    return "I do"